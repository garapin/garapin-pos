import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pos/data/api/response.dart';
import 'package:pos/data/api/services.dart';
import 'package:pos/data/models/base/filter_store_transaction.dart';
import 'package:pos/data/models/base/store.dart';
import 'package:pos/modules/report/cubit/report_transaction_cubit.dart';
import 'package:pos/data/models/base/report_transaction.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pos/engine/engine.dart';

part 'report_transaction_state.dart';

part 'report_transaction_cubit.freezed.dart';

class ReportTransactionCubit extends BaseCubit<ReportTransactionState> {
  ReportTransactionCubit(BuildContext context)
      : super(context, const ReportTransactionState());

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  void getData(String startDate, String endDate, {String filter = ""}) async {
    final data = await ApiService.getReportTransaction(
      context,
      startDate: startDate,
      endDate: endDate,
      database: state.targetDatabase ?? Sessions.getDatabaseModel()!.name!,
      start: 0,
      length: 1000,
      filter: filter,
    );
    if (data.isSuccess) {
      emit(state.copyWith(
          status: DataStateStatus.success, transaction: data.data, targetDatabase: state.targetDatabase ?? Sessions.getDatabaseModel()!.name!));
    } else {
      emit(state.copyWith(status: DataStateStatus.error));
    }
  }

  void setDateTimeRange(String datetimeRange, {String filter = ""}) {
    String dateTimeRange = datetimeRange;
    List<String> dates = dateTimeRange.split(" - ");
    DateTime startDate = DateTime.parse(dates[0]);
    DateTime endDate = DateTime.parse(dates[1]);

    String startIsoDate = DateFormat("yyyy-MM-dd").format(startDate);
    String endIsoDate = DateFormat("yyyy-MM-dd").format(endDate);

    print(startIsoDate);
    print(endIsoDate);
    getData(startIsoDate, endIsoDate, filter: filter);
    emit(state.copyWith(startDate: startIsoDate, endDate: endIsoDate));
  }

  void getStore() async {
    final storeInfo = await ApiService.getStoreInfo(context);
    ApiResponseList<FilterStoreTransaction>? filter;
    var store = storeInfo.data!.store;
    if (store!.storeType == "BUSSINESS_PARTNER") {
      filter = await ApiService.filterReport(context,
          bussinessPartnerDB: Sessions.getDatabaseModel()!.name!);
    } else if (store.storeType == "MERCHANT" && store.merChantRole == "SUPP") {
      filter = await ApiService.filterReport(context,
          bussinessPartnerDB: store.dbParent!);
    } else {
      emit(state.copyWith(targetDatabase: Sessions.getDatabaseModel()!.name));
      filter = null;
    }

    emit(
      state.copyWith(
        store: storeInfo.data,
        status: DataStateStatus.success,
        filterTemplate: filter?.data ??
            [
              FilterStoreTransaction(
                  dbName: Sessions.getDatabaseModel()!.name!,
                  templateName: storeInfo.data?.store?.storeName,
                  storeName: storeInfo.data?.store?.storeName)
            ],
      ),
    );
  }

  void setFilterDatabase(String targetDatabase) {
    emit(state.copyWith(targetDatabase: targetDatabase));
  }

  void clearTransaction() {
    emit(state.copyWith(transaction: ReportTransaction()));
  }

  Future<String> saveToExcel(String bufferExcel) async {
    final encodedStr = bufferExcel;
    Uint8List bytes = base64.decode(encodedStr);
    Directory? downloadDirectory = await getDownloadsDirectory();
    String dir = '/storage/emulated/0/Download/';
    print(dir);

    File file = File(
        "$dir/""report_transaction_${DateTime.now().millisecondsSinceEpoch}.xlsx");
    await file.writeAsBytes(bytes);
    showInfo("Export excel to Download Folder");
    await showNotification("Success", "Exported Report Transaction");
    return file.path;
  }

  Future<void> showNotification(String title, String body) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, title, body, platformChannelSpecifics);
  }

  @override
  Future<void> initData() async {
    DateTime startDate = DateTime.now();
    DateTime endDate = DateTime.now().add(const Duration(days: -7));

    String startIsoDate = DateFormat("yyyy-MM-dd").format(startDate.toUtc());
    String endIsoDate = DateFormat("yyyy-MM-dd").format(endDate.toUtc());

    getStore();
    getData(startIsoDate, endIsoDate);
  }

  @override
  void loadingState() {
    // TODO: implement loadingState
  }

  @override
  Future<void> refreshData() {
    // TODO: implement refreshData
    throw UnimplementedError();
  }
}

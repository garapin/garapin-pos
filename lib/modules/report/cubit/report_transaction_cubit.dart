import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:pos/data/api/services.dart';
import 'package:pos/data/models/base/filter_store_transaction.dart';
import 'package:pos/data/models/base/history_transaction.dart';
import 'package:pos/data/models/base/total_transaction.dart';
import 'package:pos/data/models/base/transaction_report.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/engine/helpers/options.dart';

import '../../../data/api/response.dart';
import '../../../data/models/base/store.dart';

part 'report_transaction_state.dart';
part 'report_transaction_cubit.freezed.dart';

class ReportTransactionCubit extends BaseCubit<ReportTransactionState> {
  final formKey = GlobalKey<FormBuilderState>();
  ReportTransactionCubit(BuildContext context)
      : super(context, ReportTransactionState());

  @override
  Future<void> initData({bool isRefresh = false, String param = ""}) async {
    loadingState();
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
    emit(state.copyWith(
        store: storeInfo.data,
        status: DataStateStatus.success,
        filterTemplate: filter?.data ??
            [
              FilterStoreTransaction(
                  dbName: Sessions.getDatabaseModel()!.name!,
                  templateName: storeInfo.data?.store?.storeName,
                  storeName: storeInfo.data?.store?.storeName)
            ],
        endDate: '${DateTime.now().toIso8601String()}Z',
        startDate:
            '${DateTime.now().subtract(Duration(days: 7)).toIso8601String()}Z'));
    // if (isRefresh) {
    //   getData(isRefresh: isRefresh, param: param);
    // } else {
    //   getData(
    //       isRefresh: isRefresh,
    //       param:
    //           'types=PAYMENT&created[gte]=${DateTime.now().subtract(Duration(days: 7)).toIso8601String()}Z&created[lte]=${DateTime.now().toIso8601String()}Z&limit=6');
    // }

    finishRefresh(state.status);
  }

  void selectfilterDatabase(String targetDatabase) {
    emit(state.copyWith(targetDatabase: targetDatabase));
  }

  void getDateTimeRange(String datetimeRange) {
    String dateTimeRange = datetimeRange;
    List<String> dates = dateTimeRange.split(" - ");
    DateTime startDate = DateTime.parse(dates[0]);
    DateTime endDate = DateTime.parse(dates[1]).add(Duration(days: 1));
    String startIsoDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(startDate.toUtc());
    String endIsoDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(endDate.toUtc());
    emit(state.copyWith(startDate: startIsoDate, endDate: endIsoDate));
  }

  Future<void> getData(
      {bool force = false, isRefresh = false, String param = ''}) async {
    loadingState(force: force);
    final storeInfo = await ApiService.getStoreInfo(context);
    List<TransactionReportData> dataList = state.transaction;
    var store = storeInfo.data!.store;

    final response = await ApiService.reportTransaction(context,
        param: param, targetDatabase: state.targetDatabase!);

    if (response.isSuccess) {
      if (isRefresh == true) dataList = [];
      dataList = dataList + response.data!.data!;
      DataStateStatus status = DataStateStatus.success;
      if (dataList.isEmpty) status = DataStateStatus.empty;
      emit(state.copyWith(
        status: status,
        param: response.data?.links == "" ? null : response.data?.links,
        transaction: dataList,
        canLoadMore: response.data?.hasMore ?? false,
      ));
    } else {
      if (dataList.isNotEmpty) {
        emit(state.copyWith(
          status: DataStateStatus.success,
          canLoadMore: false,
        ));
      } else {
        emit(state.copyWith(
          status: DataStateStatus.error,
          canLoadMore: false,
          err: "error",
        ));
      }
    }
    final data = await ApiService.totalTransaction(context,
        param: param, targetDatabase: state.targetDatabase!);
    emit(state.copyWith(totalTransaction: data.data));
    finishRefresh(state.status);
  }

  @override
  void loadingState({bool force = false}) {
    if (force) {
      emit(state.copyWith(status: DataStateStatus.initial));
    } else {
      if (state.transaction.isNotEmpty) {
        emit(state.copyWith(status: DataStateStatus.loading));
      } else {
        emit(state.copyWith(status: DataStateStatus.initial));
      }
    }
  }

  @override
  Future<void> loadMoreData() async {
    if (state.canLoadMore) {
      getData(param: state.param!);
    }
  }

  void cleanTransaction() {
    emit(state.copyWith(transaction: []));
  }

  @override
  Future<void> refreshData() => initData(
      param:
          'types=PAYMENT&created[gte]=${state.startDate}&created[lte]=${state.endDate}&limit=6');
}

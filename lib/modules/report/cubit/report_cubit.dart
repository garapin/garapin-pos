import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:pos/data/api/services.dart';
import 'package:pos/data/models/base/filter_store_transaction.dart';
import 'package:pos/data/models/base/history_transaction.dart';
import 'package:pos/data/models/base/total_bagi.dart';
import 'package:pos/engine/engine.dart';

import '../../../data/api/response.dart';
import '../../../data/models/base/store.dart';

part 'report_state.dart';
part 'report_cubit.freezed.dart';

class ReportCubit extends BaseCubit<ReportState> {
  final formKey = GlobalKey<FormBuilderState>();
  ReportCubit(BuildContext context) : super(context, ReportState());

  @override
  Future<void> initData({bool isRefresh = false, String param = ""}) async {
    loadingState();
    final storeInfo = await ApiService.getStoreInfo(context);
    ApiResponseList<FilterStoreTransaction>? filter;
    var store = storeInfo.data!.store;

    filter = await ApiService.filterReportBagiBagi(context,
        role: "TRX", bussinessPartnerDB: Sessions.getDatabaseModel()!.name!);
    // if (store!.storeType == "BUSSINESS_PARTNER") {
    //   filter = await ApiService.filterReport(context,
    //       role: "TRX",
    //       bussinessPartnerDB: Sessions.getDatabaseModel()!.name!);
    // } else if (store.storeType == "MERCHANT" && store.merChantRole == "SUPP") {
    //   filter = await ApiService.filterReport(context,
    //       role: "SUPP",
    //       bussinessPartnerDB: Sessions.getDatabaseModel()!.name!);
    //   print("INI FILTER");
    //   print(filter.data.length);
    // } else {
    //   emit(state.copyWith(targetDatabase: Sessions.getDatabaseModel()!.name));
    //   filter = null;
    // }
    emit(
      state.copyWith(
          store: storeInfo.data,
          status: DataStateStatus.success,
          filterTemplate: filter.data ??
              [
                FilterStoreTransaction(
                    dbName: Sessions.getDatabaseModel()!.name!,
                    templateName: storeInfo.data?.store?.storeName,
                    storeName: storeInfo.data?.store?.storeName)
              ],
          endDate: '${DateTime.now().toIso8601String()}Z',
          startDate:
              '${DateTime.now().subtract(const Duration(days: 7)).toIso8601String()}Z'),
    );
    finishRefresh(state.status);
  }

  void totalBagi({
    required MerchantRole role,
    String? databaseSupport,
    required String param,
    required String targetDatabase,
  }) async {
    final data = await ApiService.totalBagi(context,
        param: param,
        targetDatabase: targetDatabase,
        role: role,
        databaseSupport: databaseSupport);
    if (data.isSuccess) {
      emit(state.copyWith(totalBagi: data.data));
    } else {
      emit(state.copyWith(totalBagi: TotalBagi(netAmount: 0)));
    }
  }

  void selectfilterDatabase(String targetDatabase) {
    emit(state.copyWith(targetDatabase: targetDatabase));
  }

  void getDateTimeRange(String datetimeRange) {
    String dateTimeRange = datetimeRange;
    print(dateTimeRange);
    List<String> dates = dateTimeRange.split(" - ");
    DateTime startDate = DateTime.parse(dates[0]);
    DateTime endDate = DateTime.parse(dates[1]).add(Duration(days: 1));
    String startIsoDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(startDate.toUtc());
    String endIsoDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(endDate.toUtc());
    print("StartDate: $startIsoDate");
    print("EndDate: $endIsoDate");
    emit(state.copyWith(startDate: startIsoDate, endDate: endIsoDate));
  }

  Future<void> getData(
      {bool force = false, isRefresh = false, String param = ''}) async {
    loadingState(force: force);
    final storeInfo = await ApiService.getStoreInfo(context);
    List<Datum> dataList = state.transaction;
    var store = storeInfo.data!.store;

    final ApiResponse<HistoryTransaction>? response;
    if (store!.storeType == "BUSSINESS_PARTNER") {
      response = await ApiService.report(context,
          param: param, targetDatabase: state.targetDatabase!);
      totalBagi(
          role: MerchantRole.TRX,
          param: param,
          targetDatabase: state.targetDatabase!);
    } else if (store.storeType == "MERCHANT" && store.merChantRole == "SUPP") {
      response = await ApiService.reportSupport(context,
          param: param,
          targetDatabase: state.targetDatabase!,
          supportDatabse: Sessions.getDatabaseModel()!.name!);
      totalBagi(
          role: MerchantRole.SUPP,
          param: param,
          targetDatabase: state.targetDatabase!,
          databaseSupport: Sessions.getDatabaseModel()!.name!);
    } else if (store.merChantRole == "TRX" && store.storeType == "MERCHANT" ||
        store.storeType == "USER" && store.merChantRole == "NOT_MERCHANT") {
      response = await ApiService.report(
        context,
        param: param,
        targetDatabase: Sessions.getDatabaseModel()!.name!,
      );
      totalBagi(
          role: MerchantRole.TRX,
          param: param,
          targetDatabase: state.targetDatabase!);
    } else {
      response = null;
    }
    if (response!.isSuccess) {
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
          'types=PAYMENT&limit=6&created[gte]=${state.startDate}&created[lte]=${state.endDate}');
}

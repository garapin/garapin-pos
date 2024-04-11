import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pos/data/api/services.dart';
import 'package:pos/data/models/base/filter_store_transaction.dart';
import 'package:pos/data/models/base/history_transaction.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/engine/helpers/options.dart';

part 'report_state.dart';
part 'report_cubit.freezed.dart';

class ReportCubit extends BaseCubit<ReportState> {
  final formKey = GlobalKey<FormBuilderState>();
  ReportCubit(BuildContext context) : super(context, ReportState());

  @override
  Future<void> initData(
      {bool isRefresh = false,
      String param =
          "created[gte]=2024-02-01T12:00:00Z&created[lte]=2024-04-06T12:00:00Z"}) async {
    loadingState();
    final filter = await ApiService.filterReport(context);

    emit(state.copyWith(
        status: DataStateStatus.success,
        filterTemplate: filter.data,
        endDate: '${DateTime.now().toIso8601String()}Z',
        startDate:
            '${DateTime.now().subtract(Duration(days: 7)).toIso8601String()}Z'));
    // getData(isRefresh: isRefresh, param: param);
    finishRefresh(state.status);
  }

  // @override
  // Future<void> initData() async {
  //   loadingState();
  //   final filter = await ApiService.filterReport(context);
  //   final data = await ApiService.report(context);
  //   if (data.isSuccess) {
  //     if (data.data!.data!.isEmpty) {
  //       emit(state.copyWith(
  //           status: DataStateStatus.empty,
  //           transaction: data.data?.data ?? [],
  //           filterTemplate: filter.data));
  //     } else {
  //       emit(state.copyWith(
  //           status: DataStateStatus.success,
  //           transaction: data.data?.data ?? [],
  //           filterTemplate: filter.data));
  //     }
  //   } else {
  //     emit(state.copyWith(status: DataStateStatus.error));
  //   }
  //   finishRefresh(state.status);
  // }
  void selectfilterDatabase(String targetDatabase) {
    emit(state.copyWith(targetDatabase: targetDatabase));
  }

  void getDateTimeRange(String datetimeRange) {
    String dateTimeRange = datetimeRange;
    List<String> dates = dateTimeRange.split(" - ");
    DateTime startDate = DateTime.parse(dates[0]);
    DateTime endDate = DateTime.parse(dates[1]);
    String startIsoDate = '${startDate.toIso8601String()}Z';
    String endIsoDate = '${endDate.toIso8601String()}Z';
    print("StartDate: $startIsoDate");
    print("EndDate: $endIsoDate");
    emit(state.copyWith(startDate: startIsoDate, endDate: endIsoDate));
  }

  Future<void> getData(
      {bool force = false,
      isRefresh = false,
      String param =
          "created[gte]=2024-02-01T12:00:00Z&created[lte]=2024-04-06T12:00:00Z"}) async {
    loadingState(force: force);

    List<Datum> dataList = state.transaction;
    final response = await ApiService.report(context,
        param: 'types=PAYMENT&$param', targetDatabase: state.targetDatabase!);
    if (response.isSuccess) {
      if (isRefresh == true) dataList = [];
      dataList = dataList + response.data!.data!;
      DataStateStatus status = DataStateStatus.success;
      if (dataList.isEmpty) status = DataStateStatus.empty;

      emit(state.copyWith(
        status: status,
        param: response.data!.links!.isEmpty
            ? null
            : response.data?.links?.first.href,
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
    if (state.param != null) {
      getData(param: state.param!.replaceAll("/transactions?", ""));
    }
  }

  void cleanTransaction() {
    emit(state.copyWith(transaction: []));
  }

  @override
  Future<void> refreshData() => initData(
      param:
          'types=PAYMENT&created[gte]=${state.startDate}&created[lte]=${state.endDate}');
}

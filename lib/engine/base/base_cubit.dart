import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../widgets/components/notify.dart';
import '../helpers/options.dart';

abstract class BaseCubit<S> extends Cubit<S> {
  final refreshController = RefreshController();
  final BuildContext context;
  late RefresherOptions defaultRefresh;

  BaseCubit(this.context, S state) : super(state) {
    defaultRefresh = RefresherOptions(
      controller: refreshController,
      onRefresh: refreshData,
      enablePullUp: false,
    );
    initData();
  }

  void loadingState();

  void showError(String message) => ShowNotify.error(context, msg: message);

  void showInfo(String message) => ShowNotify.show(context, msg: message);

  void showSuccess(String message) => ShowNotify.success(context, msg: message);

  void showResponse(String message, status) =>
      ShowNotify.success(context, msg: message, apiStatus: status);

  void showLoading({String? message}) {
    EasyLoading.show(status: message, dismissOnTap: true);
  }

  void dismissLoading() => EasyLoading.dismiss();

  Future<void> initData();

  Future<void> refreshData();

  Future<void> loadMoreData() async {}

  void finishRefresh(DataStateStatus status) =>
      refresherState(controller: refreshController, status: status);
}

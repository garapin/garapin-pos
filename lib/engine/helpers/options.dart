import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

enum DataStateStatus { initial, loading, success, error, empty, updated }

class RefresherOptions {
  final RefreshController controller;
  final Function() onRefresh;
  final Function()? onLoading;
  final bool enablePullDown;
  final bool enablePullUp;
  final ScrollPhysics? physics;
  final bool? reverse;
  final ScrollController? scrollController;

  RefresherOptions({
    required this.controller,
    required this.onRefresh,
    this.onLoading,
    this.enablePullDown = true,
    this.enablePullUp = false,
    this.physics,
    this.reverse,
    this.scrollController,
  });
}

class ErrorOptions {
  final String? error;
  final TextStyle? errorStyle;
  final String? errorDescriptions;
  final TextStyle? errorDescriptionsStyle;
  final Widget? customError;
  final Image? errorImage;
  final Function()? onRefresh;

  ErrorOptions({
    this.error,
    this.errorStyle,
    this.errorDescriptions,
    this.errorDescriptionsStyle,
    this.customError,
    this.errorImage,
    this.onRefresh,
  });
}

class EmptyOptions {
  final String? empty;
  final TextStyle? emptyStyle;
  final String? emptyDescriptions;
  final TextStyle? emptyDescriptionsStyle;
  final Image? emptyImage;
  final Widget? customEmpty;

  EmptyOptions({
    this.empty,
    this.emptyStyle,
    this.emptyDescriptions,
    this.emptyDescriptionsStyle,
    this.emptyImage,
    this.customEmpty,
  });
}

void refresherState({
  required DataStateStatus status,
  required RefreshController controller,
}) {
  if (status == DataStateStatus.success ||
      status == DataStateStatus.empty ||
      status == DataStateStatus.updated) {
    if (controller.isRefresh) controller.refreshCompleted();
    if (controller.isLoading) controller.loadComplete();
  } else if (status == DataStateStatus.error) {
    if (controller.isRefresh) controller.refreshFailed();
    if (controller.isLoading) controller.loadFailed();
  }
}

extension DataStateStatusExt on DataStateStatus {
  bool isInitial() => this == DataStateStatus.initial;

  bool isLoading() => this == DataStateStatus.loading;

  bool isSuccess() => this == DataStateStatus.success;

  bool isError() => this == DataStateStatus.error;

  bool isEmpty() => this == DataStateStatus.empty;

  bool isUpdated() => this == DataStateStatus.updated;

  bool isOnGettingData() => isLoading() || isInitial();

  bool isIdle() => !isOnGettingData();
}

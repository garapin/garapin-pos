import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pos/data/api/services.dart';
import 'package:pos/data/models/base/split_payment_detail.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/engine/helpers/options.dart';

import '../../../engine/base/base_cubit.dart';

part 'report_detail_state.dart';
part 'report_detail_cubit.freezed.dart';

class ReportDetailCubit extends BaseCubit<ReportDetailState> {
  final Map<String, String> args;

  ReportDetailCubit(BuildContext context, this.args)
      : super(context, ReportDetailState());

  @override
  Future<void> initData() async {
    loadingState();
    final data = await ApiService.reportDetailBagi(context,
        invoice: args["invoice"]!, targetDatabase: args["database"]!);
    if (data.isSuccess) {
      emit(state.copyWith(status: DataStateStatus.success, split: data.data));
    } else {
      emit(state.copyWith(status: DataStateStatus.error));
    }
  }

  @override
  void loadingState() => emit(state.copyWith(status: DataStateStatus.initial));

  @override
  Future<void> refreshData() => initData();
}

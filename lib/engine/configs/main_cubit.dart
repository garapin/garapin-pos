import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../themes/themes.dart';

part 'main_cubit.freezed.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit()
      : super(MainState(
          theme: AppTheme().theme(AppColorData()),
        )) {
    initialize();
  }

  void initialize() {
    AppColorData appColorData =
        AppColorData(primary: AppColor.appColor.primary);
    emit(state.copyWith(theme: AppTheme().theme(appColorData)));
    var mySystemTheme = SystemUiOverlayStyle.light
        .copyWith(systemNavigationBarColor: appColorData.primary);
    SystemChrome.setSystemUIOverlayStyle(mySystemTheme);
  }

  void changeTheme() {
    AppColorData appColorData =
        AppColorData(primary: AppColor.appColor.primary);
    emit(state.copyWith(
      theme: AppTheme().theme(appColorData),
    ));
    // Sessions.setTheme(themeBase.toJson());
  }

  void changeTimezone() {}
}

@freezed
class MainState with _$MainState {
  const factory MainState({
    required ThemeData theme,
  }) = _MainState;
}

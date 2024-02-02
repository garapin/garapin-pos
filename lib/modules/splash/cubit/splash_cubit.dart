import 'dart:developer';
import 'package:armory/data/models/base/user.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../engine/configs/environment.dart';
import '../../../engine/helpers/sessions.dart';
import '../../../main.dart';
import '../../../routes/routes.dart';

class SplashCubit extends Cubit<String> {
  final BuildContext context;

  SplashCubit(this.context) : super(Environment.appIcon().path) {
    initialize();
  }

  void initialize() async {
    await InitialApps.start();
    sessionLogin();
  }

  void sessionLogin() {
    User? user = Sessions.getUserModel();
    if (user == null) {
      Future.delayed(const Duration(seconds: 1), () {
        context.go(RouteNames.login);
      });
    } else {
      if (user.role == "TEKNISI") {
        Future.delayed(const Duration(seconds: 1), () {
          context.go(RouteNames.dashboardTeknisi);
        });
      } else {
        Future.delayed(const Duration(seconds: 1), () {
          context.go(RouteNames.dashboard);
        });
      }
    }
  }
}

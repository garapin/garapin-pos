import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/engine/engine.dart';
import '../../../data/api/services.dart';
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
    String? isLogin = Sessions.getIsLogin();
    if (isLogin == "Y") {
      Future.delayed(const Duration(seconds: 1), () async {
        final data = await ApiService.getStoreInfo(context);
        if (data.isSuccess) {
          Sessions.setAccountHolder(
              jsonEncode(data.data!.store!.accountHolder));
          (data.data?.store?.storeName == null)
              ? context.pushNamed(RouteNames.profile)
              : (data.data?.store?.policy == true)
                  ? context.go(RouteNames.dashboard)
                  : context.go(RouteNames.policyWebview);
        }
        // context.go(RouteNames.dashboard);
      });
    } else {
      context.go(RouteNames.login);
    }

    //   User? user = Sessions.getUserModel();
    //   if (user == null) {
    //     Future.delayed(const Duration(seconds: 1), () {
    //       // context.go(RouteNames.login);
    //     });
    //   } else {
    //     if (user.role == "TEKNISI") {
    //       Future.delayed(const Duration(seconds: 1), () {
    //         // context.go(RouteNames.dashboardTeknisi);
    //       });
    //     } else {
    //       Future.delayed(const Duration(seconds: 1), () {
    //         // context.go(RouteNames.dashboard);
    //       });
    //     }
    //   }
    // }
  }
}

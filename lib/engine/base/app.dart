import 'dart:developer';
import 'package:pos/engine/engine.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../routes/routes.dart';

List<NavigatorObserver> observers = [];
double baseWidth = 0.0;
double baseHeight = 0.0;

class MyApp extends StatelessWidget {
  static final navigator = GlobalKey<NavigatorState>();
  static final mainRouter = Routes();

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      child: BlocProvider<MainCubit>(
        create: (context) => MainCubit(),
        child: BlocBuilder<MainCubit, MainState>(
          builder: (context, state) {
            return MaterialApp.router(
              // routerConfig: Routes.route,

              routeInformationProvider:
                  mainRouter.getRouteInformationProvider(),
              routeInformationParser: mainRouter.getRouteInformationParser(),
              routerDelegate: mainRouter.getRouterDelegate(),
              title: Environment.appName(),
              theme: state.theme,
              darkTheme: state.theme,
              locale: Environment.currentLanguages,

              debugShowCheckedModeBanner: false,
              builder: EasyLoading.init(
                builder: (context, child) {
                  if (kIsWeb) {
                    return OrientationBuilder(
                      builder: (ctx, orientation) {
                        if (orientation == Orientation.landscape) {
                          log('WEB MODE LANDSCAPE ${MediaQuery.of(context).size.height}');

                          baseHeight = MediaQuery.of(context).size.height;
                          double newWidth = baseHeight * 0.65;
                          baseWidth = MediaQuery.of(context).size.width * 0.5;

                          return Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Container(
                              width: newWidth,
                              decoration: BoxDecoration(
                                border: Border.symmetric(
                                  vertical: BorderSide(
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ),
                              child: child,
                            ),
                          );
                        } else {
                          baseHeight = MediaQuery.of(context).size.height;
                          baseWidth = MediaQuery.of(context).size.width;
                          return MediaQuery(
                            data: MediaQuery.of(context)
                                .copyWith(textScaler: TextScaler.linear(1.0)),
                            child: child ?? Container(),
                          );
                        }
                      },
                    );
                  } else {
                    baseHeight = MediaQuery.of(context).size.height;
                    baseWidth = MediaQuery.of(context).size.width;

                    final defaultColor = state.theme.primaryColor.darken();
                    const androidIconBrightness = Brightness.light;
                    SystemUiOverlayStyle style = SystemUiOverlayStyle(
                      statusBarColor: defaultColor,
                      statusBarIconBrightness: androidIconBrightness,
                    );

                    return AnnotatedRegion<SystemUiOverlayStyle>(
                      value: style,
                      child: MediaQuery(
                        data: MediaQuery.of(context)
                            .copyWith(textScaler: TextScaler.linear(1.0)),
                        child: child ?? Container(),
                      ),
                    );
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

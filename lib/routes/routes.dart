import 'package:armory/modules/auth/create_new_database/view/create_new_database.dart';
import 'package:armory/modules/auth/login/cubit/login_cubit.dart';
import 'package:armory/modules/auth/select_database/cubit/select_database_cubit.dart';
import 'package:armory/modules/auth/select_database/view/select_database.dart';
import 'package:armory/widgets/components/background_image.dart';
import 'package:armory/modules/dashboard/cubit/dashboard_cubit.dart';
import 'package:armory/modules/dashboard/dashboard.dart';
import 'package:armory/modules/splash/views/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../modules/auth/login/view/login.dart';
import '../modules/splash/cubit/splash_cubit.dart';
import '../widgets/components/unknown_page.dart';

part 'route_names.dart';

class Routes implements RouterInterface {
  static final route = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        name: RouteNames.root,
        path: RouteNames.root,
        builder: (ctx, GoRouterState state) {
          return BlocProvider(
            create: (ctx) => SplashCubit(ctx),
            child: const SplashPage(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.login,
        path: RouteNames.login,
        builder: (ctx, GoRouterState state) {
          return BlocProvider(
            create: (context) => LoginCubit(context),
            child: const LoginPage(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.selectDatababase,
        path: RouteNames.selectDatababase,
        builder: (ctx, GoRouterState state) {
          return BlocProvider(
            create: (context) => SelectDatabaseCubit(context),
            child: SelectDatabasePage(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.createNewDatabase,
        path: RouteNames.createNewDatabase,
        builder: (ctx, GoRouterState state) {
          return const CreateNewDatabasePage();
        },
      ),
      GoRoute(
        name: RouteNames.dashboard,
        path: RouteNames.dashboard,
        builder: (ctx, GoRouterState state) {
          return BlocProvider(
            create: (ctx) => DashboardCubit(ctx),
            child: const DashboardPage(),
          );
        },
      ),
      // GoRoute(
      //   name: RouteNames.detail,
      //   path: '${RouteNames.root}/:param1/:param2',
      //   builder: (ctx, GoRouterState state) {
      //     final String param1 = state.params['param1'] ?? '';
      //     final String param2 = state.params['param2'] ?? '';
      //     return BlocProvider(
      //       create: (ctx) =>
      //           DetailCubit(ctx, param1, param2), // Use param1 and param2 here
      //       child: const DetailPage(),
      //     );
      //   },
      // ),
    ],
    errorBuilder: (ctx, GoRouterState state) {
      return const UnknownPage();
    },
  );

  @override
  RouteInformationParser<Object> getRouteInformationParser() =>
      route.routeInformationParser;

  @override
  RouteInformationProvider? getRouteInformationProvider() =>
      route.routeInformationProvider;

  @override
  RouterDelegate<Object> getRouterDelegate() => route.routerDelegate;
}

abstract class RouterInterface {
  RouteInformationProvider? getRouteInformationProvider();

  RouteInformationParser<Object> getRouteInformationParser();

  RouterDelegate<Object> getRouterDelegate();
}

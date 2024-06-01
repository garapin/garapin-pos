import 'package:pos/modules/auth/create_new_database/cubit/create_new_database_cubit.dart';
import 'package:pos/modules/auth/create_new_database/view/create_new_database.dart';
import 'package:pos/modules/auth/login/cubit/login_cubit.dart';
import 'package:pos/modules/auth/select_database/cubit/select_database_cubit.dart';
import 'package:pos/modules/auth/select_database/view/select_database.dart';
import 'package:pos/modules/cart/cubit/cart_cubit.dart';
import 'package:pos/modules/dashboard/master/cubit/master_cubit.dart';
import 'package:pos/modules/dashboard/master/pages/bagi/cubit/create_bagi_cubit.dart';
import 'package:pos/modules/dashboard/master/pages/bagi/view/create_bagi.dart';
import 'package:pos/modules/dashboard/profile/view/profile.dart';
import 'package:pos/modules/dashboard/withdrawl/cubit/withdrawl_cubit.dart';
import 'package:pos/modules/product/create_product/cubit/create_product_cubit.dart';
import 'package:pos/modules/product/create_product/view/create_product.dart';
import 'package:pos/modules/dashboard/catalog/cubit/catalog_cubit.dart';
import 'package:pos/modules/dashboard/profile/cubit/profile_cubit.dart';
import 'package:pos/modules/product/edit_product/cubit/edit_product_cubit.dart';
import 'package:pos/modules/product/edit_product/view/edit_product.dart';
import 'package:pos/modules/report/cubit/detail_transaction_product_cubit.dart';
import 'package:pos/modules/report/cubit/report_detail_cubit.dart';
import 'package:pos/modules/report/master_report/cubit/master_report_cubit.dart';
import 'package:pos/modules/report/master_report/view/master_report.dart';
import 'package:pos/modules/report/view/detail_trasaction_product.dart';
import 'package:pos/modules/report/view/report_bagi_detail.dart';
import 'package:pos/widgets/components/background_image.dart';
import 'package:pos/modules/dashboard/cubit/dashboard_cubit.dart';
import 'package:pos/modules/dashboard/dashboard.dart';
import 'package:pos/modules/splash/views/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../modules/auth/login/view/login.dart';
import '../modules/history_transaction/cubit/history_transaction_cubit.dart';
import '../modules/splash/cubit/splash_cubit.dart';
import '../policy_webview.dart';
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
            child: const SelectDatabasePage(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.createNewDatabase,
        path: RouteNames.createNewDatabase,
        builder: (ctx, GoRouterState state) {
          return BlocProvider(
            create: (context) => CreateNewDatabaseCubit(context),
            child: const CreateNewDatabasePage(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.dashboard,
        path: RouteNames.dashboard,
        builder: (ctx, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => DashboardCubit(ctx),
              ),
              BlocProvider(
                create: (context) => CatalogCubit(ctx),
              ),
              BlocProvider(
                create: (context) => ProfileCubit(ctx),
              ),
              BlocProvider(
                create: (context) => CartCubit(ctx),
              ),
              BlocProvider(
                create: (context) => MasterCubit(ctx),
              ),
              BlocProvider(
                create: (context) => MasterReportCubit(ctx),
              ),
              BlocProvider(
                  create: (context) => HistoryTransactionCubit(context)),
              BlocProvider(create: (context) => WithdrawlCubit(context)),
            ],
            child: const DashboardPage(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.cretaeProduct,
        path: RouteNames.cretaeProduct,
        builder: (ctx, GoRouterState state) {
          return BlocProvider(
            create: (context) => CreateProductCubit(context),
            child: const CreateProductPage(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.editProduct,
        path: RouteNames.editProduct,
        builder: (ctx, GoRouterState state) {
          return BlocProvider(
            create: (context) =>
                EditProductCubit(context, state.extra as String),
            child: const EditProductPage(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.profile,
        path: RouteNames.profile,
        builder: (ctx, GoRouterState state) {
          return BlocProvider(
            create: (context) => DashboardCubit(context),
            child: BlocProvider(
              create: (context) => ProfileCubit(context),
              child: const ProfilePage(),
            ),
          );
        },
      ),
      GoRoute(
        name: RouteNames.createBagi,
        path: RouteNames.createBagi,
        builder: (ctx, GoRouterState state) {
          return BlocProvider(
            create: (context) =>
                CreateBagiCubit(context, state.extra as String),
            child: const CreateBagiPage(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.reportBagiDretail,
        path: RouteNames.reportBagiDretail,
        builder: (ctx, GoRouterState state) {
          return BlocProvider(
            create: (context) =>
                ReportDetailCubit(context, state.extra as Map<String, String>),
            child: const ReportBagiDretail(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.detailTransactionProduct,
        path: RouteNames.detailTransactionProduct,
        builder: (ctx, GoRouterState state) {
          return BlocProvider(
            create: (context) => DetailTransactionProductCubit(
                context, state.extra as Map<String, String>),
            child: const DetailTransactionProduct(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.policyWebview,
        path: RouteNames.policyWebview,
        builder: (ctx, GoRouterState state) {
          return const PolicyWebview();
        },
      ),

      // GoRoute(
      //   name: RouteNames.masterReport,
      //   path: RouteNames.masterReport,
      //   builder: (ctx, GoRouterState state) {
      //     return BlocProvider(
      //       create: (context) => MasterReportCubit(
      //         context,
      //       ),
      //       child: const MasterReportPage(),
      //     );
      //   },
      // ),

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

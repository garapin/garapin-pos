import 'package:abditrack_inventory/data/models/base/cart.dart';
import 'package:abditrack_inventory/data/models/base/instalation_vehicle.dart';
import 'package:abditrack_inventory/data/models/base/transaction_item.dart';
import 'package:abditrack_inventory/modules/add_product/cubit/add_product_cubit.dart';
import 'package:abditrack_inventory/modules/add_product/view/add_product.dart';
import 'package:abditrack_inventory/modules/add_to_cart/cubit/add_to_cart_cubit.dart';
import 'package:abditrack_inventory/modules/add_to_cart/view/add_to_cart.dart';
import 'package:abditrack_inventory/modules/auth/login/cubit/login_cubit.dart';
import 'package:abditrack_inventory/modules/auth/login/view/login.dart';
import 'package:abditrack_inventory/modules/cart/cubit/cart_cubit.dart';
import 'package:abditrack_inventory/modules/cart/view/cart.dart';
import 'package:abditrack_inventory/modules/catalog/cubit/catalog_cubit.dart';
import 'package:abditrack_inventory/modules/create_product/cubit/create_product_cubit.dart';
import 'package:abditrack_inventory/modules/create_product/view/create_product.dart';
import 'package:abditrack_inventory/modules/dashboard/dashboard.dart';
import 'package:abditrack_inventory/modules/edit_product/cubit/edit_product_cubit.dart';
import 'package:abditrack_inventory/modules/edit_product/view/edit_product.dart';
import 'package:abditrack_inventory/modules/homepage/cubit/homepage_cubit.dart';
import 'package:abditrack_inventory/modules/installed_vehicle/cubit/installed_vehicle_cubit.dart';
import 'package:abditrack_inventory/modules/installed_vehicle/view/installed_vehicle.dart';
import 'package:abditrack_inventory/modules/product_detail/cubit/product_detail_cubit.dart';
import 'package:abditrack_inventory/modules/product_detail/view/product_detail.dart';
import 'package:abditrack_inventory/modules/profile/cubit/profile_cubit.dart';
import 'package:abditrack_inventory/modules/profile/view/profile.dart';
import 'package:abditrack_inventory/modules/teknisi/instalation/cubit/list_item_instalation_cubit.dart';
import 'package:abditrack_inventory/modules/teknisi/instalation/cubit/process_instalation_item_cubit.dart';
import 'package:abditrack_inventory/modules/teknisi/instalation/view/list_item_instalation.dart';
import 'package:abditrack_inventory/modules/teknisi/instalation/view/process_instalation_item.dart';
import 'package:abditrack_inventory/modules/teknisi/transaction/list_transaction/cubit/list_transaction_teknisi_cubit.dart';
import 'package:abditrack_inventory/modules/teknisi/transaction/list_transaction/view/list_transaction_teknisi.dart';
import 'package:abditrack_inventory/modules/transaction/detail_transaction/cubit/detail_transaction_cubit.dart';
import 'package:abditrack_inventory/modules/transaction/detail_transaction/view/detail_transaction.dart';
import 'package:abditrack_inventory/modules/transaction/list_transaction/cubit/list_transaction_cubit.dart';
import 'package:abditrack_inventory/modules/transaction/list_transaction/view/list_transaction.dart';
import 'package:abditrack_inventory/modules/users/add_user/cubit/add_user_cubit.dart';
import 'package:abditrack_inventory/modules/users/add_user/view/add_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../modules/splash/cubit/splash_cubit.dart';
import '../modules/splash/views/splash_page.dart';
import '../modules/teknisi/dashboard_teknisi/dashboard_teknisi.dart';
import '../modules/teknisi/homepage_teknisi/cubit/home_page_teknisi_cubit.dart';
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
        name: RouteNames.profile,
        path: RouteNames.profile,
        builder: (ctx, GoRouterState state) {
          return BlocProvider(
            create: (context) => ProfileCubit(ctx),
            child: ProfilePage(),
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
                create: (context) => ProfileCubit(ctx),
              ),
              BlocProvider(
                create: (ctx) => DashboardCubit(ctx),
              ),
              BlocProvider(
                create: (ctx) => HomepageCubit(ctx),
              ),
              BlocProvider(
                create: (context) => CatalogCubit(context),
              ),
              BlocProvider(
                create: (context) => CartCubit(context),
              ),
              BlocProvider(
                create: (context) => ListTransactionCubit(context),
              ),
            ],
            child: const DashboardPage(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.dashboardTeknisi,
        path: RouteNames.dashboardTeknisi,
        builder: (ctx, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => HomePageTeknisiCubit(ctx),
              ),
              BlocProvider(
                create: (context) => ProfileCubit(ctx),
              ),
              BlocProvider(
                create: (ctx) => DashboardTeknisiCubit(ctx),
              ),
              BlocProvider(
                create: (context) => CatalogCubit(context),
              ),
              BlocProvider(
                create: (context) => CartCubit(context),
              ),
              BlocProvider(
                create: (context) => ListTransactionTeknisiCubit(context),
              ),
            ],
            child: const DashboardTeknisiPage(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.productDetail,
        path: RouteNames.productDetail,
        builder: (ctx, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (ctx) =>
                    ProductDetailCubit(ctx, state.extra.toString()),
              ),
            ],
            child: const ProductDetailPage(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.editProduct,
        path: RouteNames.editProduct,
        builder: (ctx, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (ctx) => EditProductCubit(ctx, state.extra as int),
              ),
            ],
            child: const EditProductPage(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.cart,
        path: RouteNames.cart,
        builder: (ctx, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (ctx) => CartCubit(ctx),
              ),
            ],
            child: const CartPage(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.login,
        path: RouteNames.login,
        builder: (ctx, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (ctx) => LoginCubit(ctx),
              ),
            ],
            child: const LoginPage(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.addProduct,
        path: RouteNames.addProduct,
        builder: (ctx, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (ctx) => AddProductCubit(ctx),
              ),
            ],
            child: const AddProductPage(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.addToCart,
        path: RouteNames.addToCart,
        builder: (ctx, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (ctx) => AddToCartCubit(ctx),
              ),
            ],
            child: const AddToCartPage(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.listTransaction,
        path: RouteNames.listTransaction,
        builder: (ctx, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (ctx) => ListTransactionCubit(ctx),
              ),
            ],
            child: const ListTransactionPage(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.createProduct,
        path: RouteNames.createProduct,
        builder: (ctx, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (ctx) => CreateProductCubit(ctx),
              ),
            ],
            child: const CreateProductPage(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.detailTransaction,
        path: RouteNames.detailTransaction,
        builder: (ctx, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (ctx) => DetailTransactionCubit(
                    ctx, state.extra as Map<String, dynamic>),
              ),
            ],
            child: const DetailTransactionPage(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.addUser,
        path: RouteNames.addUser,
        builder: (ctx, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (ctx) => AddUserCubit(ctx),
              ),
            ],
            child: const AddUserPage(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.listTransactionTeknisi,
        path: RouteNames.listTransactionTeknisi,
        builder: (ctx, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (ctx) => ListTransactionTeknisiCubit(ctx),
              ),
            ],
            child: const ListTransactionTeknisiPage(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.listItemInstalation,
        path: RouteNames.listItemInstalation,
        builder: (ctx, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (ctx) => ListItemInstalationCubit(ctx,
                    idTransaction: state.extra as int),
              ),
            ],
            child: const ListItemInstalation(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.processInstalationItem,
        path: RouteNames.processInstalationItem,
        builder: (ctx, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (ctx) => ProcessInstalationItemCubit(ctx,
                    listItem: state.extra as List<TransactionItem>),
              ),
            ],
            child: const ProcessInstalationItem(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.installedVehicle,
        path: RouteNames.installedVehicle,
        builder: (ctx, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (ctx) => InstalledVehicleCubit(
                    ctx, state.extra as Map<String, dynamic>),
              ),
            ],
            child: InstalledVehicle(),
          );
        },
      ),
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

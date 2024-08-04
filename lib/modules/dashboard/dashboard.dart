import 'dart:developer';

import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pos/data/models/base/database.dart';
import 'package:pos/data/models/base/user.dart' as userModel;
import 'package:pos/engine/engine.dart';
import 'package:pos/modules/auth/locked_account/cubit/locked_account_cubit.dart';
import 'package:pos/modules/auth/locked_account/cubit/locked_account_state.dart';
import 'package:pos/modules/auth/locked_account/view/locked_account_page.dart';
import 'package:pos/modules/checkout/cubit/checkout_cubit.dart';
import 'package:pos/modules/dashboard/catalog/cubit/catalog_cubit.dart';
import 'package:pos/modules/dashboard/cubit/dashboard_cubit.dart';
import 'package:pos/modules/dashboard/profile/cubit/profile_cubit.dart';
import 'package:pos/modules/dashboard/withdrawl/cubit/withdrawl_cubit.dart';
import 'package:pos/modules/report/master_report/cubit/master_report_cubit.dart';
import 'package:pos/resources/resources.dart';
import 'package:pos/routes/routes.dart';
import 'package:pos/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/widgets.dart';
import 'catalog/view/catalog.dart';
import 'master/cubit/master_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final masterCubit = context.read<MasterCubit>();
    final masterReportCubit = context.read<MasterReportCubit>();
    final cubit = context.read<DashboardCubit>();
    final lockedAcc = context.read<LockedAccountCubit>();
    lockedAcc.getStore();

    return MultiBlocListener(
      listeners: [
        BlocListener<LockedAccountCubit, LockedAccountState>(
            listener: (context, state) {
          if (state.status == DataStateStatus.success) {
            userModel.User? user = Sessions.getUserModel();
            Database? database = Sessions.getDatabaseModel();

            if (state.store?.store?.storeStatus == "LOCKED") {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) {
                  return BlocProvider(
                    create: (context) => LockedAccountCubit(context),
                    child: BlocBuilder<LockedAccountCubit, LockedAccountState>(
                      builder: (context, stateLck) {
                        return AlertDialog(
                          title: const Text(
                            "Informasi",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          actions: [
                            stateLck.paymentStatus == PaymentStatus.pending
                                ? TextButton(
                                    onPressed: () async {
                                      if (stateLck.invoices != null) {
                                        context
                                            .read<LockedAccountCubit>()
                                            .cancelCheckout(
                                              stateLck.invoices!.invoice!,
                                            );
                                      }

                                      final GoogleSignInAccount? s =
                                          await GoogleSignIn().signOut();
                                      Sessions.clear().then((value) =>
                                          context.go(RouteNames.root));
                                      context.pop();
                                    },
                                    child: const Text(
                                      "Batalkan",
                                    ),
                                  )
                                : Container(),
                          ],
                          content: SizedBox(
                            width: 500,
                            child: LockedAccountPage(
                              fromDashboard: true,
                              user: user!,
                              selectedDB: database!.name!,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            }
          }
        })
      ],
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return ContainerStateHandler(
            status: DataStateStatus.success,
            loading: const SizedBox(),
            child: Scaffold(
              appBar: AppBar(
                elevation: 2,
                shadowColor: AppColor.appColor.primary,
                backgroundColor: Colors.white,
                title: Text(
                  state.store?.store?.storeName ?? "",
                  style: AppFont.largePrimary(context)!.copyWith(fontSize: 16),
                ),
                actions: const [
                  ActionAppBar(),
                ],
              ),
              body: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<DashboardCubit, DashboardState>(
                    builder: (context, state) {
                      return ContainerStateHandler(
                        status: state.status,
                        loading: const SizedBox(),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColor.appColor.primary, width: 1)),
                          width: baseWidth * 0.075,
                          height: baseHeight,
                          child: SingleChildScrollView(
                            child: Builder(builder: (context) {
                              var store = state.store?.store;
                              if (store?.storeType == "BUSSINESS_PARTNER" ) {
                                return Column(
                                  children: [
                                    const SizedBox(height: 8),
                                    (Sessions.getDatabaseModel()?.role !=
                                            "ADMIN")
                                        ? const SizedBox()
                                        : CustomButton(
                                            onPressed: () {
                                              masterCubit.showPage(true);
                                              masterCubit.initData();
                                              cubit.changePage(1);
                                            },
                                            child: state.index == 1
                                                ? Resources.images.catalogActive
                                                    .image(
                                                        height: 65, width: 60)
                                                : Resources
                                                    .images.catalogInactive
                                                    .image(
                                                        height: 65, width: 60)),
                                    const SizedBox(height: 8),
                                    CustomButton(
                                        onPressed: () {
                                          masterReportCubit.showPage(true);
                                          masterReportCubit.initData();
                                          cubit.changePage(2);
                                        },
                                        child: state.index == 2
                                            ? Resources.images.reportActive
                                                .image(height: 65, width: 60)
                                            : Resources.images.reportInactive
                                                .image(height: 65, width: 60)),
                                    const SizedBox(height: 8),
                                    (Sessions.getDatabaseModel()?.role !=
                                            "ADMIN")
                                        ? const SizedBox()
                                        : CustomButton(
                                            onPressed: () {
                                              context
                                                  .read<WithdrawlCubit>()
                                                  .initData();
                                              cubit.changePage(5);
                                            },
                                            child: state.index == 5
                                                ? Resources
                                                    .images.icWithdrawlActive
                                                    .image(
                                                        height: 65, width: 60)
                                                : Resources
                                                    .images.icWithdrawlInactive
                                                    .image(
                                                        height: 65, width: 60)),
                                    const SizedBox(height: 8),
                                    (Sessions.getDatabaseModel()?.role !=
                                            "ADMIN")
                                        ? const SizedBox()
                                        : CustomButton(
                                            onPressed: () {
                                              context
                                                  .read<ProfileCubit>()
                                                  .initData();
                                              cubit.changePage(3);
                                            },
                                            child: state.index == 3
                                                ? Resources.images.profileActive
                                                    .image(
                                                        height: 65, width: 60)
                                                : Resources
                                                    .images.profileInactive
                                                    .image(
                                                        height: 65, width: 60)),
                                    const SizedBox(height: 30),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: CustomButton(
                                          onPressed: () async {
                                            await GoogleSignIn().signOut();
                                            await FirebaseAuth.instance
                                                .signOut();
                                            Sessions.clear().then((value) =>
                                                context.go(RouteNames.root));
                                          },
                                          child: const Icon(
                                            Icons.logout,
                                            size: 30,
                                            color: Colors.red,
                                          )),
                                    ),
                                    const SizedBox(height: 40)
                                  ],
                                );
                              } else if (store?.storeType == "USER") {
                                return Column(
                                  children: [
                                    const SizedBox(height: 8),
                                    CustomButton(
                                        onPressed: () {
                                          cubit.changePage(0);
                                        },
                                        child: state.index == 0
                                            ? Resources
                                                .images.appetizercashierActive
                                                .image(height: 65, width: 60)
                                            : Resources
                                                .images.appetizercashierInactive
                                                .image(height: 65, width: 60)),
                                    const SizedBox(height: 8),
                                    (Sessions.getDatabaseModel()?.role !=
                                            "ADMIN")
                                        ? const SizedBox()
                                        : CustomButton(
                                            onPressed: () {
                                              masterCubit.showPage(true);
                                              masterCubit.initData();
                                              cubit.changePage(1);
                                            },
                                            child: state.index == 1
                                                ? Resources.images.catalogActive
                                                    .image(
                                                        height: 65, width: 60)
                                                : Resources
                                                    .images.catalogInactive
                                                    .image(
                                                        height: 65, width: 60)),
                                    const SizedBox(height: 8),
                                    CustomButton(
                                        onPressed: () {
                                          masterReportCubit.showPage(true);
                                          masterReportCubit.initData();
                                          cubit.changePage(2);
                                        },
                                        child: state.index == 2
                                            ? Resources.images.reportActive
                                                .image(height: 65, width: 60)
                                            : Resources.images.reportInactive
                                                .image(height: 65, width: 60)),
                                    const SizedBox(height: 8),
                                    (Sessions.getDatabaseModel()?.role !=
                                            "ADMIN")
                                        ? const SizedBox()
                                        : CustomButton(
                                            onPressed: () {
                                              context
                                                  .read<WithdrawlCubit>()
                                                  .initData();
                                              cubit.changePage(5);
                                            },
                                            child: state.index == 5
                                                ? Resources
                                                    .images.icWithdrawlActive
                                                    .image(
                                                        height: 65, width: 60)
                                                : Resources
                                                    .images.icWithdrawlInactive
                                                    .image(
                                                        height: 65, width: 60)),
                                    const SizedBox(height: 8),
                                    (Sessions.getDatabaseModel()?.role !=
                                            "ADMIN")
                                        ? const SizedBox()
                                        : CustomButton(
                                            onPressed: () {
                                              context
                                                  .read<ProfileCubit>()
                                                  .initData();
                                              cubit.changePage(3);
                                            },
                                            child: state.index == 3
                                                ? Resources.images.profileActive
                                                    .image(
                                                        height: 65, width: 60)
                                                : Resources
                                                    .images.profileInactive
                                                    .image(
                                                        height: 65, width: 60)),
                                    const SizedBox(height: 30),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: CustomButton(
                                          onPressed: () async {
                                            await GoogleSignIn().signOut();
                                            await FirebaseAuth.instance
                                                .signOut();
                                            Sessions.clear().then((value) =>
                                                context.go(RouteNames.root));
                                          },
                                          child: const Icon(
                                            Icons.logout,
                                            size: 30,
                                            color: Colors.red,
                                          )),
                                    ),
                                    const SizedBox(height: 40)
                                  ],
                                );
                              } else if (store?.storeType == "MERCHANT") {
                                if (state.store?.store?.merChantRole ==
                                    "SUPP") {
                                  return Column(
                                    children: [
                                      const SizedBox(height: 8),
                                      (Sessions.getDatabaseModel()?.role !=
                                          "ADMIN")
                                          ? const SizedBox()
                                          : CustomButton(
                                          onPressed: () {
                                            masterCubit.showPage(true);
                                            masterCubit.initData();
                                            cubit.changePage(1);
                                          },
                                          child: state.index == 1
                                              ? Resources.images.catalogActive
                                              .image(
                                              height: 65, width: 60)
                                              : Resources
                                              .images.catalogInactive
                                              .image(
                                              height: 65, width: 60)),
                                      const SizedBox(height: 8),
                                      CustomButton(
                                          onPressed: () {
                                            cubit.changePage(2);
                                            masterReportCubit.showPage(true);
                                            masterReportCubit.initData();
                                          },
                                          child: state.index == 2
                                              ? Resources.images.reportActive
                                                  .image(height: 65, width: 60)
                                              : Resources.images.reportInactive
                                                  .image(
                                                      height: 65, width: 60)),
                                      const SizedBox(height: 8),
                                      (Sessions.getDatabaseModel()?.role !=
                                              "ADMIN")
                                          ? const SizedBox()
                                          : CustomButton(
                                              onPressed: () {
                                                context
                                                    .read<WithdrawlCubit>()
                                                    .initData();
                                                cubit.changePage(5);
                                              },
                                              child: state.index == 5
                                                  ? Resources
                                                      .images.icWithdrawlActive
                                                      .image(
                                                          height: 65, width: 60)
                                                  : Resources.images
                                                      .icWithdrawlInactive
                                                      .image(
                                                          height: 65,
                                                          width: 60)),
                                      const SizedBox(height: 8),
                                      (Sessions.getDatabaseModel()?.role !=
                                              "ADMIN")
                                          ? const SizedBox()
                                          : CustomButton(
                                              onPressed: () {
                                                context
                                                    .read<ProfileCubit>()
                                                    .initData();
                                                cubit.changePage(3);
                                              },
                                              child: state.index == 3
                                                  ? Resources
                                                      .images.profileActive
                                                      .image(
                                                          height: 65, width: 60)
                                                  : Resources
                                                      .images.profileInactive
                                                      .image(
                                                          height: 65,
                                                          width: 60)),
                                      const SizedBox(height: 30),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: CustomButton(
                                            onPressed: () async {
                                              await GoogleSignIn().signOut();
                                              await FirebaseAuth.instance
                                                  .signOut();
                                              Sessions.clear().then((value) =>
                                                  context.go(RouteNames.root));
                                            },
                                            child: const Icon(
                                              Icons.logout,
                                              size: 30,
                                              color: Colors.red,
                                            )),
                                      ),
                                      const SizedBox(height: 40)
                                    ],
                                  );
                                } else if (store?.merChantRole == "TRX") {
                                  return Column(
                                    children: [
                                      const SizedBox(height: 8),
                                      CustomButton(
                                          onPressed: () {
                                            context
                                                .read<CatalogCubit>()
                                                .initData();
                                            cubit.changePage(0);
                                          },
                                          child: state.index == 0
                                              ? Resources
                                                  .images.appetizercashierActive
                                                  .image(height: 65, width: 60)
                                              : Resources.images
                                                  .appetizercashierInactive
                                                  .image(
                                                      height: 65, width: 60)),
                                      const SizedBox(height: 8),
                                      (Sessions.getDatabaseModel()?.role !=
                                              "ADMIN")
                                          ? const SizedBox()
                                          : CustomButton(
                                              onPressed: () {
                                                masterCubit.showPage(true);
                                                masterCubit.initData();
                                                cubit.changePage(1);
                                              },
                                              child: state.index == 1
                                                  ? Resources
                                                      .images.catalogActive
                                                      .image(
                                                          height: 65, width: 60)
                                                  : Resources
                                                      .images.catalogInactive
                                                      .image(
                                                          height: 65,
                                                          width: 60)),
                                      const SizedBox(height: 8),
                                      CustomButton(
                                          onPressed: () async {
                                            log("asdasd");
                                            masterReportCubit.showPage(true);
                                            masterReportCubit.initData();
                                            cubit.changePage(2);
                                          },
                                          child: state.index == 2
                                              ? Resources.images.reportActive
                                                  .image(height: 65, width: 60)
                                              : Resources.images.reportInactive
                                                  .image(
                                                      height: 65, width: 60)),
                                      const SizedBox(height: 8),
                                      (Sessions.getDatabaseModel()?.role !=
                                              "ADMIN")
                                          ? const SizedBox()
                                          : CustomButton(
                                              onPressed: () {
                                                context
                                                    .read<WithdrawlCubit>()
                                                    .initData();
                                                cubit.changePage(5);
                                              },
                                              child: state.index == 5
                                                  ? Resources
                                                      .images.icWithdrawlActive
                                                      .image(
                                                          height: 65, width: 60)
                                                  : Resources.images
                                                      .icWithdrawlInactive
                                                      .image(
                                                          height: 65,
                                                          width: 60)),
                                      const SizedBox(height: 8),
                                      (Sessions.getDatabaseModel()?.role !=
                                              "ADMIN")
                                          ? const SizedBox()
                                          : CustomButton(
                                              onPressed: () {
                                                context
                                                    .read<ProfileCubit>()
                                                    .initData();
                                                cubit.changePage(3);
                                              },
                                              child: state.index == 3
                                                  ? Resources
                                                      .images.profileActive
                                                      .image(
                                                          height: 65, width: 60)
                                                  : Resources
                                                      .images.profileInactive
                                                      .image(
                                                          height: 65,
                                                          width: 60)),
                                      const SizedBox(height: 30),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: CustomButton(
                                            onPressed: () async {
                                              await GoogleSignIn().signOut();
                                              await FirebaseAuth.instance
                                                  .signOut();
                                              Sessions.clear().then((value) =>
                                                  context.go(RouteNames.root));
                                            },
                                            child: const Icon(
                                              Icons.logout,
                                              size: 30,
                                              color: Colors.red,
                                            )),
                                      ),
                                      const SizedBox(height: 40)
                                    ],
                                  );
                                } else {
                                  return const SizedBox();
                                }
                              } else {
                                return const SizedBox();
                              }
                            }),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    width: baseWidth * 0.925,
                    child: BlocBuilder<DashboardCubit, DashboardState>(
                      builder: (context, state) {
                        return ContainerStateHandler(
                            loading: const Center(
                              child: CircularProgressIndicator(),
                            ),
                            status: state.status,
                            child:
                                //  (state.index == 2 &&
                                //         state.store?.store?.storeType !=
                                //             "BUSSINESS_PARTNER")
                                //     ? SizedBox()
                                // :
                                state.widget);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pos/engine/base/app.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/modules/dashboard/catalog/cubit/catalog_cubit.dart';
import 'package:pos/modules/dashboard/cubit/dashboard_cubit.dart';
import 'package:pos/modules/dashboard/profile/cubit/profile_cubit.dart';
import 'package:pos/modules/dashboard/withdrawl/cubit/withdrawl_cubit.dart';
import 'package:pos/modules/report/master_report/cubit/master_report_cubit.dart';
import 'package:pos/resources/resources.dart';
import 'package:pos/routes/routes.dart';
import 'package:pos/themes/themes.dart';
import 'package:pos/widgets/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/widgets.dart';
import 'catalog/view/catalog.dart';
import 'master/cubit/master_cubit.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final masterCubit = context.read<MasterCubit>();
    final masterReportCubit = context.read<MasterReportCubit>();
    final cubit = context.read<DashboardCubit>();
    return BlocBuilder<ProfileCubit, ProfileState>(
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
                      loading: SizedBox(),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColor.appColor.primary, width: 1)),
                        width: baseWidth * 0.075,
                        height: baseHeight,
                        child: SingleChildScrollView(
                          child: Builder(builder: (context) {
                            var store = state.store?.store;
                            if (store?.storeType == "BUSSINESS_PARTNER") {
                              return Column(
                                children: [
                                  const SizedBox(height: 8),
                                  (Sessions.getDatabaseModel()?.role != "ADMIN")
                                      ? SizedBox()
                                      : CustomButton(
                                          onPressed: () {
                                            masterCubit.showPage(true);
                                            masterCubit.initData();
                                            cubit.changePage(1);
                                          },
                                          child: state.index == 1
                                              ? Resources.images.catalogActive
                                                  .image(height: 65, width: 60)
                                              : Resources.images.catalogInactive
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
                                  (Sessions.getDatabaseModel()?.role != "ADMIN")
                                      ? SizedBox()
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
                                                  .image(height: 65, width: 60)
                                              : Resources
                                                  .images.icWithdrawlInactive
                                                  .image(
                                                      height: 65, width: 60)),
                                  const SizedBox(height: 8),
                                  (Sessions.getDatabaseModel()?.role != "ADMIN")
                                      ? SizedBox()
                                      : CustomButton(
                                          onPressed: () {
                                            context
                                                .read<ProfileCubit>()
                                                .initData();
                                            cubit.changePage(3);
                                          },
                                          child: state.index == 3
                                              ? Resources.images.profileActive
                                                  .image(height: 65, width: 60)
                                              : Resources.images.profileInactive
                                                  .image(
                                                      height: 65, width: 60)),
                                  SizedBox(height: 30),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: CustomButton(
                                        onPressed: () async {
                                          final GoogleSignInAccount? s =
                                              await GoogleSignIn().signOut();
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
                                  (Sessions.getDatabaseModel()?.role != "ADMIN")
                                      ? SizedBox()
                                      : CustomButton(
                                          onPressed: () {
                                            masterCubit.showPage(true);
                                            masterCubit.initData();
                                            cubit.changePage(1);
                                          },
                                          child: state.index == 1
                                              ? Resources.images.catalogActive
                                                  .image(height: 65, width: 60)
                                              : Resources.images.catalogInactive
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
                                  (Sessions.getDatabaseModel()?.role != "ADMIN")
                                      ? SizedBox()
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
                                                  .image(height: 65, width: 60)
                                              : Resources
                                                  .images.icWithdrawlInactive
                                                  .image(
                                                      height: 65, width: 60)),
                                  const SizedBox(height: 8),
                                  (Sessions.getDatabaseModel()?.role != "ADMIN")
                                      ? SizedBox()
                                      : CustomButton(
                                          onPressed: () {
                                            context
                                                .read<ProfileCubit>()
                                                .initData();
                                            cubit.changePage(3);
                                          },
                                          child: state.index == 3
                                              ? Resources.images.profileActive
                                                  .image(height: 65, width: 60)
                                              : Resources.images.profileInactive
                                                  .image(
                                                      height: 65, width: 60)),
                                  SizedBox(height: 30),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: CustomButton(
                                        onPressed: () async {
                                          final GoogleSignInAccount? s =
                                              await GoogleSignIn().signOut();
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
                              if (state.store?.store?.merChantRole == "SUPP") {
                                return Column(
                                  children: [
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
                                                .image(height: 65, width: 60)),
                                    const SizedBox(height: 8),
                                    (Sessions.getDatabaseModel()?.role !=
                                            "ADMIN")
                                        ? SizedBox()
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
                                        ? SizedBox()
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
                                    SizedBox(height: 30),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: CustomButton(
                                          onPressed: () async {
                                            final GoogleSignInAccount? s =
                                                await GoogleSignIn().signOut();
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
                                            : Resources
                                                .images.appetizercashierInactive
                                                .image(height: 65, width: 60)),
                                    const SizedBox(height: 8),
                                    (Sessions.getDatabaseModel()?.role !=
                                            "ADMIN")
                                        ? SizedBox()
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
                                                .image(height: 65, width: 60)),
                                    const SizedBox(height: 8),
                                    (Sessions.getDatabaseModel()?.role !=
                                            "ADMIN")
                                        ? SizedBox()
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
                                        ? SizedBox()
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
                                    SizedBox(height: 30),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: CustomButton(
                                          onPressed: () async {
                                            final GoogleSignInAccount? s =
                                                await GoogleSignIn().signOut();
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
                                return SizedBox();
                              }
                            } else {
                              return SizedBox();
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
    );
  }
}

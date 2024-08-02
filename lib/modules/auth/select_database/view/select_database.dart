import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pos/data/models/base/database_store.dart';
import 'package:pos/engine/base/app.dart';
import 'package:pos/modules/auth/locked_account/cubit/locked_account_cubit.dart';
import 'package:pos/modules/auth/locked_account/cubit/locked_account_state.dart';
import 'package:pos/modules/auth/locked_account/view/locked_account_page.dart';
import 'package:pos/modules/auth/select_database/cubit/select_database_cubit.dart';
import 'package:pos/modules/checkout/cubit/checkout_cubit.dart';
import 'package:pos/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../data/models/base/user.dart';
import '../../../../engine/helpers/sessions.dart';
import '../../../../themes/themes.dart';
import '../../../../widgets/components/background_image.dart';
import '../../../../widgets/widgets.dart';

class SelectDatabasePage extends StatelessWidget {
  const SelectDatabasePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SelectDatabaseCubit>();
    bool quickReleaseMode = false;
    return BlocBuilder<SelectDatabaseCubit, SelectDatabaseState>(
      builder: (context, state) {
        return ContainerStateHandler(
          loading: const Center(
            child: CircularProgressIndicator(),
          ),
          status: state.status,
          child: BackgorundImageWidget(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 77,
                        width: 623,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(58),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(),
                            onPressed: () {
                              context
                                  .pushNamed(RouteNames.createNewDatabase)
                                  .then((value) => cubit.refreshData());
                            },
                            child: Text(
                              "Create New Database",
                              style: AppFont.whiteLarge(context),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Container(
                        width: 623,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 90, vertical: 32),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 201, 201, 201),
                              offset: Offset(0, 0),
                              blurRadius: 2,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Existing Database",
                              style: AppFont.largeBold(context)!
                                  .copyWith(fontSize: 28),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              "Silahkan pilih database yang ingin digunakan",
                              style: AppFont.medium(context)!
                                  .copyWith(fontSize: 16),
                            ),
                            const SizedBox(height: 24),
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                minHeight: 0,
                                maxHeight: 260,
                              ),
                              child: ListView.builder(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 2,
                                  vertical: 2,
                                ),
                                shrinkWrap: true,
                                itemCount: state.databaseStore.length,
                                itemBuilder: (context, index) {
                                  var database = state.databaseStore[index];
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: CustomButton(
                                      onPressed: () {
                                        cubit.selectedDatabase(
                                          database.dbName ?? "",
                                        );
                                      },
                                      child: CardSelectDatabase(
                                        selected: database.dbName ==
                                                state.selectedDatabase
                                            ? true
                                            : false,
                                        database: database,
                                        username: state.databaseStore.first
                                                .emailOwner ??
                                            "",
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 32),
                            SizedBox(
                              height: 48,
                              width: baseWidth,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(58),
                                child: ElevatedButton(
                                  onPressed: () {
                                    DatabaseStore selectedDB = state
                                        .databaseStore
                                        .where((e) =>
                                            e.dbName == state.selectedDatabase)
                                        .first;
                                    print("INI SELECTED DB");
                                    print(selectedDB.toJson());
                                    if (selectedDB.storesData?.storeStatus ==
                                        "PENDING_ACTIVE") {
                                      ShowNotify.success(
                                        context,
                                        msg: "Sedang diproses",
                                      );
                                    } else if (selectedDB
                                            .storesData?.storeStatus ==
                                        "LOCKED") {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (context) {
                                          return BlocProvider(
                                            create: (context) =>
                                                LockedAccountCubit(context),
                                            child: BlocBuilder<
                                                LockedAccountCubit,
                                                LockedAccountState>(
                                              builder: (context, stateLck) {
                                                return AlertDialog(
                                                  title: Row(
                                                    children: [
                                                      const Text(
                                                        "Informasi",
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w700,
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      Text(
                                                        "Quick Release",
                                                        style: AppFont.largeBold(context),
                                                      ),
                                                      Switch(
                                                        value: quickReleaseMode,
                                                        onChanged: (value) {
                                                          quickReleaseMode = value;
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(16),
                                                  ),
                                                  actions: [
                                                    stateLck.paymentStatus ==
                                                            PaymentStatus
                                                                .pending
                                                        ? TextButton(
                                                            onPressed: () {
                                                              if (stateLck
                                                                      .invoices !=
                                                                  null) {
                                                                context
                                                                    .read<
                                                                        LockedAccountCubit>()
                                                                    .cancelCheckout(
                                                                      stateLck
                                                                          .invoices!
                                                                          .invoice!,
                                                                    );
                                                              }

                                                              Navigator.pop(
                                                                context,
                                                              );
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
                                                      user: selectedDB.user!,
                                                      selectedDB:
                                                      selectedDB.dbName!,
                                                      isQuickRelease: quickReleaseMode,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      cubit.doSelecteDatabase(
                                        state.databaseStore.first.user!,
                                      );
                                    }
                                  },
                                  child: const Text("Load"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      SizedBox(
                        height: 48,
                        width: 421,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(58),
                          child: OutlinedButton(
                            onPressed: () async {
                              final GoogleSignInAccount? s =
                                  await GoogleSignIn().signOut();
                              Sessions.clear()
                                  .then((value) => context.go(RouteNames.root));
                              context.pop();
                            },
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(58),
                              ),
                              side: BorderSide(
                                color: AppColor.appColor.primary,
                              ), // Warna garis outline
                            ),
                            child: const Text("Cancel"),
                          ),
                        ),
                      ),
                    ],
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

class CardSelectDatabase extends StatelessWidget {
  final bool selected;
  final DatabaseStore? database;
  final String? username;

  const CardSelectDatabase({
    super.key,
    required this.selected,
    this.database,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        width: 443,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: selected ? AppColor.appColor.primary : Colors.grey,
              offset: const Offset(0, 0),
              blurRadius: 0,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    database?.dbName ?? "",
                    style: AppFont.largeBold(context)!.copyWith(
                        fontSize: 16,
                        color: selected ? AppColor.appColor.primary : null,
                        overflow: TextOverflow.ellipsis),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "${FirebaseAuth.instance.currentUser?.displayName ?? ""} - ${database?.user?.storeDatabaseName?.where((element) => element.name == database?.dbName).first.role}",
                    style: AppFont.large(context)!.copyWith(
                      fontSize: 14,
                      color: selected ? AppColor.appColor.primary : null,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "${database?.storesData?.storeType?.replaceAll('_', " ") ?? ""} - ${database?.storesData?.merchantRole == "NOT_MERCHANT" ? "" : database?.storesData?.merchantRole}",
                    style: AppFont.large(context)!.copyWith(
                      fontSize: 14,
                      color: selected ? AppColor.appColor.primary : null,
                    ),
                  ),
                  (database?.storesData?.storeStatus == "PENDING")
                      ? Container(
                          width: 320,
                          child: Text(
                            "Anda mendapatkan undangan untuk menggunakan database ini.",
                            maxLines: 2,
                            style: AppFont.large(context)!.copyWith(
                              fontSize: 14,
                              color: AppColor.appColor.warning,
                            ),
                          ),
                        )
                      : SizedBox()
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: selected ? AppColor.appColor.primary : Colors.grey,
                      width: 3.0,
                    ),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Column(
                        children: [
                          Icon(
                            Icons.verified,
                            size: 30.0,
                            color: selected
                                ? AppColor.appColor.primary
                                : Colors.grey,
                          ),
                        ],
                      )),
                ),
                const SizedBox(height: 6),
                Text(
                  database?.storesData?.storeStatus ?? "",
                  style: AppFont.smallBold(context)!.copyWith(
                    color: database?.storesData?.storeStatus == "ACTIVE"
                        ? AppColor.appColor.success
                        : AppColor.appColor.warning,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

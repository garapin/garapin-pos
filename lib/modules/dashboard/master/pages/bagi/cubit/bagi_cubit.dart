import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/data/api/services.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/routes/routes.dart';
import 'package:pos/themes/themes.dart';

import '../../../../../../data/models/base/database_store.dart';
import '../../../../../../data/models/base/split_payment_template.dart';
import '../../../../../../data/models/base/store.dart';
import '../../../cubit/master_cubit.dart';

part 'bagi_state.dart';
part 'bagi_cubit.freezed.dart';

class BagiCubit extends BaseCubit<BagiState> {
  final TextEditingController createTemplateController =
      TextEditingController();
  BagiCubit(BuildContext context) : super(context, const BagiState());

  @override
  Future<void> initData() async {
    loadingState();
    getAllMerchant();
    getStore();
    getAllTemplate();
    emit(state.copyWith(status: DataStateStatus.success));
    finishRefresh(state.status);
  }

  getStore() async {
    final data = await ApiService.getStoreInfo(context);

    var store = data.data?.store;
    List<RoutePayments>? payments = List.from(state.routePayment ?? []);
    payments.add(RoutePayments(type: "ADMIN", target: store?.storeName ?? ""));
    emit(state.copyWith(store: data.data, routePayment: payments));
  }

  getAllTemplate() async {
    final data = await ApiService.getTemplateAll(context);
    emit(state.copyWith(paymentTemplate: data.data));
  }

  getAllMerchant() async {
    final data = await ApiService.getStoreDatabaseTrxByParent(context);
    emit(state.copyWith(merchants: data.data));
  }

  @override
  void loadingState() => emit(state.copyWith(status: DataStateStatus.initial));

  @override
  Future<void> refreshData() => initData();

  void createTemplate() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          content: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: 400,
              height: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Nama Template",
                    style: AppFont.large(context),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Masukkan nama template",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          32,
                        ),
                      ),
                    ),
                    controller: createTemplateController,
                    style: const TextStyle(
                      height: 1.0,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 45,
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32.0),
                            border: Border.all(
                              color: AppColor.appColor.primary,
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              context.pop();
                            },
                            child: const Text(
                              'Cancel',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(36),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(36),
                            child: ElevatedButton(
                              onPressed: () async {
                                List<RoutePayments> routes = [];
                                if (state.store?.store?.merChantRole ==
                                        "SUPP" ||
                                    state.store?.store?.merChantRole == "TRX" ||
                                    state.store?.store?.storeType == "USER") {
                                  routes.add(
                                    RoutePayments(
                                      type: "ADMIN",
                                      target:
                                          state.store?.store?.storeName ?? "",
                                      referenceId:
                                          Sessions.getDatabaseModel()!.name!,
                                      destinationAccountId: state
                                          .store!.store!.accountHolder!.id!,
                                    ),
                                  );
                                } else {
                                  routes.add(
                                    RoutePayments(
                                      type: "ADMIN",
                                      target:
                                          state.store?.store?.storeName ?? "",
                                      referenceId:
                                          Sessions.getDatabaseModel()!.name!,
                                      destinationAccountId: state
                                          .store!.store!.accountHolder!.id!,
                                    ),
                                  );
                                  routes.add(
                                    RoutePayments(
                                      type: "TRX",
                                    ),
                                  );
                                }

                                final data = await ApiService.createTemplate(
                                  context,
                                  name: createTemplateController.text,
                                  description: null,
                                  dbTrx: state.store?.store?.merChantRole ==
                                              "SUPP" ||
                                          state.store?.store?.merChantRole ==
                                              "TRX" || state.store?.store?.storeType == "USER"
                                      ? Sessions.getDatabaseModel()!.name!
                                      : null,
                                  routes: routes,
                                );
                                if (data.isSuccess) {
                                  context.pop();
                                  createTemplateController.clear();
                                  context
                                      .pushNamed(
                                        RouteNames.createBagi,
                                        extra: data.data?.id ?? "",
                                      )
                                      .then(
                                        (value) => getAllTemplate(),
                                      );
                                } else {
                                  showError(data.message);
                                }
                              },
                              child: const Text("Create Template"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

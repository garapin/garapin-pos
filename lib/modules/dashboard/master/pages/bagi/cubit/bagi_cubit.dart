import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/data/api/services.dart';
import 'package:pos/data/models/base/split_payment_rule.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/routes/routes.dart';
import 'package:pos/themes/themes.dart';

import '../../../../../../data/models/base/database_store.dart';
import '../../../../../../data/models/base/split_payment_template.dart';
import '../../../../../../data/models/base/store.dart';

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
    final data = await ApiService.getStoreDatabaseByParent(context);
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          content: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              width: 400,
              height: 330,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(24)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Nama Template",
                    style: AppFont.large(context),
                  ),
                  const SizedBox(height: 16),
                  const Divider(thickness: 2),
                  const SizedBox(height: 32),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Masukan nama template",
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(32)), // Menambahkan border
                    ),
                    controller: createTemplateController,
                    style: const TextStyle(
                        height: 1.0), // Mengatur tinggi TextField
                  ),
                  const SizedBox(height: 32),
                  const Divider(thickness: 2),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 45,
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32.0),
                            border:
                                Border.all(color: AppColor.appColor.primary),
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
                              borderRadius: BorderRadius.circular(36)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(36),
                            child: ElevatedButton(
                                onPressed: () async {
                                  final data = await ApiService.createTemplate(
                                      context,
                                      name: createTemplateController.text,
                                      storeName:
                                          state.store?.store?.storeName ?? "",
                                      description: null,
                                      referenceId:
                                          Sessions.getDatabaseModel()!.name!,
                                      destinationAccountId: state
                                          .store!.store!.accountHolder!.id!);
                                  if (data.isSuccess) {
                                    context
                                        .pushNamed(RouteNames.createBagi,
                                            extra: data.data?.id ?? "")
                                        .then((value) => getAllTemplate());
                                  } else {
                                    showError(data.message);
                                  }
                                },
                                child: const Text("Create Template")),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        );
      },
    );
  }
}

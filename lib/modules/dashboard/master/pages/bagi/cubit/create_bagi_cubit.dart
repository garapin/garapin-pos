import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/data/models/base/split_payment_rule.dart';
import 'package:pos/engine/engine.dart';

import '../../../../../../data/api/services.dart';
import '../../../../../../data/models/base/database_store.dart';
import '../../../../../../data/models/base/split_payment_template.dart';
import '../../../../../../data/models/base/store.dart';
import '../../../../../../themes/themes.dart';
import '../../../../../../widgets/components/outline_form_dropdown.dart';

part 'create_bagi_state.dart';
part 'create_bagi_cubit.freezed.dart';

class CreateBagiCubit extends BaseCubit<CreateBagiState> {
  final TextEditingController percentAmount = TextEditingController();
  final TextEditingController feePos = TextEditingController();
  final TextEditingController target = TextEditingController();
  final String id;
  CreateBagiCubit(BuildContext context, this.id)
      : super(context, const CreateBagiState());

  @override
  Future<void> initData() async {
    loadingState();
    getAllMerchant();
    getOneTemplate();
    getStore();
    emit(state.copyWith(status: DataStateStatus.success));
    finishRefresh(state.status);
  }

  void addTarget() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          content: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
            height: 600,
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Target Bagi-Bagi",
                  style: AppFont.large(context),
                ),
                const SizedBox(height: 16),
                const Divider(thickness: 2),
                const SizedBox(height: 32),
                SizedBox(
                  child: OutlineFormDropdown(
                      label: "Target",
                      name: "outline",
                      hintText: "Masukan target",
                      items: state.merchants
                          .map((e) => DropdownMenuItem(
                                onTap: () {
                                  var item = e.storesData;
                                  target.text = item!.storeName!;
                                  emit(state.copyWith(
                                      routePayments: RoutePayments(
                                          type: item.merchantRole,
                                          target: target.text,
                                          // feePos: int.parse(feePos.text),
                                          // percentAmount:
                                          //     int.parse(percentAmount.text),
                                          currency: "IDR",
                                          destinationAccountId:
                                              item.accountHolder!.id!,
                                          referenceId: e.dbName)));
                                },
                                value: e.dbName,
                                child: Text(
                                    "${e.storesData?.merchantRole} -> ${e.storesData?.storeName ?? ""}"),
                              ))
                          .toList(),
                      uniqueKey: UniqueKey()),
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    "Bagi-Bagi Pendapatan",
                    style: AppFont.large(context),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 67,
                  child: TextField(
                    maxLength: 2,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.percent),
                      helperStyle: AppFont.small(context)!.copyWith(
                        color: AppColor.appColor.warning,
                      ),
                      helperText:
                          "Merchant ini akan mendapat bagian dari hasil transaksi ppenjualan",
                      label: const Text("Bagi-Bagi Pendapatan"),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(32)), // Menambahkan border
                    ),
                    controller: percentAmount,
                    style: const TextStyle(
                        height: 1.0), // Mengatur tinggi TextField
                  ),
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    "Bagi-Bagi Pendapatan",
                    style: AppFont.large(context),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 67,
                  child: TextField(
                    maxLength: 2,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.percent),
                      helperStyle: AppFont.small(context)!.copyWith(
                        color: AppColor.appColor.warning,
                      ),
                      helperText: "Merchant & customer ini akan membayar biaya",
                      label: const Text("Bagi-Bagi Biaya"),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(32)), // Menambahkan border
                    ),
                    controller: feePos,
                    style: const TextStyle(
                        height: 1.0), // Mengatur tinggi TextField
                  ),
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
                          border: Border.all(color: AppColor.appColor.primary),
                        ),
                        child: TextButton(
                          onPressed: () {
                            context.pop();
                          },
                          child: const Text(
                            'CANCEL',
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
                                RoutePayments newData = state.routePayments!;
                                newData.percentAmount =
                                    int.parse(percentAmount.text);
                                newData.feePos = int.parse(feePos.text);
                                final data = await ApiService.updateTemplate(
                                    context,
                                    referenceId:
                                        state.routePayments!.referenceId!,
                                    routePayments: state.routePayments!,
                                    id: id);
                                // flatAmount: null,
                                // percentAmount: int.parse(percentAmount.text),);
                                if (data.isSuccess) {
                                  refreshData();
                                  percentAmount.clear();
                                  feePos.clear();
                                  context.pop();
                                  showSuccess(data.message);
                                } else {
                                  showError(data.message);
                                }
                              },
                              child: const Text("ADD")),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void editTarget(RoutePayments routePayments) {
    percentAmount.text = routePayments.percentAmount?.toString() ?? "";
    feePos.text = routePayments.feePos?.toString() ?? "";
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          content: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
            height: 600,
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Target Bagi-Bagi",
                  style: AppFont.large(context),
                ),
                const SizedBox(height: 16),
                const Divider(thickness: 2),
                const SizedBox(height: 32),
                SizedBox(
                  child: OutlineFormDropdown(
                      enabled: (routePayments.type == "ADMIN") ? false : true,
                      initialValue: routePayments.target,
                      label: "Target",
                      name: "outline",
                      hintText: "Masukan target",
                      items: state.merchants
                          .map((e) => DropdownMenuItem(
                                onTap: () {},
                                value: e.storesData?.storeName ?? "",
                                child: Text(
                                    "${e.storesData?.merchantRole} -> ${e.storesData?.storeName ?? ""}"),
                              ))
                          .toList(),
                      uniqueKey: UniqueKey()),
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    "Bagi-Bagi Pendapatan",
                    style: AppFont.large(context),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 67,
                  child: TextField(
                    maxLength: 2,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.percent),
                      helperStyle: AppFont.small(context)!.copyWith(
                        color: AppColor.appColor.warning,
                      ),
                      helperText:
                          "Merchant ini akan mendapat bagian dari hasil transaksi ppenjualan",
                      label: const Text("Bagi-Bagi Pendapatan"),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(32)), // Menambahkan border
                    ),
                    controller: percentAmount,
                    style: const TextStyle(
                        height: 1.0), // Mengatur tinggi TextField
                  ),
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    "Bagi-Bagi Pendapatan",
                    style: AppFont.large(context),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 67,
                  child: TextField(
                    maxLength: 2,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.percent),
                      helperStyle: AppFont.small(context)!.copyWith(
                        color: AppColor.appColor.warning,
                      ),
                      helperText: "Merchant & customer ini akan membayar biaya",
                      label: const Text("Bagi-Bagi Biaya"),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(32)), // Menambahkan border
                    ),
                    controller: feePos,
                    style: const TextStyle(
                        height: 1.0), // Mengatur tinggi TextField
                  ),
                ),
                const SizedBox(height: 32),
                const Divider(thickness: 2),
                const SizedBox(height: 16),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 45,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32.0),
                          border: Border.all(color: AppColor.appColor.primary),
                        ),
                        child: TextButton(
                          onPressed: () {
                            context.pop();
                          },
                          child: const Text(
                            'CANCEL',
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
                                final data = await ApiService.updateTemplate(
                                    context,
                                    referenceId: routePayments.referenceId!,
                                    routePayments: RoutePayments(
                                        type: routePayments.type,
                                        target: routePayments.target,
                                        feePos: int.parse(feePos.text),
                                        flatAmount: null,
                                        percentAmount:
                                            int.parse(percentAmount.text),
                                        currency: "IDR",
                                        destinationAccountId:
                                            routePayments.destinationAccountId,
                                        referenceId: routePayments.referenceId),
                                    id: id);
                                if (data.isSuccess) {
                                  refreshData();
                                  percentAmount.clear();
                                  feePos.clear();
                                  context.pop();
                                  showSuccess(data.message);
                                } else {
                                  showError(data.message);
                                }
                              },
                              child: const Text("EDIT")),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  getOneTemplate() async {
    final data = await ApiService.getTemplateId(context, id: id);
    if (data.isSuccess) {
      emit(state.copyWith(
          paymentTemplate: data.data, status: DataStateStatus.success));
    } else {
      emit(state.copyWith(
          paymentTemplate: data.data, status: DataStateStatus.error));
    }
  }

  getStore() async {
    final data = await ApiService.getStoreInfo(context);
    emit(state.copyWith(store: data.data));
  }

  getAllMerchant() async {
    final data = await ApiService.getStoreDatabaseByParent(context);
    List<DatabaseStore> newData = data.data ?? [];
    newData.insert(
        0,
        DatabaseStore(
            dbName: Sessions.getDatabaseModel()!.name!,
            storesData: StoresData(
                storeName: state.store!.store!.storeName ?? "",
                merchantRole: "ADMIN")));

    emit(state.copyWith(merchants: newData));
  }

  @override
  void loadingState() => emit(state.copyWith(status: DataStateStatus.initial));

  @override
  Future<void> refreshData() => initData();
}

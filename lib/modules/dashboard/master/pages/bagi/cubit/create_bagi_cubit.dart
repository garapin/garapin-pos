import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
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

//popup
  final TextEditingController referenceIdC = TextEditingController();
  final TextEditingController destinationAccountIdC = TextEditingController();
  final String id;

  final TextEditingController feeCust = TextEditingController();

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
    target.text = "";
    feePos.text = "";
    percentAmount.text = "";
    List<String> destAccountId = state.paymentTemplate!.routes!
        .map((e) => e.destinationAccountId.toString())
        .toList();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            content: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(24)),
              height: 400,
              width: 400,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Target Bagi-Bagi",
                      style: AppFont.large(context),
                    ),
                    const SizedBox(height: 4),
                    const Divider(thickness: 2),
                    const SizedBox(height: 8),
                    SizedBox(
                      child: OutlineFormDropdown(
                          label: "Target",
                          name: "outline",
                          hintText: "Masukan target",
                          items: state.merchants
                              .where((element) =>
                                  element.storesData?.storeName != null)
                              .where((element) =>
                                  element.storesData?.merchantRole != "ADMIN" &&
                                  element.storesData?.merchantRole != "TRX")
                              .where((element) => !destAccountId.contains(
                                  element.storesData?.accountHolder?.id))
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
                    const SizedBox(height: 16),
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
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.percent),
                          helperStyle: AppFont.small(context)!.copyWith(
                            color: AppColor.appColor.warning,
                          ),
                          helperText:
                              "Merchant ini akan mendapat bagian dari hasil transaksi ppenjualan",
                          hintText: "Masukan persenan",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  32)), // Menambahkan border
                        ),
                        controller: percentAmount,
                        style: const TextStyle(
                            height: 1.0), // Mengatur tinggi TextField
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        "Bagi-Bagi Biaya",
                        style: AppFont.large(context),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 67,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.percent),
                          helperStyle: AppFont.small(context)!.copyWith(
                            color: AppColor.appColor.warning,
                          ),
                          helperText:
                              "Merchant & customer ini akan membayar biaya",
                          hintText: "Masukan persenan",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  32)), // Menambahkan border
                        ),
                        controller: feePos,
                        style: const TextStyle(
                            height: 1.0), // Mengatur tinggi TextField
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
                              border:
                                  Border.all(color: AppColor.appColor.primary),
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
                                    if (target.text == "") {
                                      showError("Target tidak boleh kosong");
                                    } else if (percentAmount.text == "") {
                                      showError(
                                          "Bagi-bagi pendapatan tidak boleh kosong");
                                    } else if (feePos.text == "") {
                                      showError(
                                          "Bagi-bagi biaya tidak boleh kosong");
                                    } else {
                                      RoutePayments newData =
                                          state.routePayments!;
                                      newData.percentAmount =
                                          int.parse(percentAmount.text);
                                      newData.feePos = int.parse(feePos.text);
                                      final data =
                                          await ApiService.updateTemplate(
                                              context,
                                              referenceId: state
                                                  .routePayments!.referenceId!,
                                              routePayments:
                                                  state.routePayments!,
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
            ));
      },
    );
  }

  void editTarget(RoutePayments routePayments) {
    percentAmount.text = routePayments.percentAmount?.toString() ?? "";
    feePos.text = routePayments.feePos?.toString() ?? "";
    target.text = routePayments.target ?? "";
    referenceIdC.text = routePayments.referenceId ?? "";
    log(referenceIdC.text);
    destinationAccountIdC.text = routePayments.destinationAccountId ?? "";
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          content: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
            height: 400,
            width: 400,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Target Bagi-Bagi",
                    style: AppFont.large(context),
                  ),
                  const SizedBox(height: 4),
                  const Divider(thickness: 2),
                  const SizedBox(height: 8),
                  SizedBox(
                      child: OutlineFormDropdown(
                          onChanged: (p0) {},
                          enabled: routePayments.type == "ADMIN" ? false : true,
                          initialValue: target.text,
                          label: "Target",
                          name: "outline",
                          hintText: "Masukan target",
                          items: state.merchants
                              .where((element) =>
                                  element.storesData?.storeName != null)
                              .where((element) =>
                                  element.storesData?.merchantRole ==
                                  routePayments.type)
                              .map((e) {
                            return DropdownMenuItem(
                              onTap: () {
                                DatabaseStore p = e;
                                target.text =
                                    p.storesData!.storeName.toString();
                                referenceIdC.text = p.dbName.toString();
                                destinationAccountIdC.text =
                                    p.storesData!.accountHolder!.id.toString();
                              },
                              value: e.storesData?.storeName,
                              child: Text(
                                  "${e.storesData?.merchantRole} -> ${e.storesData?.storeName ?? ""}"),
                            );
                          }).toList(),
                          uniqueKey: UniqueKey())),
                  const SizedBox(height: 16),
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
                      keyboardType: TextInputType.number,
                      maxLength: 3,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.percent),
                        helperStyle: AppFont.small(context)!.copyWith(
                          color: AppColor.appColor.warning,
                        ),
                        helperText:
                            "Merchant ini akan mendapat bagian dari hasil transaksi ppenjualan",
                        hintText: "Masukan persenan",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                32)), // Menambahkan border
                      ),
                      controller: percentAmount,
                      style: const TextStyle(
                          height: 1.0), // Mengatur tinggi TextField
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      "Bagi-Bagi Biaya",
                      style: AppFont.large(context),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 67,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      maxLength: 3,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.percent),
                        helperStyle: AppFont.small(context)!.copyWith(
                          color: AppColor.appColor.warning,
                        ),
                        helperText:
                            "Merchant & customer ini akan membayar biaya",
                        hintText: "Masukan persenan",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                32)), // Menambahkan border
                      ),
                      controller: feePos,
                      style: const TextStyle(
                          height: 1.0), // Mengatur tinggi TextField
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
                            border:
                                Border.all(color: AppColor.appColor.primary),
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
                                  if (target.text == "") {
                                    showError("Target tidak boleh kosong");
                                  } else if (percentAmount.text == "") {
                                    showError(
                                        "Bagi-bagi pendapatan tidak boleh kosong");
                                  } else if (feePos.text == "") {
                                    showError(
                                        "Bagi-bagi biaya tidak boleh kosong");
                                  } else {
                                    final data =
                                        await ApiService.updateTemplate(context,
                                            referenceId: referenceIdC.text,
                                            routePayments: RoutePayments(
                                                type: routePayments.type,
                                                target: target.text,
                                                feePos: int.parse(feePos.text),
                                                flatAmount: null,
                                                percentAmount: int.parse(
                                                    percentAmount.text),
                                                currency: "IDR",
                                                destinationAccountId:
                                                    destinationAccountIdC.text,
                                                referenceId: referenceIdC.text),
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

  changeStatusTemplate(String statusTemplate) async {
    final data = await ApiService.changeStatusTemplate(context,
        idTemplate: id, statusTemplate: statusTemplate);
    if (data.isSuccess) {
      refreshData();
      showSuccess(data.message);
    } else {
      refreshData();
      showError(data.message);
    }
  }

  void deleteTargetTemplate(String referenceId) async {
    final data = await ApiService.deleteTargetTemplate(context,
        id: id, referenceId: referenceId);
    if (data.isSuccess) {
      showSuccess(data.message);
      refreshData();
    } else {
      showError(data.message);
    }
  }

  getStore() async {
    final data = await ApiService.getStoreInfo(context);
    emit(state.copyWith(store: data.data));
  }

  getAllMerchant() async {
    final data = await ApiService.getStoreDatabaseTrxByParent(context);
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

  void createSplitRule() async {
    showLoading();
    final data = await ApiService.createSplitRule(context,
        idTemplate: state.paymentTemplate?.id ?? "",
        name: state.paymentTemplate?.name ?? "",
        description: state.paymentTemplate?.description ??
            "Bagi Bagi Untuk trx ${state.paymentTemplate?.routes?.where((element) => element.type == "TRX").first.target?.toUpperCase() ?? ""}",
        routes: state.paymentTemplate!.routes!);
    if (data.isSuccess) {
      showSuccess(data.message);
    } else {
      showError(data.message);
    }
    dismissLoading();
  }

  void editCustomerFee() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          content: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
            height: 400,
            width: 400,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Target Bagi-Bagi",
                    style: AppFont.large(context),
                  ),
                  const SizedBox(height: 4),
                  const Divider(thickness: 2),
                  const SizedBox(height: 8),
                  SizedBox(
                      child: OutlineFormDropdown(
                          onChanged: (p0) {},
                          initialValue: "Customer",
                          label: "Target",
                          name: "outline",
                          hintText: "Masukan target",
                          items: [
                            DropdownMenuItem(
                              onTap: () {},
                              value: 'Customer',
                              child: Text("Customer"),
                            )
                          ],
                          uniqueKey: UniqueKey())),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      "Bagi-Bagi Biaya",
                      style: AppFont.large(context),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 67,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      maxLength: 3,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.percent),
                        helperStyle: AppFont.small(context)!.copyWith(
                          color: AppColor.appColor.warning,
                        ),
                        helperText:
                            "Merchant & customer ini akan membayar biaya",
                        hintText: "Masukan persenan",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                32)), // Menambahkan border
                      ),
                      controller: feeCust
                        ..text =
                            state.paymentTemplate?.feeCust.toString() ?? "",
                      style: const TextStyle(
                          height: 1.0), // Mengatur tinggi TextField
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
                            border:
                                Border.all(color: AppColor.appColor.primary),
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
                                  if (feeCust.text == "") {
                                    showError(
                                        "Bagi-bagi biaya tidak boleh kosong");
                                  } else {
                                    final data =
                                        await ApiService.updateTemplateFeeCust(
                                            context,
                                            idTemplate: state
                                                .paymentTemplate!.id
                                                .toString(),
                                            percentFeeCust:
                                                int.parse(feeCust.text));
                                    if (data.isSuccess) {
                                      context.pop();
                                      refreshData();
                                      showSuccess(data.message);
                                    }else{
                                      showError(data.message);
                                    }
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
          ),
        );
      },
    );
  }
}

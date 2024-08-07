import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:pos/data/models/base/database_store.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/modules/dashboard/master/pages/cubit/my_merchant_cubit.dart';
import 'package:pos/widgets/components/outline_form_dropdown.dart';
import 'package:pos/widgets/widgets.dart';
import '../../../../themes/themes.dart';
import '../../../../widgets/components/outline_form_text.dart';

class MyMerchantPage extends StatelessWidget {
  const MyMerchantPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MyMerchantCubit>();

    List<DropdownMenuItem> listDropdown = [];


    return BlocBuilder<MyMerchantCubit, MyMerchantState>(
      builder: (context, state) {

        if (state.status == DataStateStatus.success) {
          if (state.store?.store?.storeType == "BUSSINESS_PARTNER") {
            listDropdown.addAll([
              const DropdownMenuItem(
                value: "TRX",
                child: Text("TRX"),
              ),
              const DropdownMenuItem(
                value: "SUPP",
                child: Text("SUPP"),
              ),
            ]);
          } else {
            listDropdown.addAll(
                [
                  const DropdownMenuItem(
                    value: "SUPP",
                    child: Text("SUPP"),
                  ),
                ]
            );
          }
        }

        return ContainerStateHandler(
          refresherOptions: RefresherOptions(
            controller: cubit.defaultRefresh.controller,
            onRefresh: () {
              cubit.formKey.currentState?.reset();
              cubit.formKey.currentState?.patchValue({"merchant_role": null});
              cubit.refreshData();
            },
          ),
          status: state.status,
          loading: const Center(
            child: CircularProgressIndicator(),
          ),
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 120, vertical: 26),
              width: baseWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Invite Merchant",
                          style: AppFont.largeBold(context),
                        ),
                        const Text("")
                      ],
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: FormBuilder(
                      key: cubit.formKey,
                      child: Column(
                        children: [
                          const OutlineFormText(
                            name: 'email',
                            hintText: 'Masukkan email',
                            label: 'Email',
                          ),
                          const SizedBox(height: 16),
                          const OutlineFormText(
                            maxLength: 30,
                            name: 'store_name',
                            hintText: 'Masukkan nama database',
                            label: 'Database Name',
                          ),
                          const SizedBox(height: 16),
                          OutlineFormDropdown(
                            initialValue: null,
                            validator: (v) {
                              if (v != null) {
                                return null;
                              } else {
                                return 'error';
                              }
                            },
                            name: 'merchant_role',
                            hintText: 'Pilih Role',
                            label: 'Role',
                            items: listDropdown.toSet().toList(),
                            uniqueKey: const Key("100"),
                          ),
                          const SizedBox(height: 32),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(38),
                            child: SizedBox(
                              height: 50,
                              width: baseWidth,
                              child: ElevatedButton(
                                  onPressed: () {
                                    // cubit.formKey.currentState?.reset();
                                    cubit.createMerchant(cubit.formKey);
                                  },
                                  child: const Text("Invite")),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Divider(thickness: 1),
                          const SizedBox(height: 16),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.merchants.length,
                            itemBuilder: (context, index) {
                              DatabaseStore merchant = state.merchants[index];
                              if (merchant.dbName ==
                                  Sessions.getDatabaseModel()?.name) {
                                return SizedBox();
                              } else {
                                return ListTile(
                                  leading: Icon(
                                    Icons.account_circle_rounded,
                                    color: AppColor.appColor.warning,
                                    size: 48,
                                  ),
                                  title: Text(
                                    merchant.storesData?.storeName ??
                                        "Menunggu approval",
                                    style: AppFont.largeBold(context),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        merchant.emailOwner ?? "",
                                        style: AppFont.medium(context),
                                      ),
                                      Text(
                                        merchant.storesData?.merchantRole ?? "",
                                        style: AppFont.medium(context),
                                      ),
                                    ],
                                  ),
                                  trailing: Text(
                                    merchant.storesData?.storeStatus ?? "",
                                    style: AppFont.mediumBold(context)!
                                        .copyWith(
                                            color: merchant.storesData
                                                        ?.storeStatus ==
                                                    "ACTIVE"
                                                ? AppColor.appColor.success
                                                : merchant.storesData
                                                            ?.storeStatus ==
                                                        "REJECT"
                                                    ? AppColor.appColor.inactive
                                                    : AppColor
                                                        .appColor.warning),
                                  ),
                                );
                              }
                            },
                          )
                        ],
                      ),
                    ),
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:pos/data/models/base/database_store.dart';
import 'package:pos/data/models/base/merchant_model.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/modules/dashboard/master/pages/cubit/my_merchant_cubit.dart';
import 'package:pos/widgets/components/outline_form_dropdown.dart';
import 'package:pos/widgets/widgets.dart';

import '../../../../engine/base/app.dart';
import '../../../../themes/themes.dart';
import '../../../../widgets/components/outline_form_text.dart';

class MyMerchantPage extends StatelessWidget {
  const MyMerchantPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MyMerchantCubit>();
    return BlocBuilder<MyMerchantCubit, MyMerchantState>(
      builder: (context, state) {
        return ContainerStateHandler(
          refresherOptions: cubit.defaultRefresh,
          status: state.status,
          loading: const Center(
            child: CircularProgressIndicator(),
          ),
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 120, vertical: 26),
              width: baseWidth,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
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
                            hintText: 'Masukan email',
                            label: 'Email',
                          ),
                          const SizedBox(height: 16),
                          const OutlineFormText(
                            maxLength: 30,
                            name: 'store_name',
                            hintText: 'Masukan nama database',
                            label: 'Database Name',
                          ),
                          const SizedBox(height: 16),
                          OutlineFormDropdown(
                            validator: (v) {
                              if (v != null) {
                                return null;
                              } else {
                                return 'Unit tidak boleh kosong';
                              }
                            },
                            name: 'merchant_role',
                            hintText: 'Pilih Role',
                            label: 'Role',
                            items: const [
                              DropdownMenuItem(
                                value: "TRX",
                                child: Text("TRX"),
                              ),
                              DropdownMenuItem(
                                value: "SUPP",
                                child: Text("SUPP"),
                              ),
                              DropdownMenuItem(
                                value: "CUST",
                                child: Text("CUST"),
                              )
                            ],
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
                                    cubit.createMerchant();
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
                              return ListTile(
                                leading: Icon(
                                  Icons.account_circle_rounded,
                                  color: AppColor.appColor.warning,
                                  size: 48,
                                ),
                                title: Text(
                                  merchant.storesData?.storeName ??
                                      "Nama belum ditambahkan",
                                  style: AppFont.largeBold(context),
                                ),
                                subtitle: Text(
                                  merchant.storesData?.merchantRole ?? "",
                                  style: AppFont.medium(context),
                                ),
                                trailing: Text(
                                  merchant.storesData?.storeStatus ?? "",
                                  style: AppFont.mediumBold(context)!.copyWith(
                                      color: merchant.storesData?.storeStatus ==
                                              "ACTIVE"
                                          ? AppColor.appColor.success
                                          : merchant.storesData?.storeStatus ==
                                                  "REJECT"
                                              ? AppColor.appColor.inactive
                                              : AppColor.appColor.warning),
                                ),
                              );
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

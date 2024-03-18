import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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
          status: state.status,
          loading: Center(
            child: CircularProgressIndicator(),
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 120, vertical: 26),
            width: baseWidth,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
                        OutlineFormText(
                          name: 'email',
                          hintText: 'Masukan email',
                          label: 'Email',
                        ),
                        const SizedBox(height: 16),
                        OutlineFormText(
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
                          uniqueKey: Key("100"),
                        ),
                        SizedBox(height: 32),
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
                        SizedBox(height: 16),
                        Divider(thickness: 1),
                        SizedBox(height: 16),
                      ],
                    ),
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

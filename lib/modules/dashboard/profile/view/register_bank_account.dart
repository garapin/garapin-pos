import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos/data/models/base/store.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/modules/dashboard/profile/cubit/profile_cubit.dart';
import 'package:pos/themes/themes.dart';
import 'package:pos/widgets/components/image_picker_widget.dart';
import 'package:pos/widgets/components/outline_form_dropdown.dart';
import 'package:pos/widgets/components/outline_form_text.dart';
import 'package:pos/widgets/widgets.dart';

class RegisterBankAccount extends StatelessWidget {
  final ProfileCubit cubit;
  final StoreClass? store;
  final ProfileState? state;
  const RegisterBankAccount(
      {super.key,
      required this.cubit,
      required this.store,
      required this.state});

  @override
  Widget build(BuildContext context) {
    var bankAccount = state?.store?.store?.bankAccount;
    var businessPartnesr = state?.store?.store?.businessPartner;
    return ExpansionTile(
      title: const Text("Add Bank Account"),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text("Bank Account/E-Wallet",
                  style: AppFont.largeBold(context)!.copyWith(fontSize: 24)),
            ),
            const Divider(thickness: 2),
            const SizedBox(height: 12),
            OutlineFormDropdown(
                uniqueKey: const Key("bank_name"),
                initialValue: bankAccount?.bankName,
                label: "Bank",
                name: "bank_name",
                hintText: "Pilih bank",
                items: state?.availablePayment
                        .map(
                          (e) => DropdownMenuItem(
                              value: e.bank,
                              child: Row(
                                children: [
                                  ImageLoad(
                                      height: 50,
                                      width: 50,
                                      imageUrl: Environment.showUrlImage(
                                          path: e.image ?? "")),
                                  const SizedBox(width: 12),
                                  Text(e.bank ?? ""),
                                ],
                              )),
                        )
                        .toList() ??
                    []),
            const SizedBox(height: 16),
            OutlineFormText(
              initialValue: bankAccount?.holderName ?? "",
              name: "holder_name",
              hintText: "masukan Pemilik Rekening",
              label: "Nama Pemilik Rekening",
            ),
            const SizedBox(height: 16),
            OutlineFormText(
              initialValue: "${bankAccount?.accountNumber ?? ""}",
              keyboardType: TextInputType.number,
              name: "account_number",
              hintText: "masukan Nomor Rekening",
              label: "No Rekening",
            ),
            const SizedBox(height: 16),
            OutlineFormText(
              obscureText: true,
              initialValue: "111111",
              keyboardType: TextInputType.number,
              name: "pin",
              hintText: "Masukan Pin",
              label: "Pin Anda",
              maxLength: 6,
            ),
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(38),
            //   child: SizedBox(
            //     height: 40,
            //     width: baseWidth,
            //     child: ElevatedButton(
            //       onPressed: () {
            //         cubit.addBankAccount();
            //       },
            //       child: const Text("SAVE"),
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 16),
          ],
        ),
      ],
    );
  }
}

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

class RegisterBankAccountWidget extends StatelessWidget {
  final ProfileCubit cubit;
  final StoreClass? store;
  final ProfileState? state;
  const RegisterBankAccountWidget(
      {super.key,
      required this.cubit,
      required this.store,
      required this.state});

  @override
  Widget build(BuildContext context) {
    var bankAccount = state?.store?.store?.bankAccount;
    var businessPartnesr = state?.store?.store?.businessPartner;
    return Column(
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
            uniqueKey: Key("bank_name"),
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
                              SizedBox(width: 12),
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
          initialValue: "${bankAccount?.pin ?? ""}",
          keyboardType: TextInputType.number,
          name: "pin",
          hintText: "Masukan Pin",
          label: "Pin Anda",
          maxLength: 6,
        ),
        (state?.store?.store?.storeType == "MERCHANT")
            ? SizedBox()
            : ListTile(
                title: Text(
                  "Ingin menjadi Business Partner Kami?",
                  style: AppFont.largeBold(context)!.copyWith(fontSize: 16),
                ),
                subtitle: Text(
                  "Jadilah partner kami sekarang juga",
                  style: AppFont.large(context)!.copyWith(fontSize: 14),
                ),
                trailing: Expanded(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(38),
                  child: SizedBox(
                    height: 40,
                    width: 400,
                    child: ElevatedButton(
                        onPressed: () {
                          cubit.showFormBussinessPartner();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.people),
                            SizedBox(width: 20),
                            Text(state?.store?.store?.businessPartner?.status ==
                                    "ACTIVE"
                                ? "Sudah menjadi Bussiness Partner"
                                : "Register Bussiness Partner"),
                          ],
                        )),
                  ),
                )),
              ),
        (state!.showFormBussinessPartner)
            ? Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: AppColor.appColor.primary.withOpacity(0.1)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 16),
                        OutlineFormText(
                          readOnly: cubit.isReadOnly(),
                          initialValue: businessPartnesr?.companyName ?? "",
                          name: "company_name",
                          hintText: "Masukan Nama Perusahaan",
                          label: "Nama Perusahaan",
                        ),
                        SizedBox(height: 24),
                        OutlineFormText(
                          readOnly: cubit.isReadOnly(),
                          initialValue: businessPartnesr?.noNpwp ?? "",
                          name: "no_npwp",
                          hintText: "Masukan No NPWP",
                          label: "No. NPWP",
                        ),
                        const SizedBox(height: 24),
                        OutlineFormText(
                          readOnly: cubit.isReadOnly(),
                          initialValue: businessPartnesr?.noNib ?? "",
                          name: "no_nib",
                          hintText: "Masukan No NIB",
                          label: "No. NIB",
                        ),
                        const SizedBox(height: 24),
                        ImagePickerWidget(
                          label: "Upload NPWP",
                          cubit: cubit,
                          imageUrl: businessPartnesr?.imageNpwp ?? "",
                          pickedImage: state?.npwpImage,
                          pickCameraPressed: () {
                            cubit
                                .pickNpwpImage(ImageSource.camera)
                                .then((value) => context.pop());
                          },
                          pickGaleryPressed: () {
                            cubit
                                .pickNpwpImage(ImageSource.gallery)
                                .then((value) => context.pop());
                          },
                        ),
                        const SizedBox(height: 16),
                        ImagePickerWidget(
                          cubit: cubit,
                          label: "Upload NIB",
                          imageUrl: businessPartnesr?.imageNib ?? "",
                          pickedImage: state?.nibImage,
                          pickCameraPressed: () {
                            cubit
                                .pickNibImage(ImageSource.camera)
                                .then((value) => context.pop());
                          },
                          pickGaleryPressed: () {
                            cubit
                                .pickNibImage(ImageSource.gallery)
                                .then((value) => context.pop());
                          },
                        ),
                        const SizedBox(height: 16),
                        ImagePickerWidget(
                          label: "Upload Akta",
                          cubit: cubit,
                          imageUrl: businessPartnesr?.imageAkta ?? "",
                          pickedImage: state?.aktaImage,
                          pickCameraPressed: () {
                            cubit
                                .pickAktaImage(ImageSource.camera)
                                .then((value) => context.pop());
                          },
                          pickGaleryPressed: () {
                            cubit
                                .pickAktaImage(ImageSource.gallery)
                                .then((value) => context.pop());
                          },
                        ),
                        const SizedBox(height: 32),
                        state?.store?.store?.businessPartner?.status == "ACTIVE"
                            ? SizedBox()
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(38),
                                child: SizedBox(
                                  height: 40,
                                  width: baseWidth,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      cubit.addBankAccount();
                                    },
                                    child: const Text("Request Approval"),
                                  ),
                                ),
                              ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Status :"),
                            Text(
                                state?.store?.store?.businessPartner?.status ??
                                    "",
                                style: AppFont.large(context)!.copyWith(
                                  color: AppColor.appColor.warning,
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            : SizedBox()
      ],
    );
  }
}

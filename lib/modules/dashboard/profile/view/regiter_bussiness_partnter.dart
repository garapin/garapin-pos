import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos/data/models/base/store.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/engine/helpers/color_status.dart';
import 'package:pos/modules/dashboard/profile/cubit/profile_cubit.dart';
import 'package:pos/themes/themes.dart';
import 'package:pos/widgets/components/image_picker_widget.dart';
import 'package:pos/widgets/components/outline_form_dropdown.dart';
import 'package:pos/widgets/components/outline_form_text.dart';
import 'package:pos/widgets/widgets.dart';

class RegisterBussinessPartner extends StatelessWidget {
  final ProfileCubit cubit;
  final StoreClass? store;
  final ProfileState? state;
  const RegisterBussinessPartner(
      {super.key,
      required this.cubit,
      required this.store,
      required this.state});

  @override
  Widget build(BuildContext context) {
    var bankAccount = state?.store?.store?.bankAccount;
    var businessPartnesr = state?.store?.store?.businessPartner;
    bool isActive =
        state?.store?.store?.businessPartner?.status == "ACTIVE" ? true : false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (state?.store?.store?.storeType == "MERCHANT")
            ? SizedBox()
            : ListTile(
                title: Text(
                  "Ingin menjadi Business Partner Kami?",
                  style: AppFont.largeBold(context)!.copyWith(fontSize: 14),
                ),
                subtitle: Text(
                  "Jadilah partner kami sekarang juga",
                  style: AppFont.large(context)!.copyWith(fontSize: 12),
                ),
                trailing: Expanded(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(38),
                  child: Container(
                    height: 40,
                    width: 220,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: isActive
                                ? AppColor.appColor.success
                                : AppColor.appColor.primary),
                        onPressed: () {
                          cubit.showFormBussinessPartner();
                        },
                        child: SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                isActive ? Icons.verified : Icons.people,
                                size: 18,
                              ),
                              SizedBox(width: 4),
                              Text(
                                isActive
                                    ? "Bussiness Partner"
                                    : "Register Bussiness Partner",
                                style: AppFont.whiteSmall(context)!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
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
                          fileEnable: true,
                          pickFilePressed: () {
                            cubit.pickNpwpFile().then((value) => context.pop());
                            ;
                          },
                          label: "Upload NPWP",
                          cubit: cubit,
                          imageUrl: businessPartnesr?.imageNpwp,
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
                          fileEnable: true,
                          cubit: cubit,
                          label: "Upload NIB",
                          imageUrl: businessPartnesr?.imageNib,
                          pickedImage: state?.nibImage,
                          pickFilePressed: () {
                            cubit.pickNibFile().then((value) => context.pop());
                            ;
                          },
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
                          pickFilePressed: () {
                            cubit.pickAktaFile().then((value) => context.pop());
                            ;
                          },
                          fileEnable: true,
                          label: "Upload Akta",
                          cubit: cubit,
                          imageUrl: businessPartnesr?.imageAkta,
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
                                      cubit.requestBussinessPartner();
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
                                  color: getColorFromString(state?.store?.store
                                          ?.businessPartner?.status ??
                                      ""),
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

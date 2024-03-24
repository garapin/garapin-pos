import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/modules/dashboard/cubit/dashboard_cubit.dart';
import 'package:pos/modules/dashboard/profile/cubit/profile_cubit.dart';
import 'package:pos/modules/dashboard/profile/view/register_bank_account.dart';
import 'package:pos/widgets/components/outline_form_text.dart';
import 'package:pos/themes/themes.dart';
import 'package:pos/widgets/widgets.dart';
import '../../../../widgets/components/image_picker_widget.dart';
import 'regiter_bussiness_partnter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubitDashboard = context.read<DashboardCubit>();
    final cubit = context.read<ProfileCubit>();
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FD),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          var store = state.store?.store;
          return ContainerStateHandler(
            refresherOptions:
                (store?.storeName != null) ? cubit.defaultRefresh : null,
            status: state.status,
            loading: const Center(
              child: CircularProgressIndicator(),
            ),
            child: SingleChildScrollView(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 120, vertical: 26),
                width: baseWidth,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                child: Builder(builder: (context) {
                  if (state.store?.store?.storeStatus == "PENDING") {
                    return Column(
                      children: [
                        const SizedBox(height: 300),
                        Text(
                          "Anda mendapatkan invitation untuk menjadi merchant",
                          style: AppFont.largeBold(context),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 88,
                          width: 600,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 0),
                                blurRadius: 0,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 100),
                            child: Row(
                              children: [
                                Expanded(
                                    child: ClipRRect(
                                  borderRadius: BorderRadius.circular(38),
                                  child: SizedBox(
                                      height: 50,
                                      child: OutlinedButton(
                                        onPressed: () {
                                          cubit.acceptInvitation("DECLINE");
                                        },
                                        style: OutlinedButton.styleFrom(
                                          side: const BorderSide(),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(38),
                                          ),
                                        ),
                                        child: const Text('REJECT'),
                                      )),
                                )),
                                const SizedBox(width: 40),
                                Expanded(
                                    child: ClipRRect(
                                  borderRadius: BorderRadius.circular(38),
                                  child: SizedBox(
                                    height: 50,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          cubit.acceptInvitation("ACTIVE");
                                        },
                                        child: const Text("ACCEPT")),
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 300),
                      ],
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 24),
                              Text(
                                "Profile",
                                style: AppFont.largeBold(context),
                              ),
                              const SizedBox(height: 12),
                            ],
                          ),
                        ),
                        const Divider(),
                        const SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            children: [
                              ImagePickerWidget(
                                cubit: cubit,
                                imageUrl: store?.storeImage,
                                pickedImage: state.pickedImage,
                                pickGaleryPressed: () {
                                  cubit
                                      .pickImage(ImageSource.gallery)
                                      .then((value) => context.pop());
                                },
                                pickCameraPressed: () {
                                  cubit
                                      .pickImage(ImageSource.camera)
                                      .then((value) => context.pop());
                                },
                              ),
                              const SizedBox(height: 24),
                              FormBuilder(
                                key: cubit.formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    OutlineFormText(
                                      readOnly: store?.storeName != null
                                          ? true
                                          : false,
                                      name: 'name_store',
                                      hintText: 'Masukan nama toko',
                                      label:
                                          'Nama Toko (Nama toko tidak bisa diubah)',
                                      initialValue: store?.storeName ?? "",
                                    ),
                                    const SizedBox(height: 16),
                                    OutlineFormText(
                                      name: 'pic',
                                      hintText: 'Masukan nama pic',
                                      label: 'PIC Toko',
                                      initialValue: store?.picName ?? "",
                                    ),
                                    const SizedBox(height: 16),
                                    OutlineFormText(
                                      keyboardType: TextInputType.phone,
                                      name: 'no_telepon',
                                      hintText: 'Masukan nomor telepon',
                                      label: 'NO Telepon',
                                      initialValue: store?.phoneNumber ?? "",
                                    ),
                                    const SizedBox(height: 16),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Text("Address",
                                          style: AppFont.largeBold(context)),
                                    ),
                                    const SizedBox(height: 8),
                                    CSCPicker(
                                      currentCity: store?.city ?? "",
                                      currentCountry: store?.country ?? "",
                                      currentState: store?.state,
                                      onCountryChanged: (value) {
                                        cubit.setCountry(value);
                                      },
                                      onStateChanged: (value) {
                                        cubit.setAddressState(value ?? "");
                                      },
                                      onCityChanged: (value) {
                                        cubit.setCity(value ?? "");
                                      },
                                      dropdownDecoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(58)),
                                          color: Colors.white,
                                          border: Border.all(
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                              width: 1)),
                                      disabledDropdownDecoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(58)),
                                          color: Colors.grey.shade300,
                                          border: Border.all(
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                              width: 1)),
                                      flagState: CountryFlag.DISABLE,
                                    ),
                                    const SizedBox(height: 16),
                                    OutlineFormText(
                                      name: 'address',
                                      hintText: 'Masukan alamat lengkap',
                                      label: 'Alamat lengkap',
                                      initialValue: store?.phoneNumber ?? "",
                                    ),
                                    const SizedBox(height: 16),
                                    OutlineFormText(
                                      keyboardType: TextInputType.number,
                                      initialValue: store?.postalCode ?? "",
                                      name: 'postcal_code',
                                      hintText: 'Mauskan Kode Pos',
                                      label: 'Kode POS',
                                    ),
                                    const SizedBox(height: 16),
                                    RegisterBankAccount(
                                      cubit: cubit,
                                      store: store,
                                      state: state,
                                    ),
                                    RegisterBussinessPartner(
                                      cubit: cubit,
                                      store: store,
                                      state: state,
                                    ),
                                    const SizedBox(height: 24),
                                    const Divider(thickness: 1),
                                    const SizedBox(height: 30),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Text("Users",
                                          style: AppFont.largeBold(context)),
                                    ),
                                    const SizedBox(height: 8),
                                    ListView.separated(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount:
                                          state.store?.users?.length ?? 0,
                                      itemBuilder: (context, index) {
                                        var user = state.store?.users?[index];
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: OutlineFormText(
                                                suffixText: user
                                                        ?.storeDatabaseName
                                                        ?.role ??
                                                    "unknown",
                                                name: 'user${user?.id}',
                                                hintText:
                                                    'Mauskan Email untuk menambahkan',
                                                initialValue: user?.email,
                                              ),
                                            ),
                                            const SizedBox(width: 32),
                                            InkWell(
                                              onTap: () {
                                                cubit.addCashier();
                                              },
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                decoration: const BoxDecoration(
                                                    color: Colors.black,
                                                    shape: BoxShape.circle),
                                                child: const Center(
                                                    child: Icon(
                                                  color: Colors.white,
                                                  Icons.add,
                                                  weight: 4,
                                                )),
                                              ),
                                            ),
                                            const SizedBox(width: 16),
                                            InkWell(
                                              onTap: () {
                                                if (user?.storeDatabaseName
                                                        ?.role ==
                                                    "ADMIN") {
                                                  ShowNotify.show(context,
                                                      msg:
                                                          "Tidak bisa hapus admin");
                                                } else {
                                                  cubit.removeCashier(
                                                      email: user?.email ?? "",
                                                      idUser: user?.id ?? "",
                                                      idDatabase: user
                                                              ?.storeDatabaseName
                                                              ?.id ??
                                                          "");
                                                }
                                              },
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                decoration: const BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 219, 219, 219),
                                                    shape: BoxShape.circle),
                                                child: const Center(
                                                    child: Icon(
                                                  Icons.remove,
                                                  weight: 4,
                                                )),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return const SizedBox(height: 12);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 40),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 100),
                          child: Row(
                            children: [
                              Expanded(
                                  child: ClipRRect(
                                borderRadius: BorderRadius.circular(38),
                                child: SizedBox(
                                    height: 50,
                                    child: OutlinedButton(
                                      onPressed: () {
                                        if (store?.storeName == null) {
                                          context.pop();
                                        } else {
                                          cubitDashboard.changePage(0);
                                        }
                                      },
                                      style: OutlinedButton.styleFrom(
                                        side: const BorderSide(),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(38),
                                        ),
                                      ),
                                      child: const Text('CANCEL'),
                                    )),
                              )),
                              const SizedBox(width: 40),
                              Expanded(
                                  child: ClipRRect(
                                borderRadius: BorderRadius.circular(38),
                                child: SizedBox(
                                  height: 50,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        cubit.addBankAccount().then((value) {
                                          cubit.updateProfile().then((value) =>
                                              cubitDashboard.changePage(0));
                                        });
                                      },
                                      child: const Text("SAVE")),
                                ),
                              ))
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    );
                  }
                }),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:csc_picker/csc_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/modules/dashboard/profile/cubit/profile_cubit.dart';
import 'package:pos/themes/themes.dart';
import 'package:pos/widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FD),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          var store = state.store?.store;
          return ContainerStateHandler(
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
                child: Column(
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
                          DottedBorder(
                            dashPattern: [6, 6],
                            borderType: BorderType.RRect,
                            color: Colors.grey,
                            child: Container(
                              height: 163,
                              width: baseWidth,
                              decoration: const BoxDecoration(
                                color: Color(0xffF8F9FD),
                              ),
                              child: state.store?.store?.storeImage != null
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ImageLoad(
                                            padding: const EdgeInsets.all(12),
                                            fit: BoxFit.cover,
                                            height: 100,
                                            imageUrl: Environment.showUrlImage(
                                                path: state.store?.store
                                                        ?.storeImage ??
                                                    "")),
                                        const Text("Tap untuk ubah foto")
                                      ],
                                    )
                                  : const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.image, size: 70),
                                        SizedBox(height: 12),
                                        Text("Unggah Foto Toko"),
                                      ],
                                    ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          FormBuilder(
                            key: cubit.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                OutlineFormText(
                                  name: 'name_store',
                                  hintText: 'Masukan nama toko',
                                  label: 'Nama Toko',
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
                                  name: 'no_telepon',
                                  hintText: 'Masukan nomor telepon',
                                  label: 'NO Telepon',
                                  initialValue: store?.noTelepon ?? "",
                                ),
                                const SizedBox(height: 16),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text("Address",
                                      style: AppFont.largeBold(context)),
                                ),
                                const SizedBox(height: 8),
                                CSCPicker(
                                  dropdownDecoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(58)),
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.black.withOpacity(0.6),
                                          width: 1)),
                                  disabledDropdownDecoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(58)),
                                      color: Colors.grey.shade300,
                                      border: Border.all(
                                          color: Colors.black.withOpacity(0.6),
                                          width: 1)),
                                  flagState: CountryFlag.DISABLE,
                                  onCountryChanged: (String value) {},
                                  onStateChanged: (value) {},
                                  onCityChanged: (value) {},
                                ),
                                const SizedBox(height: 16),
                                OutlineFormText(
                                  initialValue: store?.postalCode ?? "",
                                  name: 'postcal_code',
                                  hintText: 'Mauskan Kode Pos',
                                  label: 'Kode POS',
                                ),
                                const SizedBox(height: 16),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text("User Kasir",
                                      style: AppFont.largeBold(context)),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Expanded(
                                      child: OutlineFormText(
                                        name: 'user',
                                        hintText:
                                            'Mauskan Email untuk menambahkan',
                                        initialValue: "",
                                      ),
                                    ),
                                    const SizedBox(width: 32),
                                    Container(
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
                                    const SizedBox(width: 16),
                                    Container(
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
                                  ],
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
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(38),
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
                                  onPressed: () {}, child: const Text("SAVE")),
                            ),
                          ))
                        ],
                      ),
                    ),
                    const SizedBox(height: 40)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class OutlineFormText extends StatelessWidget {
  final String name;
  final String hintText;
  final String? initialValue;
  final String? label;
  const OutlineFormText({
    super.key,
    required this.name,
    required this.hintText,
    this.label,
    required this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text("${label}", style: AppFont.largeBold(context)),
              )
            : const SizedBox(),
        label != null ? const SizedBox(height: 8) : const SizedBox(),
        FormBuilderTextField(
          initialValue: initialValue,
          name: name,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderSide: const BorderSide(width: 1),
              borderRadius: BorderRadius.circular(58),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            hintStyle: const TextStyle(fontSize: 16),
            filled: true,
            fillColor: const Color(0xffffffff),
          ),
        ),
      ],
    );
  }
}

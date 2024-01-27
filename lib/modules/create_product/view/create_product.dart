import 'dart:io';
import 'package:abditrack_inventory/engine/engine.dart';
import 'package:abditrack_inventory/modules/create_product/cubit/create_product_cubit.dart';
import 'package:abditrack_inventory/themes/themes.dart';
import 'package:abditrack_inventory/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';

class CreateProductPage extends StatelessWidget {
  const CreateProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateProductCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrasi Produk"),
      ),
      body: BlocBuilder<CreateProductCubit, CreateProductState>(
        builder: (context, state) {
          return ContainerStateHandler(
            loading: const Center(
              child: CircularProgressIndicator(),
            ),
            status: state.status,
            child: SingleChildScrollView(
              child: FormBuilder(
                key: cubit.formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const OutlineTextField(
                        hintText: 'Masukan Nama Produk',
                        name: 'name',
                        label: 'Nama Produk',
                      ),
                      const SizedBox(height: 20),
                      const OutlineTextField(
                        hintText: 'Masukan Deskripsi Produk',
                        name: 'description',
                        label: 'Deskripsi',
                      ),
                      const SizedBox(height: 20),
                      const OutlineTextField(
                        typeInput: TextInputType.number,
                        hintText: 'Masukan Kode Produk',
                        maxLength: 6,
                        name: 'code_product',
                        label: 'Kode Produk',
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Aturan menambahkan barang dari produk ini",
                            style: AppFont.mediumBold(context),
                          )),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              child: FormBuilderCheckbox(
                                initialValue: true,
                                name: 'scan_imei',
                                onChanged: (value) {
                                  print('Nilai Checkbox: $value');
                                },
                                title: const Text("Scan IMEI"),
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              child: FormBuilderCheckbox(
                                initialValue: true,
                                name: 'scan_sn',
                                onChanged: (value) {
                                  print('Nilai Checkbox: $value');
                                },
                                title: const Text("Scan SN"),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: ElevatedButton(
                                  onPressed: () {
                                    cubit.pickImage(ImageSource.gallery);
                                  },
                                  child: Text(
                                    "Pilih Dari Kamera",
                                    style: AppFont.whiteLarge(context),
                                  )),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: ElevatedButton(
                                  onPressed: () {
                                    cubit.pickImage(ImageSource.gallery);
                                  },
                                  child: Text(
                                    "Pilih Dari Galery",
                                    style: AppFont.whiteLarge(context),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      state.pickedImage != null
                          ? Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              height: 260,
                              width: double.infinity,
                              child: Image.file(
                                File(state.pickedImage!.path),
                              ),
                            )
                          : Container(
                              height: 260,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.grey.withOpacity(0.4)),
                              child: Center(
                                child: Text(
                                  "No Image",
                                  style: AppFont.largeBold(context)!
                                      .copyWith(fontSize: 20),
                                ),
                              ),
                            ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        width: baseWidth,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: ElevatedButton(
                              onPressed: () {
                                cubit.formKey.currentState!.save();
                                cubit.doSave();
                              },
                              child: Text(
                                "Simpan Produk",
                                style: AppFont.largeBold(context)!.copyWith(
                                    color: Colors.white, fontSize: 16),
                              )),
                        ),
                      ),
                      SizedBox(height: 120)
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class OutlineTextField extends StatelessWidget {
  final String hintText;
  final String label;
  final TextInputType? typeInput;
  final String name;
  final int? maxLength;
  final bool obsecureText;
  final String? initialValue;
  final bool readOnly;
  const OutlineTextField(
      {super.key,
      required this.hintText,
      required this.name,
      this.maxLength,
      this.obsecureText = false,
      this.typeInput,
      this.readOnly = false,
      this.initialValue,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppFont.largeBold(context)),
        const SizedBox(height: 4),
        FormBuilderTextField(
          readOnly: readOnly,
          initialValue: initialValue,
          obscureText: obsecureText,
          keyboardType: typeInput,
          maxLength: maxLength,
          name: name,
          decoration: InputDecoration(
              hintText: hintText,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
        ),
      ],
    );
  }
}

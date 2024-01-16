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
                        hintText: 'Nama Produk',
                        name: 'name',
                      ),
                      const SizedBox(height: 20),
                      const OutlineTextField(
                        hintText: 'Deskripsi',
                        name: 'description',
                      ),
                      const SizedBox(height: 20),
                      const OutlineTextField(
                        typeInput: TextInputType.number,
                        hintText: 'Kode Produk',
                        maxLength: 6,
                        name: 'code_product',
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  cubit.pickImage(ImageSource.gallery);
                                },
                                child: Text(
                                  "Pilih Dari Kamera",
                                  style: AppFont.whiteLarge(context),
                                )),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  cubit.pickImage(ImageSource.gallery);
                                },
                                child: Text(
                                  "Pilih Dari Galery",
                                  style: AppFont.whiteLarge(context),
                                )),
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
                        child: ElevatedButton(
                            onPressed: () {
                              cubit.formKey.currentState!.save();
                              cubit.doSave();
                            },
                            child: Text(
                              "Simpan Produk",
                              style: AppFont.largeBold(context)!
                                  .copyWith(color: Colors.white, fontSize: 16),
                            )),
                      )
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
  final TextInputType? typeInput;
  final String name;
  final int? maxLength;
  const OutlineTextField(
      {super.key,
      required this.hintText,
      required this.name,
      this.maxLength,
      this.typeInput});

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      keyboardType: typeInput,
      maxLength: maxLength,
      name: name,
      decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
    );
  }
}

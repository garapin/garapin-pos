import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/themes/themes.dart';
import 'package:pos/widgets/widgets.dart';

import '../cubit/create_product_cubit.dart';

class CreateProductPage extends StatelessWidget {
  const CreateProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateProductCubit>();
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FD),
      body: BlocBuilder<CreateProductCubit, CreateProductState>(
        builder: (context, state) {
          return ContainerStateHandler(
            status: state.status,
            refresherOptions: cubit.defaultRefresh,
            loading: const Center(
              child: CircularProgressIndicator(),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
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
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      context.pop();
                                    },
                                    icon: const Icon(
                                      Icons.arrow_back,
                                      size: 26,
                                    )),
                                Text(
                                  "Tambah Produk",
                                  style: AppFont.largeBold(context),
                                ),
                              ],
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
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(24),
                                        ),
                                        title: Text(
                                            "Pilih gambar yang akan ditampilkan"),
                                        actions: [
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(38),
                                                child: SizedBox(
                                                    height: 50,
                                                    child: OutlinedButton(
                                                      onPressed: () {
                                                        cubit
                                                            .pickImage(
                                                                ImageSource
                                                                    .gallery)
                                                            .then((value) =>
                                                                context.pop());
                                                      },
                                                      style: OutlinedButton
                                                          .styleFrom(
                                                        side:
                                                            const BorderSide(),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(38),
                                                        ),
                                                      ),
                                                      child: const Text(
                                                          'Ambil dari galeri'),
                                                    )),
                                              )),
                                              const SizedBox(width: 12),
                                              Expanded(
                                                  child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(38),
                                                child: SizedBox(
                                                  height: 50,
                                                  child: ElevatedButton(
                                                      onPressed: () {
                                                        cubit
                                                            .pickImage(
                                                                ImageSource
                                                                    .camera)
                                                            .then((value) =>
                                                                context.pop());
                                                      },
                                                      child: const Text(
                                                          "Ambil foto")),
                                                ),
                                              ))
                                            ],
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  height: 163,
                                  width: baseWidth,
                                  decoration: const BoxDecoration(
                                    color: Color(0xffF8F9FD),
                                  ),
                                  child: (state.pickedImage != null)
                                      ? Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          height: 260,
                                          width: double.infinity,
                                          child: Image.file(
                                            File(state.pickedImage!.path),
                                          ),
                                        )
                                      : const Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.image, size: 80),
                                            SizedBox(height: 12),
                                            Text(
                                                "Unggah Foto Thumbnail produk"),
                                          ],
                                        ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                            SizedBox(
                              height: 80,
                              width: baseWidth,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: state.listIcon.length,
                                itemBuilder: (context, index) {
                                  return CustomButton(
                                    onPressed: () {
                                      cubit.selectedIcon(state.listIcon[index]);
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                                color: state.selectedIcon ==
                                                        state.listIcon[index]
                                                    ? AppColor.appColor.primary
                                                    : Colors.grey,
                                                width: 3)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: ImageLoad(
                                            imageUrl: Environment.showUrlImage(
                                                path: state.listIcon[index]),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            FormBuilder(
                              key: cubit.formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 16),
                                  OutlineFormText(
                                    name: 'name_product',
                                    hintText: 'Masukan Nama Produk',
                                    label: 'Nama Produk',
                                    validator: (v) {
                                      if (v != null) {
                                        return null;
                                      } else {
                                        return 'Nama produk tidak boleh kosong';
                                      }
                                    },
                                    // initialValue: store?.storeName ?? "",
                                  ),
                                  const SizedBox(height: 16),
                                  OutlineFormText(
                                    name: 'sku',
                                    hintText: 'Masukan Kode Produk',
                                    label: 'Kode Produk / Sku',
                                    validator: (v) {
                                      if (v != null) {
                                        return null;
                                      } else {
                                        return 'Sku produk tidak boleh kosong';
                                      }
                                    },
                                    // initialValue: store?.storeName ?? "",
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: OutlineFormDropdown(
                                            validator: (v) {
                                              if (v != null) {
                                                return null;
                                              } else {
                                                return 'Merek produk tidak boleh kosong';
                                              }
                                            },
                                            name: 'brand',
                                            hintText: 'Pilih Merek',
                                            label: 'Merek',
                                            items: state.brand
                                                .map((e) => DropdownMenuItem(
                                                    value: e.id,
                                                    child: Text(
                                                      e.brand ?? "",
                                                      style: AppFont.large(
                                                              context)!
                                                          .copyWith(
                                                              fontSize: 14,
                                                              color:
                                                                  Colors.black),
                                                    )))
                                                .toList()),
                                      ),
                                      const SizedBox(width: 32),
                                      Row(
                                        children: [
                                          MinButton(
                                            onTap: () {
                                              cubit.deleteBrand();
                                            },
                                          ),
                                          SizedBox(width: 24),
                                          PlusButton(
                                            onTap: () {
                                              cubit.addBrand();
                                            },
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 16),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: OutlineFormDropdown(
                                            validator: (v) {
                                              if (v != null) {
                                                return null;
                                              } else {
                                                return 'Kategori produk tidak boleh kosong';
                                              }
                                            },
                                            name: 'category',
                                            hintText: 'Pilih Kategori',
                                            label: 'Kategori',
                                            items: state.category
                                                .map((e) => DropdownMenuItem(
                                                    value: e.id,
                                                    child: Text(
                                                      e.category ?? "",
                                                      style: AppFont.large(
                                                              context)!
                                                          .copyWith(
                                                              fontSize: 14,
                                                              color: e.id ==
                                                                      "Semua"
                                                                  ? Colors.grey
                                                                  : Colors
                                                                      .black),
                                                    )))
                                                .toList()),
                                      ),
                                      const SizedBox(width: 32),
                                      Row(
                                        children: [
                                          MinButton(
                                            onTap: () {
                                              cubit.deleteCategory();
                                            },
                                          ),
                                          SizedBox(width: 24),
                                          PlusButton(
                                            onTap: () {
                                              cubit.addCategory();
                                            },
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 16),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: OutlineFormDropdown(
                                            validator: (v) {
                                              if (v != null) {
                                                return null;
                                              } else {
                                                return 'Unit tidak boleh kosong';
                                              }
                                            },
                                            name: 'unit',
                                            hintText: 'Pilih Unit',
                                            label: 'Unit (pcs, lusin, kg)',
                                            items: state.unit
                                                .map((e) => DropdownMenuItem(
                                                    value: e.id,
                                                    child: Text(
                                                      e.unit ?? "",
                                                      style: AppFont.large(
                                                              context)!
                                                          .copyWith(
                                                              fontSize: 14,
                                                              color:
                                                                  Colors.black),
                                                    )))
                                                .toList()),
                                      ),
                                      const SizedBox(width: 32),
                                      Row(
                                        children: [
                                          MinButton(
                                            onTap: () {
                                              cubit.deleteUnit();
                                            },
                                          ),
                                          SizedBox(width: 24),
                                          PlusButton(
                                            onTap: () {
                                              cubit.addUnit();
                                            },
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 16),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: OutlineFormText(
                                          validator: (v) {
                                            if (v != null) {
                                              return null;
                                            } else {
                                              return 'Harga produk tidak boleh kosong';
                                            }
                                          },
                                          name: 'price',
                                          hintText: 'Masukan Harga Jual',
                                          label: 'Harga Jual',
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: OutlineFormText(
                                          name: 'discount',
                                          hintText: 'Masukan Potongan Harga',
                                          label: 'Harga Diskon',
                                        ),
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
                                    onPressed: () {
                                      context.pop();
                                    },
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
                                    onPressed: () {
                                      if (cubit.formKey.currentState!
                                          .saveAndValidate()) {
                                        cubit.createProduct();
                                      } else {
                                        ShowNotify.error(context,
                                            msg: "Lengkapi form invalid");
                                      }
                                    },
                                    child: const Text("SAVE")),
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
            ),
          );
        },
      ),
    );
  }
}

class PlusButton extends StatelessWidget {
  const PlusButton({
    super.key,
    required this.onTap,
  });
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        InkWell(
          onTap: onTap,
          child: Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
                color: Colors.black, shape: BoxShape.circle),
            child: const Center(
                child: Icon(
              color: Colors.white,
              Icons.add,
              weight: 4,
            )),
          ),
        ),
      ],
    );
  }
}

class MinButton extends StatelessWidget {
  const MinButton({
    super.key,
    required this.onTap,
  });
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        InkWell(
          onTap: onTap,
          child: Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 219, 219, 219),
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
  }
}

class OutlineFormText extends StatelessWidget {
  final TextInputType? keyboardType;
  final String name;
  final String hintText;
  final String? initialValue;
  final String? label;
  final String? suffixText;
  final String? Function(String?)? validator;
  const OutlineFormText({
    super.key,
    required this.name,
    required this.hintText,
    this.label,
    this.initialValue,
    this.suffixText,
    this.keyboardType,
    this.validator,
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
          keyboardType: keyboardType,
          initialValue: initialValue,
          validator: validator,
          name: name,
          decoration: InputDecoration(
            suffixText: suffixText,
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

class OutlineFormDropdown extends StatelessWidget {
  final String name;
  final String hintText;
  final String? initialValue;
  final String? label;
  final String? suffixText;
  final String? Function(dynamic)? validator;
  final List<DropdownMenuItem<dynamic>> items;
  const OutlineFormDropdown({
    Key? key,
    required this.name,
    required this.hintText,
    required this.items,
    this.label,
    this.initialValue,
    this.suffixText,
    this.validator,
  }) : super(key: key);

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
        FormBuilderDropdown(
          validator: validator,
          initialValue: initialValue,
          name: name,
          items: items,
          decoration: InputDecoration(
            suffixText: suffixText,
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

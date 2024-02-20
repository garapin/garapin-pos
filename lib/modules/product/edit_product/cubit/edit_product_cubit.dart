import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos/data/models/base/product.dart';
import 'package:pos/engine/base/base_cubit.dart';
import 'package:pos/engine/engine.dart';

import '../../../../data/models/base/brand.dart';
import '../../../../data/models/base/category.dart';
import '../../../../data/models/base/unit.dart';
import '../../../../data/models/request/req_product.dart';
import '../../../../data/services.dart';
import '../../../../engine/helpers/compressed_base64.dart';

part 'edit_product_state.dart';
part 'edit_product_cubit.freezed.dart';

class EditProductCubit extends BaseCubit<EditProductState> {
  final String idProduct;
  final TextEditingController addCategoryController = TextEditingController();
  final TextEditingController addBrandController = TextEditingController();
  final TextEditingController addUnitController = TextEditingController();
  final formKey = GlobalKey<FormBuilderState>();
  EditProductCubit(BuildContext context, this.idProduct)
      : super(context, EditProductState());

  @override
  Future<void> initData({bool force = true}) async {
    loadingState(force: force);
    final category = await ApiService.category(context);
    final icon = await ApiService.getIconProduct(context);
    final brand = await ApiService.brand(context);
    final unit = await ApiService.unit(context);
    final singleCatalog =
        await ApiService.singleCatalog(context, id: idProduct);
    if (singleCatalog.isSuccess) {
      emit(state.copyWith(
          status: DataStateStatus.success,
          unit: unit.data,
          product: singleCatalog.data,
          selectedIcon: singleCatalog.data?.icon ?? "",
          listIcon: icon.data as List<String>,
          category:
              category.data.where((item) => item.category != 'Semua').toList(),
          brand: brand.data));
    } else {
      emit(state.copyWith(
        status: DataStateStatus.error,
      ));
    }

    finishRefresh(state.status);
  }

  @override
  void loadingState({bool force = true}) {
    if (force) {
      emit(state.copyWith(status: DataStateStatus.initial));
    } else {
      emit(state.copyWith(status: DataStateStatus.loading));
    }
  }

  @override
  Future<void> refreshData() => initData(force: false);

  Future<void> pickImage(ImageSource source) async {
    try {
      XFile? image = await ImagePicker().pickImage(source: source);
      emit(state.copyWith(pickedImage: image));
    } catch (e) {
      showError("Gagal mengambil gambar");
    }
  }

  createProduct() async {
    var form = formKey.currentState?.value;
    String? base64Image;
    if (state.pickedImage?.path != null) {
      File imageFile = File(state.pickedImage!.path);
      Uint8List compressedImageBytes = await compressImage(imageFile);
      base64Image = base64Encode(compressedImageBytes);
      String prefix =
          "data:image/${state.pickedImage?.path.split(".").last};base64,$base64Image}";
      base64Image = prefix;
    } else {
      base64Image = "";
    }
    final data = await ApiService.editProduct(context,
        product: ReqProduct(
            id: state.product?.id,
            name: form?["name_product"],
            sku: form?["sku"],
            brandRef: form?["brand"],
            categoryRef: form?["category"],
            unitRef: form?["unit"],
            discount: int.parse(form?["discount"] ?? "0"),
            price: int.parse(form?["price"]),
            image: base64Image,
            icon: state.selectedIcon));
    if (data.isSuccess) {
      showSuccess(data.message);
      context.pop();
    } else {
      showError(data.message);
    }
  }

  addCategory() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text('Buat Category'),
          content: TextField(
            controller: addCategoryController,
            decoration: const InputDecoration(hintText: 'Nama category'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (addCategoryController.text == "") {
                  showError("Nama tidak boleh kosong");
                } else {
                  final data = await ApiService.createCategory(context,
                      nameCategory: addCategoryController.text);
                  if (data.isSuccess) {
                    showSuccess(data.message);
                  } else {
                    showError(data.message);
                  }
                  refreshData();
                  context.pop();
                }
              },
              child: const Text('Tambah'),
            ),
          ],
        );
      },
    );
  }

  addBrand() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text('Daftarkan Merek'),
          content: TextField(
            controller: addBrandController,
            decoration: const InputDecoration(hintText: 'Merek'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (addBrandController.text == "") {
                  showError("Merk tidak boleh kosong");
                } else {
                  final data = await ApiService.createBrand(context,
                      nameBrand: addBrandController.text);
                  if (data.isSuccess) {
                    showSuccess(data.message);
                  } else {
                    showError(data.message);
                  }
                  refreshData();
                  context.pop();
                }
              },
              child: const Text('Tambah'),
            ),
          ],
        );
      },
    );
  }

  addUnit() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text('Daftarkan Unit'),
          content: TextField(
            controller: addUnitController,
            decoration: const InputDecoration(hintText: 'Unit'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (addUnitController.text == "") {
                  showError("Unit tidak boleh kosong");
                } else {
                  final data = await ApiService.createUnit(context,
                      nameUnit: addUnitController.text);
                  if (data.isSuccess) {
                    showSuccess(data.message);
                  } else {
                    showError(data.message);
                  }
                  refreshData();
                  context.pop();
                }
              },
              child: const Text('Tambah'),
            ),
          ],
        );
      },
    );
  }

  Future<void> deleteBrandMethod(String id) async {
    final data = await ApiService.deleteUnit(context, id: id);
    if (data.isSuccess) {
      showSuccess(data.message);
    } else {
      showError(data.message);
    }
    finishRefresh(state.status);
  }

  Future<void> deleteCategoryMethod(String id) async {
    final data = await ApiService.deleteCategory(context, id: id);
    if (data.isSuccess) {
      showSuccess(data.message);
    } else {
      showError(data.message);
    }
    finishRefresh(state.status);
  }

  Future<void> deleteUnitMehtod(String id) async {
    final data = await ApiService.deleteUnit(context, id: id);
    if (data.isSuccess) {
      showSuccess(data.message);
    } else {
      showError(data.message);
    }
    finishRefresh(state.status);
  }

  deleteBrand() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text('Tap untuk hapus merk'),
          content: Container(
            height: 400,
            width: 400,
            child: ListView.builder(
              itemCount: state.brand.length,
              itemBuilder: (context, index) {
                var brand = state.brand[index];
                return ListTile(
                  title: Text(
                    brand.brand ?? "",
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        deleteBrandMethod(brand.id!)
                            .then((value) => refreshData());
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                );
              },
            ),
          ),
        );
      },
    );
  }

  deleteCategory() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text('Tap untuk hapus kategori'),
          content: Container(
            height: 400,
            width: 400,
            child: ListView.builder(
              itemCount: state.category.length,
              itemBuilder: (context, index) {
                var category = state.category[index];
                return ListTile(
                  title: Text(
                    category.category ?? "",
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        deleteCategoryMethod(category.id!)
                            .then((value) => refreshData());
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                );
              },
            ),
          ),
        );
      },
    );
  }

  deleteUnit() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text('Tap untuk hapus unit'),
          content: Container(
            height: 400,
            width: 400,
            child: ListView.builder(
              itemCount: state.unit.length,
              itemBuilder: (context, index) {
                var unit = state.unit[index];
                return ListTile(
                  title: Text(
                    unit.unit ?? "",
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        deleteBrandMethod(unit.id!)
                            .then((value) => refreshData());
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                );
              },
            ),
          ),
        );
      },
    );
  }

  void selectedIcon(String path) {
    emit(state.copyWith(selectedIcon: path));
  }
}

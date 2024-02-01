import 'dart:developer';
import 'package:abditrack_inventory/engine/base/app.dart';
import 'package:abditrack_inventory/modules/cart/cubit/cart_cubit.dart';
import 'package:abditrack_inventory/modules/create_product/view/create_product.dart';
import 'package:abditrack_inventory/widgets/components/empty_widget_image.dart';
import 'package:abditrack_inventory/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import '../../../engine/helpers/options.dart';
import '../../../themes/themes.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartCubit>();
    return BlocBuilder<CartCubit, CartState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Keranjang"),
        ),
        body: ContainerStateHandler(
          refresherOptions: RefresherOptions(
            controller: cubit.refreshController,
            onRefresh: cubit.refreshData,
          ),
          status: state.status,
          emptyOptions: EmptyOptions(customEmpty: EmptyImageData()),
          loading: const Center(
            child: CircularProgressIndicator(),
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.cart.length,
                  itemBuilder: (context, index) {
                    var cart = state.cart[index];
                    return CustomButton(
                      borderRadius: BorderRadius.circular(16),
                      onPressed: () {
                        if (cart.status == "OUT") {
                          ShowNotify.show(context,
                              msg: "Item Sudah Keluar, tidak bisa dipilih");
                        } else {
                          cubit.selectedItem(state.cart[index].id.toString());
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          child: Row(
                            children: [
                              Checkbox(
                                  value: state.selectedItem.contains(
                                          state.cart[index].id.toString())
                                      ? true
                                      : false,
                                  onChanged: (val) {
                                    log("message");
                                  }),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.cart[index].noProduct ?? "",
                                    style: AppFont.largeBold(context),
                                  ),
                                  SizedBox(
                                    width: baseWidth * 0.6,
                                    child: Text(
                                      "IMEI ${state.cart[index].imei} | SN ${state.cart[index].noSn}",
                                      style: AppFont.medium(context),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                              const Spacer(),
                              Container(
                                height: 30,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(32),
                                    color: AppColor.appColor.primary
                                        .withOpacity(0.2)),
                                child: Center(
                                    child: Text(
                                        state.cart[index].status
                                                ?.toUpperCase() ??
                                            "",
                                        style: AppFont.whiteLarge(context)!
                                            .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.appColor.primary,
                                        ))),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
        bottomNavigationBar: (state.selectedItem.isEmpty)
            ? null
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SizedBox(
                    height: 50,
                    width: baseWidth,
                    child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            showDragHandle: true,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12))),
                            context: context,
                            isScrollControlled:
                                true, // Set this to true to make it a full page sheet
                            builder: (BuildContext context) {
                              return ModalTransaction(cubit: cubit);
                            },
                          );
                        },
                        child: const Text("Transaksi")),
                  ),
                ),
              ),
      );
    });
  }
}

class ModalTransaction extends StatelessWidget {
  const ModalTransaction({
    super.key,
    required this.cubit,
  });

  final CartCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(context),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return ContainerStateHandler(
            loading: const Center(
              child: CircularProgressIndicator(),
            ),
            status: state.status,
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              height: baseHeight - 150,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: FormBuilder(
                  key: cubit.formKey,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                            onPressed: () {
                              context.pop();
                            },
                            icon: const Icon(
                              Icons.close,
                              weight: 30,
                              size: 30,
                            )),
                      ),
                      Text(
                        "Tanda Tangan",
                        style:
                            AppFont.largeBold(context)!.copyWith(fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                          height: 200,
                          width: baseWidth,
                          child: SfSignaturePad(
                            key: cubit.signaturePadKey,
                            backgroundColor: Colors.grey.withOpacity(0.2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const OutlineTextField(
                          hintText: "Tujuan Transaksi",
                          name: "transaction_purpose",
                          label: "Masukan tujuan transaksi"),
                      const SizedBox(height: 16),
                      const OutlineTextField(
                          hintText: "Masukan Catatan",
                          name: "notes",
                          label: "Catatan transaksi"),
                      const SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Teknisi Yang ditugaskan",
                              style: AppFont.largeBold(context)),
                          SizedBox(height: 4),
                          MultiSelectDropDown<int>(
                            hint: "Pilih Teknisi Yang ditugaskan",
                            inputDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey),
                            ),
                            onOptionSelected:
                                (List<ValueItem> selectedOptions) async {
                              cubit.selectedListTeknisi(selectedOptions);
                            },
                            options: state.users
                                .map(
                                  (e) => ValueItem(
                                      label: e.username ?? "",
                                      value: int.parse(e.id.toString())),
                                )
                                .toList(),
                            selectionType: SelectionType.multi,
                            chipConfig:
                                const ChipConfig(wrapType: WrapType.wrap),
                            dropdownHeight: 300,
                            optionTextStyle: const TextStyle(fontSize: 16),
                            selectedOptionIcon: const Icon(Icons.check_circle),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerLeft,
                        child:
                            Text("Customer", style: AppFont.largeBold(context)),
                      ),
                      SizedBox(height: 4),
                      FormBuilderDropdown(
                          onChanged: (value) {
                            cubit.selectedMitra(value!);
                          },
                          decoration: InputDecoration(
                              hintText: "Pilih customer",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              )),
                          name: "id_mitra",
                          items: state.listMitra.map((e) {
                            return DropdownMenuItem(
                                value: e.id, child: Text(e.name ?? ""));
                          }).toList()),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: baseWidth,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              cubit.doTransaction();
                              context.pop();
                            },
                            child: Text(
                              "Kirim & Dapatkan Surat Jalan",
                              style: AppFont.whiteLarge(context)!
                                  .copyWith(fontSize: 18),
                            )),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ), // Your custom bottom sheet content goes here
            ),
          );
        },
      ),
    );
  }
}

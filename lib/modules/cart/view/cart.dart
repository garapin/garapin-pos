import 'dart:convert';
import 'dart:developer';
import 'dart:ui' as ui;

import 'package:abditrack_inventory/engine/base/app.dart';
import 'package:abditrack_inventory/modules/cart/cubit/cart_cubit.dart';
import 'package:abditrack_inventory/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
                    return CustomButton(
                      borderRadius: BorderRadius.circular(16),
                      onPressed: () {
                        cubit.selectedItem(state.cart[index].id.toString());
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
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12))),
                            context: context,
                            isScrollControlled:
                                true, // Set this to true to make it a full page sheet
                            builder: (BuildContext context) {
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
                                        height: 600,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Column(
                                          children: [
                                            SizedBox(height: 12),
                                            Align(
                                              alignment: Alignment.centerLeft,
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
                                              style: AppFont.largeBold(context)!
                                                  .copyWith(fontSize: 16),
                                            ),
                                            SizedBox(height: 16),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              child: SizedBox(
                                                height: 300,
                                                width: baseWidth,
                                                child: SfSignaturePad(
                                                  key: cubit.signaturePadKey,
                                                  backgroundColor: Colors.grey
                                                      .withOpacity(0.2),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            SizedBox(
                                              width: baseWidth,
                                              height: 50,
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    cubit.doTransaction();
                                                    log("asd");
                                                  },
                                                  child: Text(
                                                    "Kirim & Dapatkan Surat Jalan",
                                                    style: AppFont.whiteLarge(
                                                            context)!
                                                        .copyWith(fontSize: 18),
                                                  )),
                                            ),
                                            const SizedBox(height: 40),
                                          ],
                                        ), // Your custom bottom sheet content goes here
                                      ),
                                    );
                                  },
                                ),
                              );
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

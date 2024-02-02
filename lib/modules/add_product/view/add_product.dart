import 'dart:async';
import 'dart:developer';

import 'package:armory/engine/engine.dart';
import 'package:armory/modules/add_product/cubit/add_product_cubit.dart';
import 'package:armory/modules/add_product/view/text_dropdown.dart';
import 'package:armory/themes/themes.dart';
import 'package:armory/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddProductCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barang Masuk'),
      ),
      body: BlocBuilder<AddProductCubit, AddProductState>(
        builder: (context, state) {
          return ContainerStateHandler(
            loading: const Center(
              child: CircularProgressIndicator(),
            ),
            status: state.status,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    // TextDropdownWidget(
                    //   controller: cubit.textEditingController,
                    //   catalog: state.filterCatalog,
                    // ),
                    // Container(
                    //   padding: const EdgeInsets.all(6),
                    //   height: 55,
                    //   width: baseWidth * 0.9,
                    //   decoration: BoxDecoration(
                    //       color: Colors.grey.withOpacity(0.5),
                    //       borderRadius: BorderRadius.circular(32)),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //     children: [
                    //       Expanded(
                    //         child: Container(
                    //           decoration: BoxDecoration(
                    //               color: Colors.white,
                    //               borderRadius: BorderRadius.circular(32)),
                    //           child: Center(
                    //               child: Text(
                    //             "Scan",
                    //             style: AppFont.largeBold(context),
                    //           )),
                    //         ),
                    //       ),
                    //       Expanded(
                    //         child: Container(
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(32)),
                    //           child: Center(
                    //               child: Text(
                    //             "Input",
                    //             style: AppFont.largeBold(context),
                    //           )),
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    // const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 10),
                      height: 250,
                      width: baseWidth,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: MobileScanner(
                          startDelay: true,
                          controller: cubit.cameraController,
                          onDetect: (capture) {
                            final List<Barcode> barcodes = capture.barcodes;
                            final Uint8List? image = capture.image;
                            // Timer.periodic(Duration(seconds: 3), (t) {
                            for (final barcode in barcodes) {
                              if (state.typeScan == TypeScan.noProduct) {
                                cubit.checkRulesScan(barcode.rawValue!);
                              }
                              log("data ditemukan ${barcode.rawValue}");
                              cubit.doScanv2(barcode.rawValue!);
                            }
                            // });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    ResultScanWidget(
                      isActive:
                          state.typeScan == TypeScan.noProduct ? true : false,
                      onPressed: () {
                        cubit.changeTypeScan(TypeScan.noProduct);
                      },
                      data: 'NO PRODUCT ${state.noProduct ?? ""}',
                    ),
                    const SizedBox(height: 12),
                    (state.rulesScan == null)
                        ? const SizedBox()
                        : (state.rulesScan?.scanSn == "NO")
                            ? const SizedBox()
                            : ResultScanWidget(
                                onPressed: () =>
                                    cubit.changeTypeScan(TypeScan.sn),
                                data: 'SN ${state.noSn ?? ""}',
                                isActive: state.typeScan == TypeScan.sn
                                    ? true
                                    : false,
                              ),
                    const SizedBox(height: 12),
                    (state.rulesScan == null)
                        ? const SizedBox()
                        : (state.rulesScan?.scanImei == "NO")
                            ? const SizedBox()
                            : ResultScanWidget(
                                isActive: state.typeScan == TypeScan.imei
                                    ? true
                                    : false,
                                onPressed: () =>
                                    cubit.changeTypeScan(TypeScan.imei),
                                data: 'IMEI ${state.imei ?? ""}',
                              ),

                    const SizedBox(height: 30),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(36)),
                        height: 50,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(36),
                          child: ElevatedButton(
                              onPressed: () => cubit.doSubmit(),
                              child: const Text("Simpan")),
                        ))
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

class ResultScanWidget extends StatelessWidget {
  final String data;
  final bool isActive;
  final dynamic Function()? onPressed;
  const ResultScanWidget({
    super.key,
    required this.data,
    this.onPressed,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      borderRadius: BorderRadius.circular(32),
      onPressed: onPressed,
      child: Container(
        height: 55,
        width: baseWidth,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(32)),
        child: Container(
          decoration: BoxDecoration(
              color: isActive ? AppColor.appColor.success : Colors.white,
              borderRadius: BorderRadius.circular(32)),
          child: Center(
            child: Text(
              data,
              style: AppFont.largeBold(context)!
                  .copyWith(color: isActive ? Colors.white : Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}

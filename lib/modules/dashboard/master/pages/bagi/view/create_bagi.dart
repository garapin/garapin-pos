import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/data/api/services.dart';

import 'package:pos/modules/dashboard/master/pages/bagi/cubit/bagi_cubit.dart';
import 'package:pos/modules/dashboard/master/pages/bagi/cubit/create_bagi_cubit.dart';
import 'package:pos/widgets/widgets.dart';

import '../../../../../../data/models/base/split_payment_template.dart';
import '../../../../../../engine/base/app.dart';
import '../../../../../../themes/themes.dart';

class CreateBagiPage extends StatelessWidget {
  const CreateBagiPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubitCreateBagi = context.read<CreateBagiCubit>();
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FD),
      body: BlocBuilder<CreateBagiCubit, CreateBagiState>(
        builder: (context, state) {
          return ContainerStateHandler(
            refresherOptions: cubitCreateBagi.defaultRefresh,
            status: state.status,
            loading: Center(
              child: CircularProgressIndicator(),
            ),
            child: SingleChildScrollView(
                child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 40),
                    width: baseWidth,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      context.pop();
                                    },
                                    icon: const Icon(Icons.arrow_back)),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.paymentTemplate?.name ?? '',
                                      style: AppFont.largeBold(context),
                                    ),
                                    Text(
                                      state.paymentTemplate?.statusTemplate!
                                              .toLowerCase() ??
                                          '',
                                      style: AppFont.medium(context)!.copyWith(
                                          color: state.paymentTemplate
                                                      ?.statusTemplate ==
                                                  "ACTIVE"
                                              ? AppColor.appColor.success
                                              : AppColor.appColor.warning),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              height: 40,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  cubitCreateBagi.addTarget();
                                },
                                child: const Text(
                                  'Add Target',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      const SizedBox(height: 16),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                alignment: Alignment.center,
                                width: baseWidth / 7,
                                child: Text('Type',
                                    style: AppFont.largeBold(context))),
                            Container(
                                alignment: Alignment.center,
                                width: baseWidth / 7,
                                child: Text('Target',
                                    style: AppFont.largeBold(context))),
                            Container(
                                alignment: Alignment.center,
                                width: baseWidth / 7,
                                child: Text('Bagi-Bagi pendapatan',
                                    style: AppFont.largeBold(context))),
                            Container(
                                alignment: Alignment.center,
                                width: baseWidth / 7,
                                child: Text('Bagi-bagi Biaya',
                                    style: AppFont.largeBold(context))),
                            Container(
                                alignment: Alignment.center,
                                width: baseWidth / 7,
                                child: Text('Action',
                                    style: AppFont.largeBold(context))),
                          ]),
                      SizedBox(height: 12),
                      Divider(thickness: 2),
                      SizedBox(
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: state.paymentTemplate?.routes?.length ?? 0,
                          itemBuilder: (context, index) {
                            var item = state.paymentTemplate?.routes?[index];
                            return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      alignment: Alignment.center,
                                      width: baseWidth / 7,
                                      child: Text(item?.type ?? "",
                                          style: AppFont.medium(context))),
                                  Container(
                                    alignment: Alignment.center,
                                    width: baseWidth / 7,
                                    child: Text(item?.target ?? "",
                                        style: AppFont.medium(context)),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: baseWidth / 7,
                                    child: Text(
                                        item?.percentAmount != null
                                            ? "${item?.percentAmount}%"
                                            : "",
                                        style: AppFont.medium(context)),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: baseWidth / 7,
                                    child: Text(
                                        item?.feePos != null
                                            ? "${item?.feePos}%"
                                            : "",
                                        style: AppFont.medium(context)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Row(
                                      children: [
                                        Container(
                                            alignment: Alignment.center,
                                            width: 50,
                                            child: CustomButton(
                                                onPressed: () {
                                                  cubitCreateBagi
                                                      .editTarget(RoutePayments(
                                                    type: item!.type!,
                                                    feePos: int.tryParse(
                                                        item.feePos.toString()),
                                                    percentAmount: int.tryParse(
                                                        item.percentAmount
                                                            .toString()),
                                                    flatAmount: int.tryParse(
                                                        item.flatAmount
                                                            .toString()),
                                                    target: item.target,
                                                    referenceId:
                                                        item.referenceId,
                                                    destinationAccountId: item
                                                        .destinationAccountId,
                                                  ));
                                                },
                                                child: Icon(
                                                  Icons.edit,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ))),
                                        SizedBox(width: 12),
                                        (item?.type == "TRX" ||
                                                item?.type == "ADMIN")
                                            ? SizedBox(
                                                width: 50,
                                              )
                                            : Container(
                                                width: 50,
                                                child: CustomButton(
                                                    onPressed: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return SizedBox(
                                                            height: 300,
                                                            child: AlertDialog(
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              24)),
                                                              title: Text(
                                                                  "Yakin untuk menghapus ${item?.target}"),
                                                              actions: [
                                                                TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      context
                                                                          .pop();
                                                                    },
                                                                    child: Text(
                                                                        "Cancel",
                                                                        style: AppFont.largeBold(context)
                                                                            ?.copyWith(
                                                                          color:
                                                                              Colors.grey,
                                                                        ))),
                                                                TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      cubitCreateBagi.deleteTargetTemplate(
                                                                          item?.referenceId.toString() ??
                                                                              "");
                                                                      context
                                                                          .pop();
                                                                    },
                                                                    child: Text(
                                                                        "Ya",
                                                                        style: AppFont.largeBold(context)
                                                                            ?.copyWith(
                                                                          color: AppColor
                                                                              .appColor
                                                                              .primary,
                                                                        )))
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: Icon(
                                                      Icons.delete,
                                                      color: Colors.red,
                                                    ))),
                                      ],
                                    ),
                                  ),
                                ]);
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: Divider(thickness: 2),
                            );
                          },
                        ),
                      ),
                      Divider(thickness: 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 36, vertical: 4),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            width: baseWidth / 2,
                            child: Column(
                              children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "*hasil jumlah dari bagi bagi pendapatan harus 100%",
                                      style: AppFont.largeBold(context)!
                                          .copyWith(
                                              color: AppColor.appColor.warning),
                                    )),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "*Status active template bagi bagi sedang digunakan TRX, dan pastikan ketika merubah template sedang tidak ada transaksi yang terjadi",
                                      style: AppFont.largeBold(context)!
                                          .copyWith(
                                              color: AppColor.appColor.warning),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: EdgeInsets.only(right: 50, left: 50),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Column(
                            children: [
                              Text(state.paymentTemplate?.statusTemplate ==
                                      "ACTIVE"
                                  ? "Tempalte Active"
                                  : "Template Inactive"),
                              Switch.adaptive(
                                  value:
                                      state.paymentTemplate?.statusTemplate ==
                                              "ACTIVE"
                                          ? true
                                          : false,
                                  onChanged: (val) {
                                    if (state.paymentTemplate?.statusTemplate ==
                                        "ACTIVE") {
                                      cubitCreateBagi
                                          .changeStatusTemplate("INACTIVE");
                                    } else {
                                      cubitCreateBagi
                                          .changeStatusTemplate("ACTIVE");
                                    }
                                  }),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                    ]))),
          );
        },
      ),
    );
  }
}

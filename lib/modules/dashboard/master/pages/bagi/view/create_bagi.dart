import 'dart:math';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/data/api/services.dart';
import 'package:pos/data/models/base/split_payment_rule.dart';
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
                                Text(
                                  state.paymentTemplate?.name ?? '',
                                  style: AppFont.largeBold(context),
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
                                  Row(
                                    children: [
                                      Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.only(right: 30),
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
                                                  flatAmount: int.tryParse(item
                                                      .flatAmount
                                                      .toString()),
                                                  target: item.target,
                                                  referenceId: item.referenceId,
                                                  destinationAccountId:
                                                      item.destinationAccountId,
                                                ));
                                              },
                                              child: Icon(Icons.edit))),
                                      Container(
                                          padding: EdgeInsets.only(right: 100),
                                          alignment: Alignment.center,
                                          width: 65,
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
                                                  flatAmount: int.tryParse(item
                                                      .flatAmount
                                                      .toString()),
                                                  target: item.target,
                                                  referenceId: item.referenceId,
                                                  destinationAccountId:
                                                      item.destinationAccountId,
                                                ));
                                              },
                                              child: Icon(Icons.delete))),
                                    ],
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
                            child: Text(
                              "*hasil jumlah dari bagi bagi pendapatan harus 100%",
                              style: AppFont.largeBold(context)!
                                  .copyWith(color: AppColor.appColor.warning),
                            )),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Builder(builder: (context) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: SizedBox(
                                  height: 50,
                                  width: 400,
                                  child: ElevatedButton(
                                      onPressed: () async {
                                        final data =
                                            await ApiService.createSplitRule(
                                                context,
                                                idTemplate:
                                                    state.paymentTemplate?.id ??
                                                        "",
                                                name: state.paymentTemplate
                                                        ?.name ??
                                                    "",
                                                description: state
                                                        .paymentTemplate
                                                        ?.description ??
                                                    "Bagi Bagi Untuk trx ${state.paymentTemplate?.routes?.where((element) => element.type == "TRX").first.target?.toUpperCase() ?? ""}",
                                                routes: state
                                                    .paymentTemplate!.routes!);
                                        if (data.isSuccess) {
                                          ShowNotify.success(context,
                                              msg: data.message);
                                        } else {
                                          ShowNotify.error(context,
                                              msg: data.message);
                                        }
                                      },
                                      child: Text(
                                          "Gunakan Template Ke TRX ${state.paymentTemplate?.routes?.where((element) => element.type == "TRX").first.target?.toUpperCase() ?? ""}"))),
                            );
                          }),
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

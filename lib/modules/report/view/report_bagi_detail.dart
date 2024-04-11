import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/modules/report/cubit/report_detail_cubit.dart';
import 'package:pos/widgets/widgets.dart';
import '../../../../../../engine/base/app.dart';
import '../../../../../../themes/themes.dart';

class ReportBagiDretail extends StatelessWidget {
  const ReportBagiDretail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FD),
      body: BlocBuilder<ReportDetailCubit, ReportDetailState>(
        builder: (context, state) {
          return ContainerStateHandler(
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
                                      "invoice ${state.split?.split?.invoice?.split("&&")[0]}",
                                      style: AppFont.largeBold(context),
                                    ),
                                    Text(
                                      "${state.split?.split?.name}",
                                      style: AppFont.medium(context),
                                    ),
                                    Text(
                                      "${state.split?.split?.description}",
                                      style: AppFont.medium(context),
                                    ),
                                  ],
                                ),
                              ],
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
                          ]),
                      SizedBox(height: 12),
                      Divider(thickness: 2),
                      SizedBox(
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: state.split?.split?.routes?.length ?? 0,
                          itemBuilder: (context, index) {
                            var item = state.split?.split?.routes?[index];
                            var template =
                                state.split?.template?.routes?[index];
                            return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      alignment: Alignment.center,
                                      width: baseWidth / 7,
                                      child: Text(template?.type ?? "",
                                          textAlign: TextAlign.center,
                                          style: AppFont.medium(context))),
                                  Container(
                                    alignment: Alignment.center,
                                    width: baseWidth / 7,
                                    child: Text(
                                      template?.target ?? "",
                                      style: AppFont.medium(context),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: baseWidth / 7,
                                    child: Text(
                                        textAlign: TextAlign.center,
                                        item?.flatAmount
                                                .currencyFormat(symbol: "Rp") ??
                                            "",
                                        style: AppFont.medium(context)),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: baseWidth / 7,
                                    child: Text(
                                        item?.fee?.currencyFormat(
                                                symbol: "Rp.") ??
                                            "-",
                                        textAlign: TextAlign.center,
                                        style: AppFont.medium(context)),
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
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "${state.split?.split?.createdAt!.toddMMMyyyyHHmmss()}",
                            style: AppFont.largeBold(context),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                    ]))),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/modules/dashboard/master/pages/bagi/cubit/bagi_cubit.dart';
import 'package:pos/modules/dashboard/master/pages/bagi/cubit/create_bagi_cubit.dart';
import 'package:pos/modules/dashboard/master/pages/bagi/view/create_bagi.dart';
import 'package:pos/routes/routes.dart';
import 'package:pos/widgets/widgets.dart';

import '../../../../../../engine/base/app.dart';
import '../../../../../../themes/themes.dart';

class BagiPage extends StatelessWidget {
  const BagiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BagiCubit>();
    return BlocBuilder<BagiCubit, BagiState>(
      builder: (conext, state) {
        return ContainerStateHandler(
            refresherOptions: cubit.defaultRefresh,
            loading: Center(
              child: CircularProgressIndicator(),
            ),
            status: state.status,
            child: ListBagi(cubit: cubit));
      },
    );
  }
}

class ListBagi extends StatelessWidget {
  const ListBagi({
    super.key,
    required this.cubit,
  });

  final BagiCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 120, vertical: 26),
            width: baseWidth,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Column(children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Bagi - Bagi",
                      style: AppFont.largeBold(context),
                    ),
                    TextButton(
                        onPressed: () {
                          cubit.createTemplate();
                        },
                        child: const Text("Create New Template"))
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(height: 16),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: cubit.state.paymentTemplate.length,
                itemBuilder: (context, index) {
                  var item = cubit.state.paymentTemplate[index];
                  return ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                    title: Text(
                      item.name ?? "",
                      style: AppFont.largeBold(context),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 4),
                        Text(
                          item.createdAt!.toddMMMyyyyHHmm(),
                          style: AppFont.small(context),
                        ),
                        Text(
                          "TRX -> ${item.routes!.where((element) => element.type == "TRX").isNotEmpty ? item.routes?.where((element) => element.type == "TRX").first.target : "TRX belum ditambahkan"}",
                          style: AppFont.small(context)?.copyWith(),
                        )
                      ],
                    ),
                    trailing: Container(
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32.0),
                        border: Border.all(color: AppColor.appColor.primary),
                      ),
                      child: TextButton(
                        onPressed: () {
                          context.pushNamed(RouteNames.createBagi,
                              extra: item.id);
                        },
                        child: const Text(
                          'DETAIL',
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Divider(
                      thickness: 2,
                    ),
                  );
                },
              )
            ])));
  }
}

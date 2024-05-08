import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/modules/dashboard/catalog/cubit/catalog_cubit.dart';
import 'package:pos/modules/dashboard/catalog/view/catalog.dart';
import 'package:pos/modules/dashboard/master/cubit/master_cubit.dart';
import 'package:pos/modules/dashboard/master/pages/bagi/cubit/bagi_cubit.dart';
import 'package:pos/modules/dashboard/master/pages/cubit/my_merchant_cubit.dart';
import 'package:pos/modules/report/master_report/cubit/master_report_cubit.dart';
import 'package:pos/themes/themes.dart';
import 'package:pos/widgets/components/custom_button.dart';
import 'package:pos/widgets/widgets.dart';

class MasterReportPage extends StatelessWidget {
  const MasterReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MasterReportCubit>();
    return Scaffold(
        backgroundColor: const Color(0xffF8F9FD),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: BlocBuilder<MasterReportCubit, MasterReportState>(
          builder: (context, state) {
            return ContainerStateHandler(
              status: state.status,
              loading: SizedBox(),
              child: state.showPage
                  ? Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                          padding:
                              const EdgeInsets.only(left: 0, top: 0, bottom: 0),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [],
                              ),
                              height: baseHeight,
                              width: 260,
                              child: cubit.showMaster())))
                  : SizedBox(),
            );
          },
        ),
        body: SizedBox(
          width: baseWidth * 0.925,
          child: BlocBuilder<MasterReportCubit, MasterReportState>(
            builder: (context, state) {
              return ContainerStateHandler(
                  loading: Center(
                    child: CircularProgressIndicator(),
                  ),
                  status: state.status,
                  child: state.widget);
            },
          ),
        ));
  }
}

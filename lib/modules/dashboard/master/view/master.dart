import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/modules/dashboard/catalog/cubit/catalog_cubit.dart';
import 'package:pos/modules/dashboard/catalog/view/catalog.dart';
import 'package:pos/modules/dashboard/master/cubit/master_cubit.dart';
import 'package:pos/themes/themes.dart';
import 'package:pos/widgets/components/custom_button.dart';
import 'package:pos/widgets/widgets.dart';

class MasterPage extends StatelessWidget {
  const MasterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MasterCubit>();
    return Scaffold(
        backgroundColor: const Color(0xffF8F9FD),
        floatingActionButton: BlocBuilder<MasterCubit, MasterState>(
          builder: (context, state) {
            return ContainerStateHandler(
              status: state.status,
              loading: SizedBox(),
              child: state.showPage
                  ? Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 60),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 212, 212, 212),
                                blurRadius: 2, // Adjust as needed
                                spreadRadius: 2, // Adjust as needed
                                offset: Offset(1, 1), // Adjust as needed
                              ),
                            ],
                          ),
                          height: baseHeight,
                          width: 200,
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 20),
                              child: cubit.showRulesWidgetMaster()),
                        ),
                      ),
                    )
                  : SizedBox(),
            );
          },
        ),
        body: SizedBox(
          width: baseWidth * 0.925,
          child: BlocBuilder<MasterCubit, MasterState>(
            builder: (context, state) {
              return ContainerStateHandler(
                  loading: Center(
                    child: CircularProgressIndicator(),
                  ),
                  status: state.status,
                  child: state.widget ?? SizedBox());
            },
          ),
        ));
  }
}

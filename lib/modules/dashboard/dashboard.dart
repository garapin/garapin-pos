import 'package:armory/engine/base/app.dart';
import 'package:armory/modules/dashboard/cubit/dashboard_cubit.dart';
import 'package:armory/widgets/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/widgets.dart';
import 'catalog/view/catalog.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DashboardCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const SizedBox(
          width: 2000,
          height: 60,
          child: LeadingAppBar(),
        ),
        actions: const [
          ActionAppBar(),
        ],
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            width: baseWidth * 0.09,
            child: Column(
              children: [
                const SizedBox(height: 8),
                CustomButton(
                  onPressed: () {
                    cubit.changePage(0);
                  },
                  child: Container(
                    width: 77,
                    height: 70,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Icon(
                      Icons.shop,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                CustomButton(
                  onPressed: () {
                    cubit.changePage(1);
                  },
                  child: Container(
                    width: 77,
                    height: 70,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Icon(
                      Icons.task,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                CustomButton(
                  onPressed: () {
                    cubit.changePage(2);
                  },
                  child: Container(
                    width: 77,
                    height: 70,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Icon(
                      Icons.person_2,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: baseWidth * 0.91,
            child: BlocBuilder<DashboardCubit, DashboardState>(
              builder: (context, state) {
                return ContainerStateHandler(
                    loading: Center(
                      child: CircularProgressIndicator(),
                    ),
                    status: state.status,
                    child: state.widget);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LeadingAppBar extends StatelessWidget {
  const LeadingAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Pipit Bakery"),
        Text("Hidup nangis mulu pipit"),
      ],
    );
  }
}

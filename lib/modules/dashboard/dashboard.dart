import 'package:armory/engine/base/app.dart';
import 'package:armory/modules/dashboard/cubit/dashboard_cubit.dart';
import 'package:armory/widgets/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/widgets.dart';

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
            height: 947,
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
          BlocBuilder<DashboardCubit, DashboardState>(
            builder: (context, state) {
              return ContainerStateHandler(
                  loading: Center(
                    child: CircularProgressIndicator(),
                  ),
                  status: state.status,
                  child: state.widget);
            },
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      height: 78,
      width: baseWidth * 0.91,
      child: Row(
        children: [
          const SizedBox(width: 12),
          Container(
            width: 487,
            height: 50,
            child: TextFormField(
              onChanged: (value) {},
              decoration: InputDecoration(
                  suffixIcon: const Icon(
                    Icons.close,
                    size: 16,
                  ),
                  hintText: "Cari Barang kode product | Nama",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
            ),
          ),
          const SizedBox(width: 24),
          Container(
            height: 78,
            width: 1,
            color: Colors.grey,
          ),
          const SizedBox(width: 24),
          const FilterButton(title: "All", isActive: true),
          const SizedBox(width: 8),
          const FilterButton(title: "Mie", isActive: true),
          const SizedBox(width: 8),
          const FilterButton(title: "Seafood", isActive: true),
          const SizedBox(width: 8),
          const FilterButton(title: "Kentang", isActive: true),
          const SizedBox(width: 8),
          const FilterButton(title: "Pasta", isActive: true),
          const SizedBox(width: 8),
          const FilterButton(title: "Rice Bowl", isActive: true),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}

class ActionAppBar extends StatelessWidget {
  const ActionAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 400,
        height: 44,
        child: Row(
          children: [
            const Row(
              children: [
                Icon(Icons.history),
                SizedBox(
                  width: 8,
                ),
                Text("History")
              ],
            ),
            const SizedBox(width: 20),
            Text(DateTime.now().toString()),
            const SizedBox(width: 20),
            Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.black),
            )
          ],
        ),
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

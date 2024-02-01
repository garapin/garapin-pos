import 'package:abditrack_inventory/engine/base/app.dart';
import 'package:abditrack_inventory/modules/customer/list_customer/cubit/list_customer_cubit.dart';
import 'package:abditrack_inventory/routes/routes.dart';
import 'package:abditrack_inventory/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ListCustomerPage extends StatelessWidget {
  const ListCustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ListCustomerCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Mitra"),
      ),
      body: BlocBuilder<ListCustomerCubit, ListCustomerState>(
        builder: (context, state) {
          return ContainerStateHandler(
            refresherOptions: cubit.defaultRefresh,
            status: state.status,
            loading: const Center(
              child: CircularProgressIndicator(),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: SizedBox(
                        height: 50,
                        width: baseWidth,
                        child: ElevatedButton(
                            onPressed: () {
                              context
                                  .pushNamed(RouteNames.addCustomer)
                                  .then((value) => cubit.refreshData());
                            },
                            child: const Text("Tambah Customer/Mitra"))),
                  ),
                  const SizedBox(height: 12),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.allMitra.length,
                    itemBuilder: (context, index) {
                      var mitra = state.allMitra[index];
                      return ListTile(
                        leading: const Icon(Icons.person_2),
                        title: Text(mitra.name ?? ""),
                        subtitle: Text(mitra.fullName ?? ""),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

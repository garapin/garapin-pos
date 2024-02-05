import 'package:armory/modules/dashboard/catalog/cubit/catalog_cubit.dart';
import 'package:armory/widgets/components/container_state_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../engine/base/app.dart';
import '../../../../widgets/widgets.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CatalogCubit>();
    return BlocBuilder<CatalogCubit, CatalogState>(
      builder: (context, state) {
        return ContainerStateHandler(
          refresherOptions: cubit.defaultRefresh,
          status: state.status,
          loading: const Center(
            child: CircularProgressIndicator(),
          ),
          child: Column(
            children: [
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
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
              ),
              Text(state.store?.storeName ?? "")
            ],
          ),
        );
      },
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
      child: SizedBox(
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

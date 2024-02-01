import 'package:abditrack_inventory/modules/customer/add_customer/cubit/add_customer_cubit.dart';
import 'package:abditrack_inventory/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../engine/base/app.dart';
import '../../../create_product/view/create_product.dart';

class AddCustomerPage extends StatelessWidget {
  const AddCustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddCustomerCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Customer"),
      ),
      body: BlocBuilder<AddCustomerCubit, AddCustomerState>(
        builder: (context, state) {
          return ContainerStateHandler(
            status: state.status,
            loading: const Center(child: CircularProgressIndicator()),
            child: FormBuilder(
              key: cubit.formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const OutlineTextField(
                      hintText: 'Masukan Inisial Customer/Mitre',
                      name: 'name',
                      label: 'Nama',
                    ),
                    const SizedBox(height: 20),
                    const OutlineTextField(
                      hintText: 'Nama lengkap customer/mitra',
                      name: 'full_name',
                      label: 'nama lengkap',
                    ),
                    const SizedBox(height: 20),
                    const OutlineTextField(
                      typeInput: TextInputType.number,
                      hintText: 'Alamat customer/mitra',
                      maxLength: 6,
                      name: 'address',
                      label: 'Alamat',
                    ),
                    const SizedBox(height: 30),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                          height: 50,
                          width: baseWidth,
                          child: ElevatedButton(
                              onPressed: () {
                                cubit.formKey.currentState!.save();
                                cubit.doSubmit();
                              },
                              child: const Text("Simpan"))),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

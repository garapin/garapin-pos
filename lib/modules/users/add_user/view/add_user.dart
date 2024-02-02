import 'package:armory/engine/engine.dart';
import 'package:armory/modules/users/add_user/cubit/add_user_cubit.dart';
import 'package:armory/themes/themes.dart';
import 'package:armory/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../create_product/view/create_product.dart';

class AddUserPage extends StatelessWidget {
  const AddUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddUserCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buat Akun"),
      ),
      body: BlocBuilder<AddUserCubit, AddUserState>(
        builder: (context, state) {
          return ContainerStateHandler(
              loading: const Center(
                child: CircularProgressIndicator(),
              ),
              status: state.status,
              child: FormBuilder(
                key: cubit.formKey,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(children: [
                    const OutlineTextField(
                      hintText: 'Masukan Nama',
                      name: 'username',
                      label: 'Nama',
                    ),
                    const SizedBox(height: 12),
                    const OutlineTextField(
                      typeInput: TextInputType.emailAddress,
                      hintText: 'Masukan Email',
                      name: 'email',
                      label: 'Email',
                    ),
                    const SizedBox(height: 12),
                    const OutlineTextField(
                      obsecureText: true,
                      hintText: 'Masukan Password',
                      name: 'password',
                      label: 'Password',
                    ),
                    const SizedBox(height: 12),
                    const OutlineTextField(
                      readOnly: true,
                      initialValue: "TEKNISI",
                      hintText: 'Role',
                      name: 'role',
                      label: 'Role',
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                        height: 50,
                        width: baseWidth,
                        child: ElevatedButton(
                            onPressed: () {
                              cubit.cretaeAccount();
                            },
                            child: Text(
                              "Buat Akun",
                              style: AppFont.whiteLarge(context)!.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )))
                  ]),
                ),
              ));
        },
      ),
    );
  }
}

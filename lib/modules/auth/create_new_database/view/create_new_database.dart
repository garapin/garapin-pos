import 'package:pos/modules/auth/create_new_database/cubit/create_new_database_cubit.dart';
import 'package:pos/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../engine/engine.dart';
import '../../../../themes/themes.dart';
import '../../../../widgets/components/background_image.dart';

class CreateNewDatabasePage extends StatelessWidget {
  const CreateNewDatabasePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateNewDatabaseCubit>();
    return BlocBuilder<CreateNewDatabaseCubit, CreateNewDatabaseState>(
      builder: (context, state) {
        return ContainerStateHandler(
          loading: const Center(
            child: CircularProgressIndicator(),
          ),
          status: state.status,
          child: BackgorundImageWidget(
            child: SingleChildScrollView(
              child: Container(
                width: 543,
                height: 400,
                padding:
                    const EdgeInsets.symmetric(horizontal: 90, vertical: 32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 201, 201, 201),
                      offset: Offset(0, 0),
                      blurRadius: 2,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create New Database",
                      style: AppFont.largeBold(context)!.copyWith(fontSize: 28),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "Silahkan masukan nama database baru anda",
                      style: AppFont.medium(context)!.copyWith(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Nama Database",
                      style: AppFont.large(context)!.copyWith(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: 443,
                      height: 70,
                      child: TextFormField(
                        maxLength: 30,
                        controller: cubit.databaseNameControler,
                        decoration: InputDecoration(
                          hintText: 'Masukan Nama Database',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(58),
                            borderSide: const BorderSide(
                              color: Colors.blue, // Warna border
                              width: 1, // Lebar border
                            ),
                          ),
                        ),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                        height: 48,
                        width: baseWidth,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(58),
                            child: ElevatedButton(
                                onPressed: () {
                                  if (cubit.databaseNameControler.text == "") {
                                    ShowNotify.error(context,
                                        msg: "Nama database harus diisi");
                                  } else {
                                    cubit.doCretaeNewDatabase();
                                  }
                                },
                                child: const Text("Create")))),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

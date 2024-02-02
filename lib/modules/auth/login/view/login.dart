import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../../../engine/base/app.dart';
import '../../../../engine/helpers/form_validation.dart';
import '../../../../resources/resources.dart';
import '../../../../themes/themes.dart';
import '../../../../widgets/widgets.dart';
import '../cubit/login_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = baseWidth;
    final cubit = context.read<LoginCubit>();
    return Scaffold(
        body: BlocBuilder<LoginCubit, LoginState>(builder: (ctx, state) {
      return ContainerStateHandler(
          status: state.status,
          loading: const Center(child: CircularProgressIndicator()),
          child: FormBuilder(
              key: cubit.formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 123),
                        Text(
                          "Armory",
                          style: AppFont.largeBold(context)!
                              .copyWith(fontSize: 32),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Gunakan akun yang terdaftar untuk menggunakan aplikasi",
                          style:
                              AppFont.medium(context)!.copyWith(fontSize: 14),
                        ),
                        const SizedBox(height: 50),
                        Text('Email',
                            style: AppFont.medium(context)!
                                .copyWith(fontSize: 14)),
                        SizedBox(height: width * 0.02),
                        FormBuilderTextField(
                          onChanged: (value) {
                            cubit.formKey.currentState!.validate();
                          },
                          onTap: () {},
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                          ),
                          name: 'email',
                        ),
                        const SizedBox(height: 20),
                        Text('Password',
                            style: AppFont.medium(context)!
                                .copyWith(fontSize: 14)),
                        SizedBox(height: width * 0.02),
                        FormBuilderTextField(
                          obscureText: true,
                          onChanged: (value) {
                            cubit.formKey.currentState!.validate();
                          },
                          onTap: () {},
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                          ),
                          name: 'password',
                          validator: (v) {
                            // if (FormValidation.isPasswordValid(v ?? "")) {
                            //   return null;
                            // } else {
                            //   return "Password must be 8 characters | contain uppercase&lowercase\n"
                            //       "one digit (number), special character (!@)";
                            // }
                          },
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: baseWidth,
                          height: 42,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6))),
                              onPressed: () {
                                cubit.formKey.currentState!.save();
                                cubit.doLogin();
                              },
                              child: Text("Login",
                                  style: AppFont.whiteSmall(context)!.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold))),
                        ),
                        const SizedBox(height: 12),
                        const Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: 60,
                            child: Divider(
                              thickness: 2,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Align(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () {
                              cubit.signInWithGoogle();
                            },
                            child: Container(
                                width: 200,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 8),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(24)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Resources.images.google
                                        .image(height: 26, width: 26),
                                    Text("Sign In With Google",
                                        style: AppFont.whiteSmall(context)!
                                            .copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold))
                                  ],
                                )),
                          ),
                        ),
                      ]),
                ),
              )));
    }));
  }
}

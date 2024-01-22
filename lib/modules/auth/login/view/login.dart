import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../../../engine/base/app.dart';
import '../../../../engine/helpers/form_validation.dart';
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
              child: ListView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  children: [
                    const SizedBox(height: 123),
                    Text(
                      "Login App",
                      style: AppFont.largeBold(context)!.copyWith(fontSize: 20),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Please use the account you have to login at this app",
                      style: AppFont.medium(context)!.copyWith(fontSize: 14),
                    ),
                    const SizedBox(height: 50),
                    Text('Email',
                        style: AppFont.medium(context)!.copyWith(fontSize: 14)),
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
                      // validator: (v) {
                      //   if (FormValidation.isEmailValid(v ?? "")) {
                      //     return null;
                      //   } else {
                      //     return 'Email invalid';
                      //   }
                      // },
                    ),
                    const SizedBox(height: 20),
                    Text('Password',
                        style: AppFont.medium(context)!.copyWith(fontSize: 14)),
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
                    SizedBox(height: 30),
                    SizedBox(
                      height: 42,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6))),
                          onPressed: () {
                            if (cubit.formKey.currentState!.saveAndValidate()) {
                              cubit.doLogin();
                            } else {
                              ShowNotify.error(context,
                                  msg: "Email/password invalid");
                            }
                          },
                          child: Text("Login",
                              style: AppFont.whiteSmall(context)!
                                  .copyWith(fontSize: 14))),
                    ),
                    SizedBox(height: 20),
                  ])));
    }));
  }
}

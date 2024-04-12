import 'package:pos/data/api/services.dart';
import 'package:pos/modules/auth/login/cubit/login_cubit.dart';
import 'package:pos/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../resources/resources.dart';
import '../../../../themes/themes.dart';
import '../../../../widgets/components/background_image.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return BackgorundImageWidget(
            child: ContainerStateHandler(
          status: state.status,
          loading: const Center(
            child: CircularProgressIndicator(),
          ),
          child: Container(
            height: 257,
            width: 619,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login",
                  style: AppFont.largeBold(context)!.copyWith(fontSize: 28),
                ),
                const SizedBox(height: 32),
                Text(
                  "Silahkan login menggunakan akun google",
                  style: AppFont.medium(context)!.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 32),
                CustomButton(
                  onPressed: () async {
                    //buat test
                    final data = await ApiService.getConfigVersion(context);
                    cubit.signInWithGoogle(
                        isTest: data.data?.testLogin == "Y" ? true : false);
                  },
                  child: Container(
                    height: 48,
                    width: 443,
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
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Resources.images.google.image(height: 24),
                          const SizedBox(width: 12),
                          Text(
                            "Login With Google",
                            style:
                                AppFont.medium(context)!.copyWith(fontSize: 16),
                          )
                        ]),
                  ),
                )
              ],
            ),
          ),
        ));
      },
    );
  }
}

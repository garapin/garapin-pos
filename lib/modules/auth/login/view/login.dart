import 'package:armory/modules/auth/login/cubit/login_cubit.dart';
import 'package:armory/routes/routes.dart';
import 'package:armory/widgets/components/custom_button.dart';
import 'package:armory/widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
          loading: Center(
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
                SizedBox(height: 32),
                Text(
                  "Silahkan login menggunakan akun google",
                  style: AppFont.medium(context)!.copyWith(fontSize: 16),
                ),
                SizedBox(height: 32),
                CustomButton(
                  onPressed: () {
                    // cubit.signInWithGoogle();
                    context.pushNamed(RouteNames.selectDatababase);
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
                          SizedBox(width: 12),
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

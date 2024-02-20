import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../engine/base/app.dart';
import '../../../resources/resources.dart';
import '../../../themes/themes.dart';
import '../cubit/splash_cubit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = baseWidth;

    return Scaffold(
      body: BlocBuilder<SplashCubit, String>(
        builder: (ctx, state) {
          return Stack(
            children: [
              SizedBox(
                width: width,
                height: baseHeight,
                child: Resources.images.gems.image(),
              ),
              Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(width * 0.2),
                        // child: Image.asset(state),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(width * 0.07),
                    child: Text(
                      '',
                      style: AppFont.largeBold(context),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

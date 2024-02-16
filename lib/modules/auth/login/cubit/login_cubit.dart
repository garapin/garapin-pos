import 'package:pos/engine/engine.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:pos/data/api/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../routes/routes.dart';
part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit(BuildContext context) : super(context, LoginState());

  @override
  Future<void> initData() async {
    loadingState();
    emit(state.copyWith(status: DataStateStatus.success));
    finishRefresh(state.status);
  }

  @override
  void loadingState() => emit(state.copyWith(status: DataStateStatus.initial));

  @override
  Future<void> refreshData() => initData();

  Future<dynamic> signInWithGoogle() async {
    showLoading();
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        dismissLoading();
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final data = await ApiService.signinWithGoogle(
        context,
        email: googleUser.email,
      );

      if (data.isSuccess) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);

        // final GoogleSignInAccount? s = await GoogleSignIn().signOut();

        Sessions.setUsers(jsonEncode(data.data!))
            .then((value) => context.pushNamed(RouteNames.selectDatababase));
      } else {
        showError("Email tidak terdaftar");
        // final GoogleSignInAccount? s = await GoogleSignIn().signOut();
      }
    } catch (e) {
      // Handle exceptions
      print('Exception->$e');
      // showError("Gagal sign-in");
      // final GoogleSignInAccount? s = await GoogleSignIn().signOut();
    }
    dismissLoading();
  }
}

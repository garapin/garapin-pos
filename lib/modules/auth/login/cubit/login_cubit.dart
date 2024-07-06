import 'dart:developer';

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
  LoginCubit(BuildContext context) : super(context, const LoginState());

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
// test login
  Future<dynamic> signInWithGoogle({bool isTest = false}) async {
    showLoading();
    try {
      if (isTest) {
        final data = await ApiService.signinWithGoogle(
          context,
          firebaseToken: "test.app@garapin.cloud",
        );
        if (data.isSuccess) {
          Sessions.setToken(data.data!.user!.token!);
          Sessions.setUsers(jsonEncode(data.data!.user))
              .then((value) => context.pushNamed(RouteNames.selectDatababase));
        } else {
          showError("Email tidak terdaftar");
          await GoogleSignIn().signOut();
        }
      } else {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        if (googleUser == null) {
          dismissLoading();
          return;
        }

        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        String? firebaseToken = await userCredential.user?.getIdToken();

        if (firebaseToken == null) {
          showError("Email tidak terdaftar");
          dismissLoading();
          await GoogleSignIn().signOut();
          return;
        }

        final data = await ApiService.signinWithGoogle(
          context,
          firebaseToken: firebaseToken,
        );

        if (data.isSuccess) {
          Sessions.setToken(firebaseToken);
          Sessions.setUsers(jsonEncode(data.data!.user))
              .then((value) => context.pushNamed(RouteNames.selectDatababase));
        } else {
          showError("Email tidak terdaftar");
          await GoogleSignIn().signOut();
        }
      }
    } catch (e) {
      log('Exception->$e');
      showError("Error during Google Sign-In: $e");
      await GoogleSignIn().signOut();
    }
    dismissLoading();
  }
}

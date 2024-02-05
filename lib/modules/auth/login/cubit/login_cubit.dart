import 'package:armory/engine/engine.dart';
import 'package:armory/engine/helpers/options.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:armory/data/api/services.dart';
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
      // Step 1: Google Sign-In

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        // User cancelled Google Sign-In
        dismissLoading();
        return;
      }

      // Step 2: Get Google Authentication
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Step 3: Check if the email is registered in your API
      final data = await ApiService.signinWithGoogle(
        context,
        email: googleUser.email,
      );

      if (data.isSuccess) {
        // Step 4: Sign in with Firebase using Google credentials
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);

        final GoogleSignInAccount? s = await GoogleSignIn().signOut();

        // Step 5: Move to the new page after successful sign-in

        Sessions.setUsers(jsonEncode(data.data!))
            .then((value) => context.pushNamed(RouteNames.selectDatababase));
      } else {
        // Step 6: Email not registered in API
        showError("Email tidak terdaftar");
        final GoogleSignInAccount? s = await GoogleSignIn().signOut();
      }
    } catch (e) {
      // Handle exceptions
      print('Exception->$e');
      showError("Gagal sign-in");
      final GoogleSignInAccount? s = await GoogleSignIn().signOut();
    }
    dismissLoading();
  }
}

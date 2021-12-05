import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:time_tracker/services/auth.dart';

class SignInManager {
  SignInManager({@required this.auth, @required this.isLoading});
  final AuthBase auth;
  final ValueNotifier<bool> isLoading;

  Future<customUser> _signIn(Future<customUser> Function() signInMethod) async {
    try {
      isLoading.value = true;
      return await signInMethod();
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }

  Future<customUser> signInAnonymously() async => await _signIn(auth.signInAnonymously);

  Future<customUser> signInWithGoogle() async => await _signIn(auth.signInWithGoogle);

  // Future<User> signInWithFacebook() async => await _signIn(auth.signInWithFacebook);
}

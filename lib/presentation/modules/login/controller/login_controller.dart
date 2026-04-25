import 'dart:developer';

import 'package:fast_tracking_diet_app/app/auth/firebase_auth_service.dart';

import '../store/login_store.dart';

class LoginController {
  final FirebaseAuthService firebaseAuthService;
  final LoginStore loginStore;

  LoginController({
    required this.firebaseAuthService,
    required this.loginStore,
  });

  LoginStore get getLoginStoreInst => loginStore;

  Future<void> doLogin() async {
    loginStore.isDoingLogin.value = true;

    try {
      await firebaseAuthService.signInWithEmailAndPassword(
        email: loginStore.userName.text,
        password: loginStore.password.text,
      );
    } catch (exception, stacktrace) {
      log(
        'Error on doLogin method: ${exception.toString()}',
        stackTrace: stacktrace,
      );
    } finally {
      loginStore.isDoingLogin.value = false;
    }
  }

  Future<void> doRegister() async {
    loginStore.isDoingRegister.value = true;

    try {
      await firebaseAuthService.createUserWithEmailAndPassword(
        email: loginStore.userNameRegister.text,
        password: loginStore.passwordRegister.text,
      );
    } catch (exception, stacktrace) {
      log(
        'Error on doRegister method: ${exception.toString()}',
        stackTrace: stacktrace,
      );
    } finally {
      loginStore.isDoingRegister.value = false;
    }
  }
}

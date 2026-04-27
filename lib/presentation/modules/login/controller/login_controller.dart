import 'package:fast_tracking_diet_app/app/auth/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

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

    UserCredential? user = await firebaseAuthService
        .signInWithEmailAndPassword(
          email: loginStore.userName.text,
          password: loginStore.password.text,
        )
        .whenComplete(() => loginStore.isDoingLogin.value = false);

    if (user == null) {
      throw Exception('Invalid credentials');
    } else {
      Modular.to.pushReplacementNamed('/home');
    }
  }

  Future<void> doRegister() async {
    loginStore.isDoingRegister.value = true;

    UserCredential? user = await firebaseAuthService
        .createUserWithEmailAndPassword(
          email: loginStore.userNameRegister.text,
          password: loginStore.passwordRegister.text,
        )
        .whenComplete(() => loginStore.isDoingRegister.value = false);

    if (user != null) {
      Modular.to.pushReplacementNamed('/home');
    } else {
      throw Exception();
    }
  }
}

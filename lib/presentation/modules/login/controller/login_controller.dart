import 'package:fast_tracking_diet_app/app/services/auth/firebase_auth_service.dart';
import 'package:fast_tracking_diet_app/domain/entity/local_user_model.dart';
import 'package:fast_tracking_diet_app/domain/usecases/local_user/create_local_user_usecase.dart';
import 'package:fast_tracking_diet_app/domain/usecases/local_user/get_local_user_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../store/login_store.dart';

/// Controller responsible for managing login and registration workflows.
///
/// This class orchestrates authentication via [FirebaseAuthService] and
/// ensures that user profiles are correctly synchronized with the local database
/// using [CreateLocalUserUseCase] and [GetLocalUserUseCase].
class LoginController {
  /// The service used for Firebase authentication (sign in/sign up).
  final FirebaseAuthService firebaseAuthService;

  /// Usecase to create or update a local user profile.
  final CreateLocalUserUseCase createLocalUserUseCase;

  /// Usecase to retrieve local user profile information.
  final GetLocalUserUseCase getLocalUserUseCase;

  /// The store managing the UI state for the login screen.
  final LoginStore loginStore;

  /// Constructs a [LoginController] with the required dependencies.
  LoginController({
    required this.firebaseAuthService,
    required this.createLocalUserUseCase,
    required this.getLocalUserUseCase,
    required this.loginStore,
  });

  /// Returns the current instance of [LoginStore].
  LoginStore get getLoginStoreInst => loginStore;

  /// Performs the login operation.
  ///
  /// Signs in the user using the email and password provided in the [loginStore].
  /// After a successful sign-in, it checks if a local user profile exists for the
  /// given email. If not, it creates a default local user profile.
  /// Finally, it navigates to the home screen.
  ///
  /// Throws an [Exception] if the login fails or credentials are invalid.
  Future<void> doLogin() async {
    loginStore.isDoingLogin.value = true;

    UserCredential? user = await firebaseAuthService.signInWithEmailAndPassword(
      email: loginStore.userName.text,
      password: loginStore.password.text,
    );

    final result = await getLocalUserUseCase.call(username: loginStore.userName.text);

    if (result?.isEmpty == true) {
      await createLocalUserUseCase.call(localUser: LocalUserModel(
        userName: loginStore.userName.text,
        kcalTarget: int.parse('0'),
      ));
    }

    loginStore.isDoingLogin.value = false;

    if (user == null) {
      throw Exception('Invalid credentials');
    } else {
      Modular.to.pushReplacementNamed('/home');
    }
  }

  /// Performs the registration operation.
  ///
  /// Creates a new user account using the email and password provided in the
  /// [loginStore]'s registration fields. Upon successful account creation,
  /// it initializes a local user profile with the specified kcal target and
  /// navigates to the home screen.
  ///
  /// Throws an [Exception] if registration fails.
  Future<void> doRegister() async {
    loginStore.isDoingRegister.value = true;

    UserCredential? user = await firebaseAuthService
        .createUserWithEmailAndPassword(
          email: loginStore.userNameRegister.text,
          password: loginStore.passwordRegister.text,
        )
        .whenComplete(() => loginStore.isDoingRegister.value = false);

    await createLocalUserUseCase.call(
      localUser: LocalUserModel(
        userName: loginStore.userNameRegister.text,
        kcalTarget: int.parse(loginStore.kcalTarget.text),
      ),
    );

    if (user != null) {
      Modular.to.pushReplacementNamed('/home');
    } else {
      throw Exception();
    }
  }
}

import 'package:fast_tracking_diet_app/app/services/auth/firebase_auth_service.dart';
import 'package:fast_tracking_diet_app/domain/entity/local_user_model.dart';
import 'package:fast_tracking_diet_app/domain/usecases/local_user/create_local_user_usecase.dart';
import 'package:fast_tracking_diet_app/domain/usecases/local_user/get_local_user_usecase.dart';
import 'package:fast_tracking_diet_app/presentation/modules/login/controller/login_controller.dart';
import 'package:fast_tracking_diet_app/presentation/modules/login/store/login_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Run `flutter pub run build_runner build` to generate the mocks.
import '../../splash/controller/splash_controller_test.mocks.dart';
import 'login_controller_tests.mocks.dart' hide MockFirebaseAuthService, MockIModularNavigator;

@GenerateMocks([
  FirebaseAuthService,
  CreateLocalUserUseCase,
  GetLocalUserUseCase,
  IModularNavigator,
  UserCredential,
  User,
])
void main() {
  late LoginController loginController;
  late LoginStore loginStore;
  late MockFirebaseAuthService mockFirebaseAuthService;
  late MockCreateLocalUserUseCase mockCreateLocalUserUseCase;
  late MockGetLocalUserUseCase mockGetLocalUserUseCase;
  late MockIModularNavigator mockNavigator;

  setUp(() {
    mockFirebaseAuthService = MockFirebaseAuthService();
    mockCreateLocalUserUseCase = MockCreateLocalUserUseCase();
    mockGetLocalUserUseCase = MockGetLocalUserUseCase();
    mockNavigator = MockIModularNavigator();
    loginStore = LoginStore();

    // Mocking Modular.to navigation
    Modular.navigatorDelegate = mockNavigator;

    loginController = LoginController(
      firebaseAuthService: mockFirebaseAuthService,
      createLocalUserUseCase: mockCreateLocalUserUseCase,
      getLocalUserUseCase: mockGetLocalUserUseCase,
      loginStore: loginStore,
    );
  });

  group('LoginController Unit Tests', () {
    group('doLogin', () {
      test('should navigate to /home when login is successful and local user exists', () async {
        // Arrange
        loginStore.userName.text = 'test@example.com';
        loginStore.password.text = 'password123';
        final mockUserCredential = MockUserCredential();

        when(mockFirebaseAuthService.signInWithEmailAndPassword(
          email: anyNamed('email'),
          password: anyNamed('password'),
        )).thenAnswer((_) async => mockUserCredential);

        when(mockGetLocalUserUseCase.call(username: 'test@example.com'))
            .thenAnswer((_) async => [LocalUserModel(userName: 'test', kcalTarget: 2000)]);

        // Act
        await loginController.doLogin();

        // Assert
        expect(loginStore.isDoingLogin.value, false);
        verify(mockNavigator.pushReplacementNamed('/home')).called(1);
        verifyNever(mockCreateLocalUserUseCase.call(localUser: anyNamed('localUser')));
      });

      test('should create local user and navigate to /home when login is successful and local user does not exist', () async {
        // Arrange
        loginStore.userName.text = 'test@example.com';
        loginStore.password.text = 'password123';
        final mockUserCredential = MockUserCredential();

        when(mockFirebaseAuthService.signInWithEmailAndPassword(
          email: anyNamed('email'),
          password: anyNamed('password'),
        )).thenAnswer((_) async => mockUserCredential);

        when(mockGetLocalUserUseCase.call(username: 'test@example.com'))
            .thenAnswer((_) async => []);

        // Act
        await loginController.doLogin();

        // Assert
        expect(loginStore.isDoingLogin.value, false);
        verify(mockCreateLocalUserUseCase.call(localUser: anyNamed('localUser'))).called(1);
        verify(mockNavigator.pushReplacementNamed('/home')).called(1);
      });

      test('should throw Exception when login fails (user is null)', () async {
        // Arrange
        loginStore.userName.text = 'test@example.com';
        loginStore.password.text = 'password123';

        when(mockFirebaseAuthService.signInWithEmailAndPassword(
          email: anyNamed('email'),
          password: anyNamed('password'),
        )).thenAnswer((_) async => null);

        when(mockGetLocalUserUseCase.call(username: 'test@example.com'))
            .thenAnswer((_) async => []);

        // Act & Assert
        expect(() => loginController.doLogin(), throwsA(isA<Exception>()));
        expect(loginStore.isDoingLogin.value, false);
        verifyNever(mockNavigator.pushReplacementNamed(any));
      });
    });

    group('doRegister', () {
      test('should create local user and navigate to /home when registration is successful', () async {
        // Arrange
        loginStore.userNameRegister.text = 'newuser@example.com';
        loginStore.passwordRegister.text = 'password123';
        loginStore.kcalTarget.text = '2500';
        final mockUserCredential = MockUserCredential();

        when(mockFirebaseAuthService.createUserWithEmailAndPassword(
          email: anyNamed('email'),
          password: anyNamed('password'),
        )).thenAnswer((_) async => mockUserCredential);

        // Act
        await loginController.doRegister();

        // Assert
        expect(loginStore.isDoingRegister.value, false);
        verify(mockCreateLocalUserUseCase.call(localUser: anyNamed('localUser'))).called(1);
        verify(mockNavigator.pushReplacementNamed('/home')).called(1);
      });

      test('should throw Exception when registration fails', () async {
        // Arrange
        loginStore.userNameRegister.text = 'newuser@example.com';
        loginStore.passwordRegister.text = 'password123';
        loginStore.kcalTarget.text = '2500';

        when(mockFirebaseAuthService.createUserWithEmailAndPassword(
          email: anyNamed('email'),
          password: anyNamed('password'),
        )).thenAnswer((_) async => null);

        // Act & Assert
        expect(() => loginController.doRegister(), throwsA(isA<Exception>()));
        expect(loginStore.isDoingRegister.value, false);
        verifyNever(mockNavigator.pushReplacementNamed(any));
      });
    });
  });
}
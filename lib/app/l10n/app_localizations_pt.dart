// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get loginTitle => 'Fazer login';

  @override
  String get loginSubTitle =>
      'Realize login para aproveitar todas as funções do Fast Tracking!';

  @override
  String get loginEmailFieldHintText => 'Digite seu email aqui.';

  @override
  String get loginPasswordFieldHintText => 'Digite sua senha aqui.';

  @override
  String get loginInvalidEmailText => 'Por favor digite um email valido';

  @override
  String get loginInvalidPasswordText => 'Por favor digite uma senha valida';

  @override
  String get loginRegisterTitle => 'Não possui conta? Registre aqui!';

  @override
  String get registerTitle => 'Comece sua jornada de saúde hoje';

  @override
  String get registerSubtitle =>
      'Cadastre-se para alcançar seus objetivos de saúde com o suporte que você precisa.';

  @override
  String get registerButtonTitle => 'Registrar';

  @override
  String get registerButtonGeneratePasswordTitle => 'Gerar senha';

  @override
  String get registerPasswordStrengthWeak => 'Senha fraca';

  @override
  String get registerPasswordStrengthMedium => 'Senha mediana';

  @override
  String get registerPasswordStrengthStrong => 'Senha forte';
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get splashPageBackgroundPermissionDeniedTitle =>
      'É necessário ativação da permissão a execução do aplicativo em segundo plano para garantir o funcionamento completo do app.';

  @override
  String get splashPageEnableBackgroundPermissionButtonTitle =>
      'Ativar permissão';

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
  String get errorTitle => 'Ocorreu um erro!';

  @override
  String get errorSubTitle =>
      'Ocorreu um erro! Verifique sua conexão com a internet.';

  @override
  String get loginErrorSubtitle => 'Verifique seu email e senha.';

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

  @override
  String get homeBottomNavigationItemFasting => 'Jejum';

  @override
  String get homeBottomNavigationItemDiary => 'Diario';

  @override
  String get homeBottomNavigationItemProfile => 'Perfil';

  @override
  String get homeFastingLayoutNotFasting => 'Fora de jejum';

  @override
  String get homeFastingLayoutTimeSinceLastFasting =>
      'Tempo desde o último jejum';

  @override
  String get homeFastingLayoutStartFastingButton => 'Iniciar jejum';

  @override
  String get homeFastingLayoutPauseFastingButton => 'Pausar jejum';

  @override
  String get homeFastingLayoutFastingDateStart => 'Início';

  @override
  String get homeFastingLayoutFastingDateEnd => 'Fim';

  @override
  String get homeFastingLayoutTipsTitle => 'Dicas';

  @override
  String get homeFastingLayoutTipStartSlowlyTitle => 'Comece devagar';

  @override
  String get homeFastingLayoutTipStartSlowlyBody =>
      'Não tente fazer jejuns longos de imediato. Comece com janelas menores, como o protocolo 12/12 (12 horas de jejum e 12 de alimentação), e aumente gradualmente conforme seu corpo se adaptar.';

  @override
  String get homeFastingLayoutTipDrinkWaterTitle => 'Mantenha-se hidratado';

  @override
  String get homeFastingLayoutTipDrinkWaterBody =>
      'A hidratação é essencial. Beba bastante água, chá ou café sem açúcar durante o período de jejum para ajudar a controlar a fome e manter o metabolismo funcionando bem.';

  @override
  String get homeFastingLayoutFoodQualityTitle =>
      'Priorize a qualidade dos alimentos';

  @override
  String get homeFastingLayoutFoodQualityBody =>
      'Quando chegar a hora de comer, foque em alimentos nutritivos. Priorize proteínas, gorduras saudáveis, fibras e vegetais para garantir que você esteja nutrindo seu corpo e mantendo a saciedade por mais tempo.';

  @override
  String get homeFastingLayoutListenBodyTitle => 'Ouça o seu corpo';

  @override
  String get homeFastingLayoutListenBody =>
      'O jejum não deve causar sofrimento extremo. Se sentir tonturas, fraqueza excessiva ou mal-estar, interrompa o jejum. É importante saber diferenciar a fome psicológica dos sinais de que seu corpo precisa de energia.';

  @override
  String get homeFastingRoutineSelectTitle => 'Selecione o programa de jejum';

  @override
  String get homeFastingRoutineSelectCurrentPlan => 'Plano atual';

  @override
  String get homeFastingRoutineSelectQuickPlan => 'Planos rápidos';

  @override
  String get homeFastingRoutineSelectCustomPlan => 'Planos customizados';

  @override
  String get homeFastingRoutineSelectCustomPlanEmpty =>
      'Salve um plano como modelo para ver aqui.';
}

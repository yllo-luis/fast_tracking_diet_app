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
  String get errorSubTitle2 => 'Ocorreu um erro! Tente novamente mais tarde.';

  @override
  String get errorValueTitle => 'Por favor digite um valor valido.';

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
  String get registerKcalFieldHintText => 'Digite sua meta de calorias aqui.';

  @override
  String get registerPasswordStrengthWeak => 'Senha fraca';

  @override
  String get registerPasswordStrengthMedium => 'Senha mediana';

  @override
  String get registerPasswordStrengthStrong => 'Senha forte';

  @override
  String get yesTitle => 'Sim';

  @override
  String get noTitle => 'Não';

  @override
  String get cancelTitle => 'Cancelar';

  @override
  String get saveTitle => 'Salvar';

  @override
  String get homeBottomNavigationItemFasting => 'Jejum';

  @override
  String get homeBottomNavigationItemCalculator => 'Calculadora';

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
  String get homeFastingLayoutResumeFastingButton => 'Continuar jejum';

  @override
  String get homeFastingLayoutCancelFastingButton => 'Cancelar jejum';

  @override
  String get homeFastingLayoutFastingDateStart => 'Início';

  @override
  String get homeFastingLayoutFastingDateEnd => 'Fim';

  @override
  String get homeFastingLayoutTipsTitle => 'Dicas';

  @override
  String get homeFastingLayoutTimeRemainingTitle => 'Tempo restante:';

  @override
  String get homeFastingLayoutTimeElapsedTitle => 'Tempo desde o ínicio: ';

  @override
  String get homeFastingCancelFastingBody =>
      'Tem certeza que deseja cancelar o jejum intermitente?';

  @override
  String homeFastingShareButtonText(String programType) {
    return 'Veja estou utilizando o Fast Tracking App com o regime $programType veja o app na loja!';
  }

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

  @override
  String get homeFastingRoutineCustomFastingTipSchedule =>
      'Escolha o seu horário: Não tente seguir um horário fixo se não funcionar para você. Comece com 14 ou 16 horas de jejum e ajuste o horário de comer conforme o seu dia, não o contrário';

  @override
  String get homeFastingRoutineCustomFastingTipWater =>
      'Capriche na hidratação: Sempre que sentir fome fora da hora, beba um copo de água, café ou chá sem açúcar. Isso ajuda a controlar a vontade de comer sem quebrar o jejum.';

  @override
  String get homeFastingRoutineCustomFastingTipBreakfast =>
      'A primeira refeição importa: Quando for comer, evite pães, massas ou doces logo de cara. Prefira ovos, carnes, saladas ou gorduras boas (como abacate). Isso evita o sono após o almoço e mantém a energia alta.';

  @override
  String get homeFastingRoutineCustomFastingTipWork =>
      'Use o jejum para trabalhar melhor: Se você precisa focar em uma tarefa difícil, aproveite o período de jejum. Muitas pessoas se sentem mais alertas e focadas sem a digestão pesada ocupando o corpo.';

  @override
  String get homeFastingRoutineCustomFastingHintFastingTime => 'Tempo de jejum';

  @override
  String get homeFastingRoutineCustomFastingHintRestTime => 'Tempo de descanso';

  @override
  String get homeFastingRoutineCustomCreateButton => 'Criar rotina';

  @override
  String get homeFastingNotificationStartTitle => 'Jejum iniciado';

  @override
  String get homeFastingNotificationStartBody =>
      'Seu cronômetro de jejum começou. Vamos lá!';

  @override
  String get homeFastingNotificationPausedTitle => 'Jejum pausado';

  @override
  String get homeFastingNotificationPausedBody =>
      'Seu jejum foi pausado. Você pode retomá-lo a qualquer momento.';

  @override
  String get homeFastingNotificationCancelledTitle => 'Jejum cancelado';

  @override
  String get homeFastingNotificationCancelledBody =>
      'Jejum cancelado. Não desanime, você pode começar um novo ciclo quando estiver pronto.';

  @override
  String get homeFastingNotificationCompletedTitle =>
      'Jejum concluído com sucesso!';

  @override
  String get homeFastingNotificationCompletedBody =>
      'Parabéns por completar seu jejum! Você está um passo mais perto dos seus objetivos. Continue assim!';

  @override
  String get homeFastingDenyChangeOnPageTitle => 'Foco no jejum!';

  @override
  String get homeFastingDenyChangeOnPageBody =>
      'Foco no jejum! O acesso ao restante do aplicativo será desbloqueado ao terminar o seu ciclo.';

  @override
  String get homeFastingHistoryNoHistoryText1 =>
      'O primeiro passo para uma nova rotina começa com o seu primeiro jejum. O jejum intermitente não é apenas sobre o tempo que você passa sem comer, mas sobre dar ao seu corpo o espaço necessário para se recuperar, renovar as energias e ganhar mais clareza no seu dia a dia.\n\nQue tal experimentar hoje? Escolha um horário que faça sentido para o seu estilo de vida e sinta, na prática, como é simples começar.';

  @override
  String get homeFastingHistoryNoHistoryText2 =>
      'Que tal experimentar hoje? Escolha um horário que faça sentido para o seu estilo de vida e sinta, na prática, como é simples começar.';

  @override
  String get homeFastingHistoryStartFastingButton =>
      'Iniciar meu primeiro jejum';

  @override
  String get homeFastingHistoryGraphTitle => 'Histórico de jejum';

  @override
  String homeFastingHistoryDataTitle(String fastingTime) {
    return 'Tempo de jejum: $fastingTime horas';
  }

  @override
  String get homeFastingKcalRegistryMessage =>
      'O seu dia começa agora. Registre o que você consumiu e tome as rédeas da sua nutrição.';

  @override
  String get homeFastingKcalRegistryButton => 'Registrar refeições';

  @override
  String get homeFastingKcalRegistryNoRegistryMessage =>
      'Registrar é o primeiro passo para o equilíbrio. Conte para a gente o que você já consumiu hoje!';

  @override
  String get kcalTypeBreakfastLabel => 'Café da manhã';

  @override
  String get kcalTypeLunchLabel => 'Almoço';

  @override
  String get kcalTypeDinnerLabel => 'Jantar';

  @override
  String get kcalTypeOtherLabel => 'Outro';

  @override
  String get homeFastingRegistryTip01 =>
      'Não esqueça de registrar óleos de preparo, temperos e molhos. Eles somam calorias importantes.';

  @override
  String get homeFastingRegistryTip02 =>
      'Se estiver corrido, tire uma foto do prato para registrar os detalhes com calma mais tarde.';

  @override
  String get homeFastingRegistryTip03 =>
      'Não busque a perfeição absoluta; foque na consistência da sua média semanal.';

  @override
  String get homeFastingRegistryName => 'Nome da refeição';

  @override
  String get homeFastingRegistryQuantity =>
      'Quantidade em calorias da refeição';

  @override
  String get homeFastingRegistryDate => 'Data da refeição';

  @override
  String get homeFastingRegistryType => 'Tipo da refeição';

  @override
  String get homeFastingRegistryButton => 'Registrar refeição';

  @override
  String get homeProfileTitle => 'Perfil';

  @override
  String get homeProfileUsername => 'Nome de usuário';

  @override
  String get homeProfileFastingsDoneSoFar => 'Jejuns feitos até o momento';

  @override
  String get homeProfileKcalMax => 'Meta de calorias';

  @override
  String get homeProfileUpdateKcalMaxTitle => 'Atualizar Meta de Calorias';

  @override
  String get homeProfileUpdateNewKcalTitle => 'Nova meta (kcal)';

  @override
  String get homeFastingNoKcalDefinedWarning =>
      'Sua meta de calorias precisa estar configurada para acessar esta funcionalidade.';

  @override
  String get homeFastingNoKcalDefinedWarningButton => 'Configurar meta';
}

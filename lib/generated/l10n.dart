// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Health Tips`
  String get appName {
    return Intl.message(
      'Health Tips',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Piatti`
  String get dishes {
    return Intl.message(
      'Piatti',
      name: 'dishes',
      desc: '',
      args: [],
    );
  }

  /// `Consigli per la salute`
  String get healthTips {
    return Intl.message(
      'Consigli per la salute',
      name: 'healthTips',
      desc: '',
      args: [],
    );
  }

  /// `BMI`
  String get bmi {
    return Intl.message(
      'BMI',
      name: 'bmi',
      desc: '',
      args: [],
    );
  }

  /// `Impostazioni`
  String get setting {
    return Intl.message(
      'Impostazioni',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Vedi tutto`
  String get seeAll {
    return Intl.message(
      'Vedi tutto',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `Categorie`
  String get categories {
    return Intl.message(
      'Categorie',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Dieta di 7 giorni`
  String get daysDiet {
    return Intl.message(
      'Dieta di 7 giorni',
      name: 'daysDiet',
      desc: '',
      args: [],
    );
  }

  /// `Calcolatore BMI`
  String get bmiCalculator {
    return Intl.message(
      'Calcolatore BMI',
      name: 'bmiCalculator',
      desc: '',
      args: [],
    );
  }

  /// `Continua`
  String get continueText {
    return Intl.message(
      'Continua',
      name: 'continueText',
      desc: '',
      args: [],
    );
  }

  /// `Qual è il tuo peso?`
  String get whatIsYourWeight {
    return Intl.message(
      'Qual è il tuo peso?',
      name: 'whatIsYourWeight',
      desc: '',
      args: [],
    );
  }

  /// `Quanto sei alto?`
  String get howTallAreYou {
    return Intl.message(
      'Quanto sei alto?',
      name: 'howTallAreYou',
      desc: '',
      args: [],
    );
  }

  /// `Kg`
  String get kg {
    return Intl.message(
      'Kg',
      name: 'kg',
      desc: '',
      args: [],
    );
  }

  /// `libbre`
  String get lbs {
    return Intl.message(
      'libbre',
      name: 'lbs',
      desc: '',
      args: [],
    );
  }

  /// `cm`
  String get cm {
    return Intl.message(
      'cm',
      name: 'cm',
      desc: '',
      args: [],
    );
  }

  /// `piedi`
  String get ft {
    return Intl.message(
      'piedi',
      name: 'ft',
      desc: '',
      args: [],
    );
  }

  /// `pollici`
  String get inches {
    return Intl.message(
      'pollici',
      name: 'inches',
      desc: '',
      args: [],
    );
  }

  /// `Esci`
  String get logOut {
    return Intl.message(
      'Esci',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Salva`
  String get save {
    return Intl.message(
      'Salva',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Seleziona il tuo genere`
  String get pleaseSelectYourGender {
    return Intl.message(
      'Seleziona il tuo genere',
      name: 'pleaseSelectYourGender',
      desc: '',
      args: [],
    );
  }

  /// `Seleziona Genere`
  String get selectGender {
    return Intl.message(
      'Seleziona Genere',
      name: 'selectGender',
      desc: '',
      args: [],
    );
  }

  /// `Maschio`
  String get male {
    return Intl.message(
      'Maschio',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Femmina`
  String get female {
    return Intl.message(
      'Femmina',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Informativa sulla privacy`
  String get privacyPolicy {
    return Intl.message(
      'Informativa sulla privacy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Condividi`
  String get share {
    return Intl.message(
      'Condividi',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Feedback`
  String get feedback {
    return Intl.message(
      'Feedback',
      name: 'feedback',
      desc: '',
      args: [],
    );
  }

  /// `Vota`
  String get rateUs {
    return Intl.message(
      'Vota',
      name: 'rateUs',
      desc: '',
      args: [],
    );
  }

  /// `Per offrirti un'esperienza migliore, \nabbiamo bisogno di sapere il tuo peso.`
  String get toGiveYouABetterExperienceNweNeedToKnow {
    return Intl.message(
      'Per offrirti un\'esperienza migliore, \nabbiamo bisogno di sapere il tuo peso.',
      name: 'toGiveYouABetterExperienceNweNeedToKnow',
      desc: '',
      args: [],
    );
  }

  /// `Per offrirti un'esperienza migliore, \nabbiamo bisogno di sapere la tua altezza.`
  String get toGiveYouABetterExperienceNweNeedToKnowHeight {
    return Intl.message(
      'Per offrirti un\'esperienza migliore, \nabbiamo bisogno di sapere la tua altezza.',
      name: 'toGiveYouABetterExperienceNweNeedToKnowHeight',
      desc: '',
      args: [],
    );
  }

  /// `Modalità Notturna`
  String get nightMode {
    return Intl.message(
      'Modalità Notturna',
      name: 'nightMode',
      desc: '',
      args: [],
    );
  }

  /// `Modifica Profilo`
  String get editProfile {
    return Intl.message(
      'Modifica Profilo',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Notifiche`
  String get notification {
    return Intl.message(
      'Notifiche',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Informazioni Utente`
  String get userInformation {
    return Intl.message(
      'Informazioni Utente',
      name: 'userInformation',
      desc: '',
      args: [],
    );
  }

  /// `Nome`
  String get firstName {
    return Intl.message(
      'Nome',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Cognome`
  String get lastName {
    return Intl.message(
      'Cognome',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Indirizzo Email`
  String get emailAddressHint {
    return Intl.message(
      'Indirizzo Email',
      name: 'emailAddressHint',
      desc: '',
      args: [],
    );
  }

  /// `Telefono`
  String get phone {
    return Intl.message(
      'Telefono',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Genere`
  String get gender {
    return Intl.message(
      'Genere',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Promemoria`
  String get reminder {
    return Intl.message(
      'Promemoria',
      name: 'reminder',
      desc: '',
      args: [],
    );
  }

  /// `Ripeti`
  String get repeat {
    return Intl.message(
      'Ripeti',
      name: 'repeat',
      desc: '',
      args: [],
    );
  }

  /// `Seleziona Giorni`
  String get selectDays {
    return Intl.message(
      'Seleziona Giorni',
      name: 'selectDays',
      desc: '',
      args: [],
    );
  }

  /// `Felice di rincontrarti!`
  String get gladToMeetnyouAgain {
    return Intl.message(
      'Felice di rincontrarti!',
      name: 'gladToMeetnyouAgain',
      desc: '',
      args: [],
    );
  }

  /// `La Tua Email`
  String get yourEmail {
    return Intl.message(
      'La Tua Email',
      name: 'yourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Verifica`
  String get verification {
    return Intl.message(
      'Verifica',
      name: 'verification',
      desc: '',
      args: [],
    );
  }

  /// `Reinvia`
  String get resend {
    return Intl.message(
      'Reinvia',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `Avanti`
  String get next {
    return Intl.message(
      'Avanti',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Ricordami`
  String get rememberMe {
    return Intl.message(
      'Ricordami',
      name: 'rememberMe',
      desc: '',
      args: [],
    );
  }

  /// `Accedi Ora`
  String get signInNow {
    return Intl.message(
      'Accedi Ora',
      name: 'signInNow',
      desc: '',
      args: [],
    );
  }

  /// `Registrati Ora`
  String get signUpNow {
    return Intl.message(
      'Registrati Ora',
      name: 'signUpNow',
      desc: '',
      args: [],
    );
  }

  /// `O`
  String get or {
    return Intl.message(
      'O',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Il Tuo Nome`
  String get yourName {
    return Intl.message(
      'Il Tuo Nome',
      name: 'yourName',
      desc: '',
      args: [],
    );
  }

  /// `Numero di telefono`
  String get phoneNumber {
    return Intl.message(
      'Numero di telefono',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Password dimenticata?`
  String get forgotPassword {
    return Intl.message(
      'Password dimenticata?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Iscriviti e inizia l'allenamento`
  String get signUpAndnstaringWorkout {
    return Intl.message(
      'Iscriviti e inizia l\'allenamento',
      name: 'signUpAndnstaringWorkout',
      desc: '',
      args: [],
    );
  }

  /// `Hai già un account?`
  String get youHaveAnAlreadyAccount {
    return Intl.message(
      'Hai già un account?',
      name: 'youHaveAnAlreadyAccount',
      desc: '',
      args: [],
    );
  }

  /// `Accedi`
  String get signIn {
    return Intl.message(
      'Accedi',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Invia`
  String get send {
    return Intl.message(
      'Invia',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Abbiamo bisogno della tua email di registrazione per inviarti il codice di reset della password!`
  String get weNeedYourRegistrationEmailToSendYouPasswordReset {
    return Intl.message(
      'Abbiamo bisogno della tua email di registrazione per inviarti il codice di reset della password!',
      name: 'weNeedYourRegistrationEmailToSendYouPasswordReset',
      desc: '',
      args: [],
    );
  }

  /// `Preferito`
  String get favourite {
    return Intl.message(
      'Preferito',
      name: 'favourite',
      desc: '',
      args: [],
    );
  }

  /// `Iscriviti`
  String get signUp {
    return Intl.message(
      'Iscriviti',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Non hai un account?`
  String get dontHaveAnAccount {
    return Intl.message(
      'Non hai un account?',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Aggiungi Peso`
  String get addWeight {
    return Intl.message(
      'Aggiungi Peso',
      name: 'addWeight',
      desc: '',
      args: [],
    );
  }

  /// `PESO`
  String get weight {
    return Intl.message(
      'PESO',
      name: 'weight',
      desc: '',
      args: [],
    );
  }

  /// `Gestisci Calcolo Salute`
  String get manageHealthCalculation {
    return Intl.message(
      'Gestisci Calcolo Salute',
      name: 'manageHealthCalculation',
      desc: '',
      args: [],
    );
  }

  /// `Gestisci Preferenze Alimentari`
  String get manageDietPreference {
    return Intl.message(
      'Gestisci Preferenze Alimentari',
      name: 'manageDietPreference',
      desc: '',
      args: [],
    );
  }

  /// `Micronutrienti`
  String get micronutrients {
    return Intl.message(
      'Micronutrienti',
      name: 'micronutrients',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_el.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('el')];

  /// No description provided for @appTitle.
  ///
  /// In el, this message translates to:
  /// **'Protocol'**
  String get appTitle;

  /// No description provided for @tabToday.
  ///
  /// In el, this message translates to:
  /// **'Σήμερα'**
  String get tabToday;

  /// No description provided for @tabTraining.
  ///
  /// In el, this message translates to:
  /// **'Προπόνηση'**
  String get tabTraining;

  /// No description provided for @tabNutrition.
  ///
  /// In el, this message translates to:
  /// **'Διατροφή'**
  String get tabNutrition;

  /// No description provided for @tabMeasurements.
  ///
  /// In el, this message translates to:
  /// **'Μετρήσεις'**
  String get tabMeasurements;

  /// No description provided for @tabSettings.
  ///
  /// In el, this message translates to:
  /// **'Ρυθμίσεις'**
  String get tabSettings;

  /// No description provided for @notAvailableYet.
  ///
  /// In el, this message translates to:
  /// **'Δεν είναι διαθέσιμο ακόμη.'**
  String get notAvailableYet;

  /// No description provided for @todayPlaceholder.
  ///
  /// In el, this message translates to:
  /// **'Εδώ θα εμφανίζεται το πρόγραμμα της ημέρας, ώρα προς ώρα.'**
  String get todayPlaceholder;

  /// No description provided for @trainingPlaceholder.
  ///
  /// In el, this message translates to:
  /// **'Εδώ θα εμφανίζεται το εβδομαδιαίο πλάνο και η σημερινή προπόνηση.'**
  String get trainingPlaceholder;

  /// No description provided for @nutritionPlaceholder.
  ///
  /// In el, this message translates to:
  /// **'Εδώ θα καταγράφονται τα γεύματα και τα ημερήσια σύνολα.'**
  String get nutritionPlaceholder;

  /// No description provided for @measurementsPlaceholder.
  ///
  /// In el, this message translates to:
  /// **'Εδώ θα καταγράφονται το βάρος και η περίμετρος μέσης.'**
  String get measurementsPlaceholder;

  /// No description provided for @settingsPlaceholder.
  ///
  /// In el, this message translates to:
  /// **'Οι ρυθμίσεις του προγράμματος θα προστεθούν στο επόμενο βήμα.'**
  String get settingsPlaceholder;

  /// No description provided for @databaseSectionTitle.
  ///
  /// In el, this message translates to:
  /// **'Βάση δεδομένων'**
  String get databaseSectionTitle;

  /// No description provided for @databaseChecking.
  ///
  /// In el, this message translates to:
  /// **'Έλεγχος βάσης δεδομένων…'**
  String get databaseChecking;

  /// No description provided for @databaseReady.
  ///
  /// In el, this message translates to:
  /// **'Έκδοση σχήματος {version} · {count} πίνακες'**
  String databaseReady(int version, int count);

  /// No description provided for @databaseError.
  ///
  /// In el, this message translates to:
  /// **'Η βάση δεδομένων δεν άνοιξε: {error}'**
  String databaseError(String error);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['el'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'el':
      return AppLocalizationsEl();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

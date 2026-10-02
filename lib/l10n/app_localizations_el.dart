// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get appTitle => 'Protocol';

  @override
  String get tabToday => 'Σήμερα';

  @override
  String get tabTraining => 'Προπόνηση';

  @override
  String get tabNutrition => 'Διατροφή';

  @override
  String get tabMeasurements => 'Μετρήσεις';

  @override
  String get tabSettings => 'Ρυθμίσεις';

  @override
  String get notAvailableYet => 'Δεν είναι διαθέσιμο ακόμη.';

  @override
  String get todayPlaceholder =>
      'Εδώ θα εμφανίζεται το πρόγραμμα της ημέρας, ώρα προς ώρα.';

  @override
  String get trainingPlaceholder =>
      'Εδώ θα εμφανίζεται το εβδομαδιαίο πλάνο και η σημερινή προπόνηση.';

  @override
  String get nutritionPlaceholder =>
      'Εδώ θα καταγράφονται τα γεύματα και τα ημερήσια σύνολα.';

  @override
  String get measurementsPlaceholder =>
      'Εδώ θα καταγράφονται το βάρος και η περίμετρος μέσης.';

  @override
  String get settingsPlaceholder =>
      'Οι ρυθμίσεις του προγράμματος θα προστεθούν στο επόμενο βήμα.';

  @override
  String get databaseSectionTitle => 'Βάση δεδομένων';

  @override
  String get databaseChecking => 'Έλεγχος βάσης δεδομένων…';

  @override
  String databaseReady(int version, int count) {
    return 'Έκδοση σχήματος $version · $count πίνακες';
  }

  @override
  String databaseError(String error) {
    return 'Η βάση δεδομένων δεν άνοιξε: $error';
  }
}

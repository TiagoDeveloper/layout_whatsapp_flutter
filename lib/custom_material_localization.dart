import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomMaterialLocalizationsDelegate extends LocalizationsDelegate<MaterialLocalizations> {
  const CustomMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'en';

  @override
  Future<MaterialLocalizations> load(Locale locale) => SynchronousFuture<MaterialLocalizations>(const CustomLocalization());

  @override
  bool shouldReload(CustomMaterialLocalizationsDelegate old) => false;

  @override
  String toString() => 'DefaultMaterialLocalizations.delegate(en_US)';
}
class CustomLocalization extends DefaultMaterialLocalizations {
  const CustomLocalization();

  @override
  String get searchFieldLabel => "Pesquisar...";
}
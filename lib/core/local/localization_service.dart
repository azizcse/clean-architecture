import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalizationService extends Translations {
  static const String ENGLISH = 'English';
  static const String SPANISH = 'Spanish';

  // Default locale

  static final _box = GetStorage();
  static final langKey = 'local';

  static Locale getLocal() {
    String local = _loadLocalFromBox();
    if (local == null || local == ENGLISH) {
      return const Locale('en', 'US');
    } else {
      return const Locale('es', 'ES');
    }
  }

  static String _loadLocalFromBox() => _box.read(langKey) ?? ENGLISH;

  //static const locale = Locale('en', 'US');

  // FallbackLocale saves the day when the locale gets in trouble
  static const fallbackLocale = Locale('en', 'US');

  // Supported languages
  // Needs to be same order with locales
  static final langs = [
    'English',
    'Spanish',
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    const Locale('en', 'US'),
    const Locale('es', 'ES'),
    // const Locale('tr', 'TR'),
    // const Locale('ja', 'JP'),
  ];

  // Keys and their translations
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      //Tab
      'tab_search': 'Search',
      'tab_more': 'More',

      'whipserAvailableMessage':
      "Whipser is currently available in following cities.",
      'home': 'Home english',
      //Car listing
      'enterCarName': "Enter your car name",
      //More tab
      'menu_favorites': 'Favorites',
      'menu_terms_service': 'Terms of Service',
      'menu_privacy_policy': 'Privacy Policy',
      'menu_support': 'Support',
      'menu_language': 'Language',
      'menu_rate_us': 'Rate us'
    },
    'es_ES': {
      'tab_search': 'Búsqueda',
      'tab_more': 'Más',

      'whipserAvailableMessage':
      "Whipser está actualmente disponible en las siguientes ciudades.",
      'home': 'Home turkey',
      'enter_your_name': 'Enter your name',
      //More tab
      'menu_favorites': 'Favoritos',
      'menu_terms_service': 'Términos de Servicio',
      'menu_privacy_policy': 'Política de Privacidad',
      'menu_support': 'Apoyo',
      'menu_language': 'Idioma',
      'menu_rate_us': 'Nos califica',
    },
  };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    _box.write(langKey, lang);
    Get.updateLocale(locale);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale!;
  }
}
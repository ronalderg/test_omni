import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_omni/core/traslations/en.dart';
import 'package:test_omni/core/traslations/es.dart';

///Service for traslate text
class LocalizationService extends Translations {
  ///Locale for get all text
  static const locale = Locale('es');
  ///App Languages
  static final languages = [
    'Spanish'
  ];
  ///Locales
  static final locales = [
    const Locale('es'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': en,
    'es_ES': es
  };

}

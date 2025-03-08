import 'package:flutter/material.dart';
import 'package:country_flags/country_flags.dart';

class Language {
  final int id;
  final Widget flag;
  final String name;
  final String languageCode;

  Language(this.id, this.flag, this.name, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language(1, CountryFlag.fromCountryCode('US',height: 20,width: 30,borderRadius: 5,), "English", "en"),
      Language(2, CountryFlag.fromCountryCode('SA',height: 20,width: 30,borderRadius: 5,), "اَلْعَرَبِيَّةُ", "ar"),
    ];
  }
}
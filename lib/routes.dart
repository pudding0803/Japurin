import 'package:flutter/material.dart';
import 'pages/home/home.dart';
import 'pages/furigana/furigana.dart';
import 'pages/josuushi/josuushi.dart';
import 'pages/jitadoushi/jitadoushi.dart';

class Routes {
  static const String home = '/';
  static const String furigana = '/furigana';
  static const String josuushi = '/josuushi';
  static const String jitadoushi = '/jitadoushi';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => HomePage(),
    furigana: (context) => FuriganaPage(),
    josuushi: (context) => JosuushiPage(),
    jitadoushi: (context) => JitadoushiPage(),
  };
}
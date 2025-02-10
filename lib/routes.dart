import 'package:flutter/material.dart';
import 'package:japurin/pages/doushi_no_katsuyou/doushi_no_katsuyou.dart';
import 'pages/home/home.dart';
import 'pages/furigana/furigana.dart';
import 'pages/suushi/suushi.dart';
import 'pages/jitadoushi/jitadoushi.dart';

class Routes {
  static const String home = '/';
  static const String furigana = '/furigana';
  static const String suushi = '/suushi';
  static const String doushiNoKatsuyou = '/doushi_no_katsuyou';
  static const String jitadoushi = '/jitadoushi';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => HomePage(),
    furigana: (context) => FuriganaPage(),
    suushi: (context) => SuushiPage(),
    doushiNoKatsuyou: (context) => DoushiNoKatsuyouPage(),
    jitadoushi: (context) => JitadoushiPage(),
  };
}
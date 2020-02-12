import 'package:flutter/material.dart';
//importando las rutas 
import 'package:widgets/pages/alert_page.dart';
import 'package:widgets/pages/animated_page.dart';
import 'package:widgets/pages/avatar_page.dart';
import 'package:widgets/pages/card_page.dart';
import 'package:widgets/pages/home_page.dart';
import 'package:widgets/pages/input_page.dart';
import 'package:widgets/pages/listview_page.dart';
import 'package:widgets/pages/slider_page.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  final rutas = <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'inputs': (BuildContext context) => InputPage(),
    'slider': (BuildContext context) => SliderPage(),
    'list': (BuildContext context) => ListaPage(),
    'animmatedContainer': (BuildContext context) => AnimatedContainerPage(),
    
  };
  return rutas;
}

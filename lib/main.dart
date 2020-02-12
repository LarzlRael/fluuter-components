import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:widgets/pages/alert_page.dart';
import 'package:widgets/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      // para cambiar el idioma de nuestro widgets
  localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate
  ],
  supportedLocales: [
    const Locale('en','US'), //engglish
    const Locale('es','ES') // spanish
  ],
      //home: HomePage(),
      initialRoute: '/',
      //creacion de rutas
      //esa funcion viene de otra funcion que esta en el archivo de rutas
      routes: getAplicationRoutes(),
      onGenerateRoute: (RouteSettings settings){
        print('ruta LLamada: ${settings.name}');
        return MaterialPageRoute(
          builder: (BuildContext context)=>AlertPage());
      },
    );
  }

}

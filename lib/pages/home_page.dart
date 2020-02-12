
import 'package:flutter/material.dart';
import 'package:widgets/providers/menU_providers.dart';
import 'package:widgets/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('xd'),
      ),
      body: _lista(),
    );
  }
}

//obteniendo los datos del archivos de forma asincrona
Widget _lista() {
  // print('_Lista');
  // print(opciones);
  //** usando un builder de futuro */
  return FutureBuilder(
      future: menuProveder.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapShot) {
        return ListView(
          children: _listaItems(snapShot.data,context),
        );
      });
}

_listaItems(List<dynamic> data,BuildContext context) {
  final List<Widget> opciones = [];

if(data == null){return [];}
  data.forEach((opt) {
    final widgetTemp = ListTile(
      title: Text(opt['texto']),
      leading: (getIcon(opt['icon'])),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {
        //usando las rutas con nombre
        // final route = MaterialPageRoute(
        //   builder: (context)=>  AlertPage(),
        // );
        // Navigator.push(context, route);

        Navigator.pushNamed(context, opt['ruta']);
      },
    );
    opciones..add(widgetTemp)..add(Divider());
  });
  return opciones;
}

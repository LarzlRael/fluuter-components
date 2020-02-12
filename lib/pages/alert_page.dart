import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('alert Page'),
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.blue,
          child: Text('Mostrar alerta'),
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _mostrarAlert(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_left),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostrarAlert(context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            title: Text('Titulo'),
            content: Column(
              // para que se ve el tamaño exacto sin desbordar
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Este es el contenido de la caja de la alerta'),
                FlutterLogo(
                  size: 100.0,
                )
              ],
            ),
            actions: <Widget>[
              
              FlatButton(
                child: Text('cancelar'),
                // es una forma de ir atras
                onPressed: () => Navigator.of(context).pop(),
              ),
              FlatButton(
                child: Text('ok'),
                // es una forma de ir atras
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }
}

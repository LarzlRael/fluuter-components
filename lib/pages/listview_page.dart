import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  //para poder controlar el scroll a volutand
  ScrollController _scrollController = new ScrollController();
  List<int> _listaMumeros = new List();
  int _ultimoItem = 0;
  @override

  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener((){
      print('screolll');
      if(_scrollController.position.pixels==_scrollController.position.maxScrollExtent){
        _agregar10();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista viewwwww'),
      ),
      body: _crearLista(),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: obtenerPagina1,
          child: ListView.builder(
        //enlazando el mtodo con la funcion
          controller: _scrollController,
          itemCount: _listaMumeros.length,
          itemBuilder: (BuildContext context, int index) {
            final imagen = _listaMumeros[index];
            return FadeInImage(
              image:
                  NetworkImage('https://i.picsum.photos/id/$imagen/500/300.jpg'),
              placeholder: AssetImage('assets/jar-loading.gif'),
            );
          }),
    );
  }

  void _agregar10() {
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaMumeros.add(_ultimoItem);
    }
    setState(() {
      
    });
  }
  Future<Null> obtenerPagina1() async{
    final duration = new Duration(seconds: 2);
    new Timer(duration, (){
      _listaMumeros.clear();
      _ultimoItem++;
      _agregar10();
    });
    return Future.delayed(duration);
  }
}

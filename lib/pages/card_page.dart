import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(50),
        children: <Widget>[_cardTipo1(), _cardTipo2()],
      ),
    );
  }
}

_cardTipo2() {
  final card =  Container(
    child: Column(
      children: <Widget>[
        FadeInImage(
          image: NetworkImage(
              'https://iso.500px.com/wp-content/uploads/2014/07/big-one.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 1000),
          //que se adapte a 
          fit:BoxFit.cover
        ),
        Container(
            padding: EdgeInsets.all(10.0),
            child: Text('No tengo idea de que hacer'))
      ],
    ),
  );
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.white,
      boxShadow: <BoxShadow>[
        BoxShadow(

          color: Colors.black26,
          blurRadius: 10.0,
          spreadRadius: 2.0,
          offset: Offset(2.0,-5.0)
        )
      ]
      //color:Colors.red
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: card,
    ),
  );
}

_cardTipo1() {
  return Card(
    //darle una formna borde
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    //para darle un borde en forma de sombra
    elevation: 10.0,
    child: Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.photo_album, color: Colors.blue),
          title: Text('soy el titulo de esta tarjeta'),
          subtitle: Text(
              'Aqui estamos con la descripcion de texto que quiero mostrales '),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FlatButton(
              child: Text('ok'),
              onPressed: () {},
            ),
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () {},
            ),
          ],
        )
      ],
    ),
  );
  
}

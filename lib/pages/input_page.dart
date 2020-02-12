  import 'package:flutter/material.dart';

  class InputPage extends StatefulWidget {
    @override
    _InputPage createState() => _InputPage();
  }

  class _InputPage extends State<InputPage> {
    String _nombre = '';
    String _email = '';
    String _fecha = '';
    String _opcionSeleccionada = 'Volar';
    TextEditingController _inputFieldDataControler = new TextEditingController();
    List<String> _poderes = ['Volar', 'Rayos x', 'Super aliente', 'Super Fuerza'];

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Inputs de text'),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
          children: <Widget>[
            _creatInput(),
            Divider(),
            _crearEmail(),
            Divider(),
            _crearPassword(),
            Divider(),
            _crearFecha(context),
            Divider(),
            _crearDropDown(),
            Divider(),
            _crearPersona()
          ],
        ),
      );
    }

    _creatInput() {
      return TextField(
        //el foco de pone automaticamente en ahi
        //autofocus: true,
        //esto pone cada palabra dentro del input en capitalize
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
            // darle un borde a nuestro input
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            counter: Text('Letras 0'),
            //como el place holder  de html
            hintText: 'Nombre de la persona ',
            labelText: 'Nombre',
            helperText: 'Solo es el nombre',
            //poner un icomo al lado derecho dentro del input
            suffixIcon: Icon(Icons.accessibility),
            // icono que apraece fuera del input al lado izquierdo
            icon: Icon(Icons.account_circle)),
        // para obtener el valor de la caja de texto
        onChanged: (valor) {
          setState(() {
            _nombre = valor;
          });
          //print(_nombre);
          Divider();
          _crearPersona();
        },
      );
    }

    _crearEmail() {
      return TextField(
          // tipo de teclado para el email
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              // darle un borde a nuestro input
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              //como el place holder  de html
              hintText: 'email',
              labelText: 'Email',
              helperText: 'Solo es el email',
              //poner un icomo al lado derecho dentro del input
              suffixIcon: Icon(Icons.alternate_email),
              // icono que apraece fuera del input al lado izquierdo
              icon: Icon(Icons.email)),
          // para obtener el valor de la caja de texto
          onChanged: (valor) => setState(() {
                _email = valor;
              }));
    }

    _crearPassword() {
      return TextField(
        obscureText: true,
        decoration: InputDecoration(
            // darle un borde a nuestro input
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            //como el place holder  de html
            hintText: 'contraseña',
            labelText: 'Contraseña',
            helperText: 'Escriba su contraseña',
            //poner un icomo al lado derecho dentro del input
            suffixIcon: Icon(Icons.lock_open),
            // icono que apraece fuera del input al lado izquierdo
            icon: Icon(Icons.lock)),
        // para obtener el valor de la caja de texto
        onChanged: (valor) {
          setState(() {
            _nombre = valor;
          });
          //print(_nombre);
          Divider();
          _crearPersona();
        },
      );
    }

    Widget _crearPersona() {
      return ListTile(
        title: Text('Nombre es: $_nombre'),
        subtitle: Text('Nombres es $_email'),
      );
    }

    Widget _crearFecha(BuildContext context) {
      return TextField(
          // para poder evitar el copia y pega dentro de este
          enableInteractiveSelection: false,
          controller: _inputFieldDataControler,
          decoration: InputDecoration(
              // darle un borde a nuestro input
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              //como el place holder  de html
              hintText: 'contraseña',
              labelText: 'Contraseña',
              helperText: 'Escriba su contraseña',
              //poner un icomo al lado derecho dentro del input
              suffixIcon: Icon(Icons.perm_contact_calendar),
              // icono que apraece fuera del input al lado izquierdo
              icon: Icon(Icons.calendar_today)),
          // para obtener el valor de la caja de texto
          onTap: () {
            // para quitar el foco con esta instruccion
            FocusScope.of(context).requestFocus(new FocusNode());
            _selectDate(context);
          });
      //print(_nombre);
    }

    void _selectDate(BuildContext context) async {
      DateTime picked = await showDatePicker(
          context: context,
          initialDate: new DateTime.now(),
          firstDate: new DateTime(2015),
          lastDate: new DateTime(2025),
          //cambiar el idioma
          locale: Locale('es', 'ES'));
      if (picked != null) {
        setState(() {
          _fecha = picked.toString();
          _inputFieldDataControler.text = _fecha;
        });
      }
    }

    // drop down es el COMBO BOX
    List<DropdownMenuItem<String>> getOpcionesDropDown() {
      List<DropdownMenuItem<String>> lista = new List();

      _poderes.forEach((poder) {
        lista.add(DropdownMenuItem(
          child: Text(poder),
          value: poder,
        ));
      });
      return lista;
    }

    Widget _crearDropDown() {
      return Row(
        children: <Widget>[
          Icon(Icons.select_all),
          SizedBox(
            width: 30.0,
          ),
          Expanded(
            child: DropdownButton(
                items: getOpcionesDropDown(),
                value: _opcionSeleccionada,
                onChanged: (opt) {
                  setState(() {
                    _opcionSeleccionada = opt;
                  });
                }),
          )
        ],
      );
    }
  }

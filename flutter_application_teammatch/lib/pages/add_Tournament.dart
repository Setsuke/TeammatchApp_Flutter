import 'package:flutter/material.dart';
import 'package:flutter_application_teammatch/profile/button_widget.dart';

class AddTournament extends StatefulWidget {
  @override
  _AddTournamentState createState() => _AddTournamentState();
}

class _AddTournamentState extends State<AddTournament> {
  String _nombre = '';
  String _description = '';
  String _prize = '';
  String _maxTeam = '';

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/luna.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Add Tournament'),
        ),
        body: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            _crearInput(),
            Divider(),
            _crearDescripcion(),
            Divider(),
            _crearPrecio(),
            Divider(),
            _crearMaxteam(),
            SizedBox(height: 30.0),
            Center(child: _crearTorneo()),
          ],
        ),
      ),
    );
  }

  Widget _crearInput() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: TextField(
        // autofocus: true,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Nombre del equipo',
            labelText: 'Nombre',
            icon: Icon(Icons.gamepad)),
        onChanged: (valor) {
          setState(() {
            _nombre = valor;
          });
        },
      ),
    );
  }

  Widget _crearDescripcion() {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: TextField(
        // autofocus: true,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Descripción del torneo',
            labelText: 'Descripción',
            icon: Icon(Icons.text_snippet_rounded)),
        onChanged: (valor) {
          setState(() {
            _description = valor;
          });
        },
      ),
    );
  }

  Widget _crearPrecio() {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: TextField(
        // autofocus: true,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Precio del torneo',
            labelText: 'Precio',
            icon: Icon(Icons.monetization_on)),
        onChanged: (valor) {
          setState(() {
            _prize = valor;
          });
        },
      ),
    );
  }

  Widget _crearMaxteam() {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: TextField(
        // autofocus: true,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Tamaño maximo del equipo',
            labelText: 'Tamaño',
            icon: Icon(Icons.group)),
        onChanged: (valor) {
          setState(() {
            _maxTeam = valor;
          });
        },
      ),
    );
  }

  Widget _crearTorneo() => ButtonWidget(
        text: 'Crear',
        onClicked: () {},
      );
}

import 'package:flutter/material.dart';
import 'package:flutter_application_teammatch/profile/button_widget.dart';

//En desarrollo
class AddTeamPage extends StatefulWidget {
  @override
  _AddTeamPageState createState() => _AddTeamPageState();
}

class _AddTeamPageState extends State<AddTeamPage> {
  String _nombre = '';
  String _description = '';
  String _teamSize = '';

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
          title: Text('Add Team'),
        ),
        body: ListView(
          children: <Widget>[
            _crearInput(),
            Divider(),
            _crearDescripcion(),
            Divider(),
            _crearsizeTeam(),
            SizedBox(height: 30.0),
            Center(child: _crearTeam()),
          ],
        ),
      ),
    );
  }
}

Widget _crearInput() {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    child: TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Nombre del equipo',
          labelText: 'Nombre',
          icon: Icon(Icons.gamepad)),
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
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Descripción del equipo',
          labelText: 'Descripción',
          icon: Icon(Icons.text_snippet_rounded)),
    ),
  );
}

Widget _crearsizeTeam() {
  return Card(
    color: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    child: TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Tamaño del equipo',
          labelText: 'Tamaño',
          icon: Icon(Icons.group_add)),
    ),
  );
}

Widget _crearTeam() => ButtonWidget(
      text: 'Crear',
      onClicked: () {},
    );

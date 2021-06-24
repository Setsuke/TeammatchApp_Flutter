import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    // Las acciones de nuestro AppBar
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del AppBar
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultados que vamos a marcar
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Son las sugerencias cuando la persona escribe
    return Container();
  }
}

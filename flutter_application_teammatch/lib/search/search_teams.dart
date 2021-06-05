import 'package:flutter/material.dart';
import 'package:flutter_application_teammatch/search/search_delegate.dart';

class SearchTeams extends StatelessWidget {
  const SearchTeams({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Teams'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/luna.jpg'), fit: BoxFit.cover)),
      ),
    );
  }
}

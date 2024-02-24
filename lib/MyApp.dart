import 'package:assignment3/contacts.dart';
import 'package:assignment3/edited.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: edited.routeName,
      routes: {
        contacts.routeName:(context)=>contacts(),
        edited.routeName:(context)=>edited(),
      },

    );
  }
}

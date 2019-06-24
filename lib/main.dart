import 'package:flutter/material.dart';
import 'package:credshare/Pages/Setup/signIn.dart';


void main() => runApp(CredShare());

class CredShare extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CredShare',
      home: LoginPage(),
      routes: <String, WidgetBuilder> {
      }
      );
  }
}



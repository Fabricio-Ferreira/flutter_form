import 'package:flutter/material.dart';
import 'package:flutter_form/src/pages/login_page.dart';

void main () {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
    title: ('FORMULÁRIO DE CADASTRO'),
    theme: ThemeData(primarySwatch: Colors.deepPurple),
  ));
}
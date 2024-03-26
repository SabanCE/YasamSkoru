

import 'package:flutter/material.dart';
void main(){
  runApp(const deneme());
}

class deneme extends StatefulWidget {
  const deneme({super.key});

  @override
  State<deneme> createState() => _denemeState();
}

class _denemeState extends State<deneme> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(theme: ThemeData(
        brightness: Brightness.dark,
      primaryColor: Colors.cyan,// AppBar rengi
      scaffoldBackgroundColor: Colors.black,
      


    ),home:

     Scaffold(
      appBar: AppBar(title: const Text("Şaban"),),
      body: const Text("Şaban",
      style: TextStyle(color: Colors.black),),)


    );

  }
}

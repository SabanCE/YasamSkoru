import 'package:ders2/home.dart';
import 'YaşamBeklentisi/uygulama.dart';
import 'package:flutter/material.dart';
import 'YaşamBeklentisi/splashScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'degiskenler.dart';


void main(){
  runApp(const app());
}

class app extends StatefulWidget {
  const app({super.key});

  @override
  State<app> createState() => _appState();
}

class _appState extends State<app> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Yaşam Beklentiniz",
      routes: {
        '/':(context)=>const splash(),
        '/home':(context)=>const home(),
        '/welcome':(context)=>const uygulama(),
      },
      // ThemeData sayesinde tüm sayfalarımıı şekillendiriyoruz.
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.blue,
        appBarTheme:  AppBarTheme(
            color: Colors.blue,
            titleTextStyle: GoogleFonts.anton(textStyle: baslikStyle),
      ),
    ));
  }
}

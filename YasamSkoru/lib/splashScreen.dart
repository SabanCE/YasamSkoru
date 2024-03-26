
import 'dart:async';
import 'package:ders2/degiskenler.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import '../home.dart';


var anaRenk=const Color(0xFF359dff);
class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override


  void initState(){
    super.initState();
    startTimer();
  }
  startTimer() {
    var duration = const Duration(seconds: 2);
    return Timer(duration, route);
  }
    route() {
    // Burada Page transiton ekledğimiz paket sayesinde animasyonlu sayfa geçişi sağladık.
      Navigator.push(context, PageTransition(
          duration: const Duration(seconds: 2),
          alignment: Alignment.center,
          child: const home(),
          type: PageTransitionType.rightToLeft));
      //  Navigator.pushReplacementNamed(context, '/home');
    }
  @override

  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: anaRenk,
      body: content(),);
  }
  Widget content(){
    return
       Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Text("Sağlınız Her Daim Önemli.",style:GoogleFonts.anton(textStyle: baslikStyle),),
          ),
          Container(child: Lottie.asset('lib/animations/b.json'),),

        ],


    );
  }
}

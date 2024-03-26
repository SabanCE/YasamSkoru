import 'package:ders2/Ya%C5%9FamBeklentisi/uygulama.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'degiskenler.dart';
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(leading:  MyIconButton(onPress: (){showDialog(context: context, builder: (context)=> AlertDialog(backgroundColor: Colors.blue,actions:
      [TextButton(onPressed: (){SystemNavigator.pop();}, child:   Text("Çık.",style: kucukBaslikStyle,)),
        TextButton(onPressed: (){Navigator.pop(context);}, child:  Text("Kal",style: kucukBaslikStyle,)),
      ],title:  Text("Çıkıyor musunuz?",textAlign: TextAlign.center,style: endStyle,)));},),
        title: const Text("Tahmini Yaşam Süresi"),
        centerTitle: true,),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Container(child: Lottie.asset('lib/animations/c.json')),
           TextButton(onPressed: (){setState(() {
             Navigator.push(context,PageTransition(duration: const Duration(seconds: 1),alignment: Alignment.center,child:const uygulama() , type: PageTransitionType.fade));
           });},
             child:  Text("Tahmini Yaşam Sürenizi Öğrenmek için Tıklayınız.",style:baslikStyle),)
         ,const SizedBox(height: 30,),

      ],),
    );
  }
}


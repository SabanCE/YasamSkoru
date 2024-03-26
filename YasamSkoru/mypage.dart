
import 'package:flutter/material.dart';
class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override

  @override
  Widget build(BuildContext context) {
    var textControl=TextEditingController(); // Alınan veriyi tekrar yazdırmamıza yarar.
    String resimAdi="chevron.png";
    String alinanVeri="";
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(alinanVeri,style: const TextStyle(fontSize: 50,color: Colors.black),),
            TextField(
              controller: textControl,
              decoration: const InputDecoration(hintText: "Veri"),
              keyboardType: TextInputType.number, // Klavye türünü belirliyoruz alfabe mi sayı mı ?
              obscureText: true,
              //Text gizleme
            ),
            ElevatedButton(onPressed: (){setState(() {
              alinanVeri=textControl.text;
              //alinanVeri="";
            });}, child:const Text("Veriyi Al"),),

            ElevatedButton(onPressed: (){
              setState(() {
                resimAdi="arrow.png";
              });
            }, child:const Text("Resim Değiştir."),),
            SizedBox(width:50,height:50,child: Image.asset('lib/images/$resimAdi')),


          ],
        ),
      ),
    );




  }
}

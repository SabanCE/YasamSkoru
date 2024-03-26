
import 'package:ders2/Ya%C5%9FamBeklentisi/skorHesaplamalari.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../degiskenler.dart';
import 'package:ionicons/ionicons.dart';

class uygulama extends StatefulWidget {
  
  const uygulama({super.key});

  @override
  State<uygulama> createState() => _uygulamaState();
}

class _uygulamaState extends State<uygulama> {

  @override
  Widget build(BuildContext context) {

    return  Scaffold(

                  //APPBAR
      appBar: AppBar(
        title: const Text("Tahmini Yaşam Süresi"),centerTitle: true,leading:  MyIconButton(onPress: (){setState(() {Navigator.pop(context);});},),),

      body:  Column(

      crossAxisAlignment: CrossAxisAlignment.stretch, // Containerlerin ekranı tammamen kapmalamasını sağladık sadece Textle Kalmayacak
      children:[
                      // BOY VE KİLO HESAPLAMA
        Expanded(
          child: Row(

            children: [
              Expanded(
                child:  MyContainer(child: boyKiloContainer("KİLO",sKilo),),
              ),
                Expanded(
                child: MyContainer(child: boyKiloContainer("BOY",sBoy),),
               )],
          ),),

                    // YAPILAN SPOR MİKTARI
        Expanded(
            child: MyContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text("Haftada kaç gün spor yapıyorsunuz?",style:  metinStyle,),
              Text(yapilanSpor.round().toString(),style: sayiStyle ),

              Slider(
                inactiveColor: Colors.red[200],
                activeColor: Colors.lightBlue,
                min: 0.0, // min sigara miktarı
                max: 7.0, // max sigara miktarı
                value:  yapilanSpor,
                onChanged: (double secilenSpor){setState(() {
                  yapilanSpor=secilenSpor;
                });},
                divisions: 7, // Kaç parça olacak Slider?
              ),

            ],),)),

                  // SİGARA MİKTARI
        Expanded(
             child: MyContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Text("Günde Kaç Sigara İçiyorsunuz?",style:  metinStyle,),
             Text(icilenSigara.round().toString(),style: sayiStyle,),

          Slider(
            inactiveColor: Colors.red[200],
            activeColor: Colors.lightBlue,
            min: 0.0, // min sigara miktarı
            max: 20.0, // max sigara miktarı
            value:  icilenSigara,
            onChanged: (double secilenSigara){setState(() {
              icilenSigara=secilenSigara;
            });},
            divisions: 20, // Kaç parça olacak Slider?
          ),

          ],),
             )),

                // CİNSİYET SEÇİMİ
        Expanded(
          child: Row(
            children: [
              Expanded(
                child:  MyContainer(
                  onPress: (){setState(() {seciliCinsiyet=true;});},
                  renk: seciliCinsiyet==true?Colors.lightBlue:Colors.white,
                  child:  const gender(
                    animation: 'male',
                   // ikon: Ionicons.male,
                    cinsiyet: 'Erkek',),),
              ),
              Expanded(
                child: MyContainer(
                  onPress:(){setState(() {seciliCinsiyet=false;});},
                  renk: seciliCinsiyet==false?Colors.lightBlue:Colors.white,
                  child:  const gender(
                    animation: 'female',
                   // ikon: Ionicons.female,
                    cinsiyet: "Bayan",), ),
              ),
            ],
          ),),

             // YAŞAM SÜRESİ HESAPLAMA BUTONU
        Expanded(
          child: MyContainer(
    child:TextButton(onPressed: (){
      setState(() {
        if(seciliCinsiyet==null)
        {
          showDialog(context: context, builder: (context)=> AlertDialog(backgroundColor: Colors.blue,actions:
          [TextButton(onPressed: (){Navigator.pop(context);}, child:  Text("Tamam",style: kucukBaslikStyle,),)],title:  Text("Lütfen Cinsiyet Seçiniz!",textAlign: TextAlign.center,style: endStyle,),),);
        }
        else{
        displayBottomSheet(context);skor=100.0;
        }

      });

      }, child: Text("Yaşam Süresini Hesapla!",style:metinStyle  ), ),


          ),
         ),
         ],
    ),


    );
  }
  
  // BOY VE KİLO KONTEYNIRLARI
  Row boyKiloContainer(String boyMukiloMu,double uzunluk) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment:CrossAxisAlignment.stretch, // Bunu yazarak konteynırımızın şekil değiştirmesini engelledik texte göre.
      children: [
        RotatedBox(quarterTurns: -1,child: Text(boyMukiloMu,style: metinStyle,textAlign: TextAlign.center,),),
        RotatedBox(quarterTurns: -1,child: Text(uzunluk.toString(),style: sayiStyle,textAlign: TextAlign.center,)),
        const SizedBox(width: 30,),
        Column(children: [ const SizedBox(height: 5, ),  myBoyButton(icon: Ionicons.arrow_up_outline,onPress: (){setState(() {boyMukiloMu=="KİLO"?sKilo++:sBoy++;});},),
          const SizedBox(height: 5, ),
          myBoyButton(icon: Ionicons.arrow_down_outline,onPress: (){setState(() {boyMukiloMu=="KİLO"?sKilo--:sBoy--;});},)
          ,const  SizedBox(height:  5, ),
        ],),


      ],);
  }

}

Future displayBottomSheet(BuildContext context){


  return showModalBottomSheet(context: context,
      backgroundColor: Colors.blue,
      builder: (context)=> SizedBox(
    height: MediaQuery.of(context).size.height/2,
        child: Column(crossAxisAlignment:CrossAxisAlignment.stretch,children: [

          Row(children:[
             MyIconButton(onPress: (){Navigator.pop(context);},),
            const SizedBox(width: 50,),
            Text("SAĞLIK SKORUNUZ :",style:baslikStyle,textAlign: TextAlign.center,),
          ]),
          const SizedBox(height: 30,),
          Container(width: 150,height:150,decoration: const  BoxDecoration(shape: BoxShape.circle,color: Colors.white),child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 45, 0, 0),
            child: Text(skorHesapla().toInt().toString(),style:sayiStyle,textAlign: TextAlign.center,),
          ),),
           Padding(padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),child: Text(saglikMesaji(skorHesapla()).toString(),style: baslikStyle,textAlign: TextAlign.center,)),
            Padding(padding: const  EdgeInsets.fromLTRB(0, 30, 0, 0),child: TextButton(onPressed: (){
              showDialog(context: context, builder: (context)=> AlertDialog(backgroundColor: Colors.blue,actions:
              [TextButton(onPressed: (){SystemNavigator.pop();}, child:   Text("Çık.",style: kucukBaslikStyle,)),
                TextButton(onPressed: (){Navigator.pop(context);}, child:  Text("Kal",style: kucukBaslikStyle,)),


              ],title:  Text("Çıkıyor musunuz?",textAlign: TextAlign.center,style: endStyle,)));
              }, child: Text("Uygulamadan Çık",style: endStyle,))),

   ],
        ),
  ));
}



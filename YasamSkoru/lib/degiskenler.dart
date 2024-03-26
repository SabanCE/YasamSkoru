import 'package:ionicons/ionicons.dart';
import 'package:flutter/material.dart';
import'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
var anaRenk=const Color(0xFF359dff);



TextStyle metinStyle= GoogleFonts.anton (fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black38);
TextStyle sayiStyle=GoogleFonts.anton (fontSize: 30,fontWeight: FontWeight.w800,color: Colors.lightBlue);
TextStyle baslikStyle= GoogleFonts.anton( fontSize: 30, fontStyle: FontStyle.italic,color:Colors.white);
TextStyle endStyle= GoogleFonts.anton( fontSize: 30, fontStyle: FontStyle.italic,color:Colors.red);
TextStyle kucukBaslikStyle= GoogleFonts.anton( fontSize: 15, fontStyle: FontStyle.italic,color:Colors.white);


class gender extends StatefulWidget  {
  final String ?cinsiyet;
  final IoniconsData ?ikon;
  final String ?animation;

  const gender({
    super.key,
    this.cinsiyet,
    this.ikon,
    this.animation,
  });

  @override
  State<gender> createState() => _genderState();
}

class _genderState extends State<gender> {
  @override
  Widget build(BuildContext context) {

    return  Column(
      children: [
      /*Expanded(
          child: Icon(widget.ikon,size: 100,color: Colors.black26)),
       */
      Padding(padding: const EdgeInsets.all(5),child:
      Text("${widget.cinsiyet}",style: metinStyle,
     ),
      ),
        Expanded(child: Lottie.asset('lib/animations/${widget.animation}.json')),
      ],);
  }
}





// widgetin üstüne sağ tıkladık refektor > extact fltutter widgete bastık ve customwidget oluştu.
class MyContainer extends gender implements StatefulWidget {
  final Color? renk;
  final Widget? child;
  final  void Function() ?onPress;
  final double? yukseklik;
  final double? genislik;

  @override


  const MyContainer({
    super.key,
    this.renk=Colors.white,
    this.child,
    this.onPress,
    this.yukseklik,
    this.genislik,

  });
  @override
  State<MyContainer> createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: Container(
        width: widget.yukseklik,
        height: widget.genislik,

        margin: const EdgeInsets.all(12.0), // Her taraftan boşluk alır.
        decoration: BoxDecoration(
          //image: const DecorationImage(fit: BoxFit.cover,image: AssetImage('lib/images/blue.jpg')),
           // Burada Kenarlarını keskinleştirdik konteynrıların.
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade500,
                  offset: const Offset(4.0, 4.0),
                  blurRadius: 0,
                  spreadRadius: 1.0,
              ),
              const BoxShadow(
                color: Colors.grey,
                offset: Offset(-4.0, -4.0),
                blurRadius: 0,
                spreadRadius: 1.0,
              ),
            ],

            borderRadius: BorderRadius.circular(10.0),
            color: widget.renk),
        child: widget.child,),
    );
  }

}
class MyIconButton extends StatelessWidget {
  final  void Function() ?onPress;
  const MyIconButton({
    this.onPress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPress,

      icon:const Icon(color: Colors.white,Ionicons.arrow_back),);
  }
}




class myBoyButton extends StatelessWidget {
  final IoniconsData ?icon;
  final void Function() ?onPress;
  const myBoyButton({
    super.key,
    this.icon,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ButtonTheme(
          splashColor: Colors.blue,
          buttonColor: Colors.blue,
          child: OutlinedButton(onPressed:onPress, child:  Expanded(child:Icon(icon,color: Colors.blue,)))), );
  }
}


  bool ?seciliCinsiyet;
  double icilenSigara=0;
  double yapilanSpor=0;
  double sBoy=175;
  double sKilo=75;













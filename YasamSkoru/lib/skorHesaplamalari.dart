import "../degiskenler.dart";

double skor=100.0;
var bkEndeksi=sKilo/(sBoy*sBoy*1/10*1/10*1/10*1/10);
double skorHesapla(){
  if(seciliCinsiyet==true){skor-=5;}
  else if(seciliCinsiyet==false) {skor+=5;}

  skor-=(icilenSigara)*3.25;
  skor-=((7-yapilanSpor)*3.5714);

   if(bkEndeksi<=18.5){
            skor-=10;
  }

  else if(18.5<=bkEndeksi&& bkEndeksi<25.0){
        skor+=10;
  }

  else if(25<=bkEndeksi&& bkEndeksi<30.0){
          skor-=10;
  }
  else if(30<=bkEndeksi&& bkEndeksi<35.0){
        skor-=15;
  }
  else if(35<=bkEndeksi&& bkEndeksi<40){
    skor-=20;
  }
  else if(40<=bkEndeksi){
        skor-=25;
  }
  return skor;
}


List <String> mesaj=["Sağlık Durumunuz Kötü Daha Dikkatli Olun.","Sağlık Durumunuzu Daha İyi Hale Getirebilirsin","Sağlık Durumun normal","Sağlık Durumun Gayet İyi","Hay Aksi! :("];

  saglikMesaji(double skor){
  if(skor<=25){
      return mesaj[0];
  }
  else if(skor<=50 && skor>25){
      return mesaj[1];
  }
  else if(skor<=75 && skor>50){
     return  mesaj[2];

  }
  else if(skor<=100 && skor>75){
     return mesaj[3];
  }
  else{
  mesaj[4];
  }
  }


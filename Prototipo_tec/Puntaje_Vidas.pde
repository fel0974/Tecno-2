class Puntaje_Vidas {

  PImage[] vidas =new PImage[2];

  int vidaspelota, cantidadTrofeo;
  Puntaje_Vidas() {

    vidaspelota=3;
    cantidadTrofeo=5;

    for (int i=0; i<2; i++) {
      vidas[i]=loadImage("vidas" +i+".png");
    }
  }
  void dibujar () {

    //println("VidasPelota:" +vidaspelota);
    //println("cantidadTrofeo:" +cantidadTrofeo);
    //---------------vidas--------------------
    for (int i=0; i<3; i++) {
      image(vidas[0], 35*i +30, 30); //coras vacios
    }

    for (int i=0; i< vidaspelota; i++) {
      image(vidas[1], 35*i+30, 30);  //coras vida completa
    }

    //---------------trofeos--------------------

    for (int i=0; i<5; i++) { //desaparecer trofeos
      image(trofeo, 1500, 700, 30, 25); //trofeos
    }

    for (int i=0; i< cantidadTrofeo; i++) {
      image(trofeo, 165+i*36, 30, 30, 25); //trofeos
    }
  }
}

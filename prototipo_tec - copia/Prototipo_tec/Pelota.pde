class Pelota {

  PImage[] Balon =new PImage[3];

  FCircle circulo;

  Pelota(float _d) { 

    circulo=new FCircle(_d);

    for (int i=0; i<3; i++) {
      Balon[i]=loadImage("pelota" +i+".png");
    }
  }

  void iniciar(float _x, float _y) {

    circulo.setDensity(0.9);
    circulo.setName("pelota");
    circulo.setPosition(_x, _y);
    circulo.setVelocity(0.5, 0.9); //velocidad
    circulo.setDamping(-2.5); 
    circulo.setStatic(false);
    circulo.setGrabbable(true);
    circulo.attachImage(Balon[0]);
    circulo.setRestitution(0.4); //rebote
  }
  void perderVelocidad(float vel_x, float vel_y) {

    circulo.setVelocity(vel_x, vel_y); //velocidad
  }
  void RebotarMenos(float rebote) {

    circulo.setRestitution(rebote);
  }
  void RebotarMas(float reboteMayor) {

    circulo.setRestitution(reboteMayor);
  }

  void cambiarPelota2() {

    circulo.attachImage(Balon[1]);
  }
  void cambiarPelota3() {

    circulo.attachImage(Balon[2]);
  }
}

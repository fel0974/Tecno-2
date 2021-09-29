class Obstaculos {

  PImage[] obstaculos =new PImage[4];
  FBox pinches;
  FPoly cono;
  FBox agua;

  Obstaculos() { 

    for (int i=0; i<4; i++) {
      obstaculos[i]=loadImage("obstac" +i+".png");
    }

    cono=new FPoly();
    pinches=new FBox(60, 30);
    agua=new FBox(50, 4);
  }

  void iniciar(float _x, float _y) {

    cono.setName("cono");
    cono.setPosition(_x, _y);
    cono.setDensity(1.9);
    cono.setVelocity(2, 7);
    cono.attachImage(obstaculos[0]);
    cono.setRotatable(false);
    cono.setGrabbable(false);
    cono.vertex(0, 0);
    cono.vertex(8, 18); //piso
    cono.vertex(5, -20); //alto
  }

  void iniciar1_1(float _x, float _y) {

    pinches.setName("pinches1_1");
    pinches.setPosition(_x, _y);
    pinches.setStatic(true);
    pinches.attachImage(obstaculos[1]);
    pinches.setRotatable(false);
    pinches.setGrabbable(false);
  }
  void iniciar1_2(float _x, float _y) {

    pinches.setName("pinches1_2");
    pinches.setPosition(_x, _y);
    pinches.setStatic(true);
    pinches.attachImage(obstaculos[1]);
    pinches.setRotatable(false);
    pinches.setGrabbable(false);
  }
  void iniciar1_3(float _x, float _y) {

    pinches.setName("pinches1_3");
    pinches.setPosition(_x, _y);
    pinches.setStatic(true);
    pinches.attachImage(obstaculos[1]);
    pinches.setRotatable(false);
    pinches.setGrabbable(false);
  }
  void iniciar2_1(float _x, float _y) {

    pinches.setName("pinches1");
    pinches.setPosition(_x, _y);
    pinches.setStatic(true);
    pinches.attachImage(obstaculos[2]);
    pinches.setRotatable(false);
    pinches.setGrabbable(false);
  }
  void iniciar2_2(float _x, float _y) {

    pinches.setName("pinches2");
    pinches.setPosition(_x, _y);
    pinches.setStatic(true);
    pinches.attachImage(obstaculos[2]);
    pinches.setRotatable(false);
    pinches.setGrabbable(false);
  }
  void iniciar2_3(float _x, float _y) {

    pinches.setName("pinches3");
    pinches.setPosition(_x, _y);
    pinches.setStatic(true);
    pinches.attachImage(obstaculos[2]);
    pinches.setRotatable(false);
    pinches.setGrabbable(false);
  }
  void iniciar3(float _x, float _y) {

    agua.setName("agua");
    agua.setPosition(_x, _y);
    agua.setStatic(true);
    agua.attachImage(obstaculos[3]);
    agua.setRotatable(false);
    agua.setGrabbable(false);
  }
}

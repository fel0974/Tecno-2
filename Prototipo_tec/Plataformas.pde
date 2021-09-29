class Plataforma {

  PImage[] plataforma =new PImage[4];

  FBox pared;
  FBox suelo;
  FBox plataforma_chica;
  FBox plataforma_grande;

  Plataforma(float _w, float _h) { //ancho y alto

    pared=new FBox(_w, _h);
    suelo=new FBox(_w, _h);
    plataforma_grande=new FBox(_w, _h);
    plataforma_chica=new FBox(_w, _h);

    for (int i=0; i<4; i++) {
      plataforma[i]=loadImage("plataf"+i+".png");
    }
  }
  void iniciar0(float _x, float _y) {

    suelo.setName("suelo");
    suelo.setPosition(_x, _y);
    suelo.setStatic(true);
    suelo.setGrabbable(false);
    suelo.attachImage(plataforma[0]);
  }
  void iniciar(float _x, float _y) {

    plataforma_grande.setName("plataforma_grande");
    plataforma_grande.setPosition(_x, _y);
    plataforma_grande.setStatic(true);
    plataforma_grande.setGrabbable(false);
    plataforma_grande.attachImage(plataforma[1]);
  }

  void iniciarPlataformaChica(float _x, float _y) {

    plataforma_chica.setName("plataforma_chica");
    plataforma_chica.setPosition(_x, _y);
    plataforma_chica.setStatic(true);
    plataforma_chica.setGrabbable(false);
    plataforma_chica.attachImage(plataforma[2]);
  }
  void paredGol(float _x, float _y) {

    pared.setName("pared");
    pared.setPosition(_x, _y);
    pared.setStatic(true);
    pared.setGrabbable(false);
    pared.attachImage(plataforma[3]);
  }
} 

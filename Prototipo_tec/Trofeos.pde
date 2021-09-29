class Trofeos {

  FBox trofeo;

  Trofeos(float _w, float _h) { //ancho y alto

    trofeo=new FBox(_w, _h);
  }

  void iniciar(float _x, float _y, PImage imagen) {

    trofeo.setName("trofeo");
    trofeo.setPosition(_x, _y);
    trofeo.setStatic(true);
    trofeo.setGrabbable(false);
    trofeo.attachImage(imagen);
  }
}

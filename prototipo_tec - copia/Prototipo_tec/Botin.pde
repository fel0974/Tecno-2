class Botin {

  FPoly pie;


  Botin(float _x, float _y, PImage imagen) { 

    pie=new FPoly();
    pie.setDensity(100);
    pie.setName("botin");
    pie.setPosition(_x, _y);
    pie.setStatic(false);
    pie.attachImage(imagen);
    pie.setRotatable(false);
    pie.setGrabbable(false);
    pie.vertex(0, 0);
    pie.vertex(50, 20); 
    pie.vertex(-40, -30);
  }
}

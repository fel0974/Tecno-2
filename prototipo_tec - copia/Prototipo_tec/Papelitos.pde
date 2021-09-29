class Papelito {

  float x, y;
  float tam;
  float vel;
  PImage pap1;
  PImage pap2;
  PImage pap3;
  Papelito() {  
    x = random( -40, width );
    tam = random(10, 10 );
    vel = random( 1, 2 );

    pap1 = loadImage( "papel1.png" ); 
    pap1.resize( int(tam), int(tam) );
    pap2 = loadImage( "papel2.png" ); 
    pap2.resize( int(tam), int(tam) );
    pap3 = loadImage( "papel3.png" ); 
    pap3.resize( int(tam), int(tam) );
  }
  void cae() {
    y = y + vel;
  }
  void dibujar() {

    image(pap1, random( -40, width ), random(y));
    image(pap2, random( -40, width ), random(y));
    image(pap3, random( -40, width ), random(y));
  }
}

//declaración de la libreria opencv
import gab.opencv.*;
OpenCV opencv;

//declaración de la libreria de sonido
import processing.video.*;
import processing.video.*;

//declaración de la libreria de sonido
import ddf.minim.*;
//import ddf.minim.analysis.*;
//import ddf.minim.effects.*;
//import ddf.minim.signals.*;
//import ddf.minim.spi.*;
//import ddf.minim.ugens.*;

import fisica.*;  //declaración de la libreria

FWorld mundo;
Plataforma piso;
Plataforma plataforma_chica;
Pelota balon;
Botin botin;
Trofeos copa;
Puntaje_Vidas p_y_v;
Obstaculos c, p, a;
Papelito pape;

//--------------sonidos---------------------------------------

Minim minim;
AudioPlayer portada_p, ambiente, ganar_p, perder_p, festejo;
AudioSample charco_De_Agua, piquePelota, pelotaBotin, trofeoGolpear, conoGolpear, chispa ;

//-----------------------------------------------------------
PImage pie, arco, fondo, ganar, trofeo, perder, portada, miniBotin;
int contadorTrofeos, contadorVidas;
String estado;
Boolean dibujarPortada, dibujarGanar, dibujarPerder;
//--------------cámara---------------------------------------

Capture camara;
int ancho=1300;
int alto=600;

FMouseJoint cadena;
//-----imágenes--------------------------------------------------------------

void setup() {
  size(1300, 600);

  //------elegir-cámara--------------------------------------------------------

  String[] listaDeCamaras =Capture.list();
  printArray(listaDeCamaras);

  // int numerodeCamara=1; //elegir la camara de la lista

  //inicializar
  camara=new Capture(this, ancho, alto,"Iriun Webcam" );
  camara.start(); //encender la cámara

  //--LIBRERÍA FÍSICA---------------------------------------------------------

  Fisica.init(this);  //inicializacion de la libreria

  //-----------opencv---------------------------------------------------------

  opencv=new OpenCV(this, ancho, alto);

  //--------------------------------------------------------------------------

  minim=new Minim(this);

  //-------------sonidos cortos-----------------------------------------------

  charco_De_Agua=minim.loadSample("charco.wav", 500);
  piquePelota=minim.loadSample("piquePelota.wav", 500);
  pelotaBotin=minim.loadSample("pelotaBotin.wav", 500);
  trofeoGolpear=minim.loadSample("trofeoGolpear.wav", 500);
  conoGolpear=minim.loadSample("conoGolpear.wav", 500);
  chispa=minim.loadSample("chispa.wav", 500);

  //-------------sonidos largos-----------------------------------------------

  ganar_p= minim.loadFile ("ganar.wav", 1400);
  ambiente= minim.loadFile ("ambiente.wav", 1450);
  portada_p= minim.loadFile ("portada.wav", 1400);
  perder_p= minim.loadFile ("perder.wav", 1400);
  festejo= minim.loadFile ("festejo.wav", 1400);

  //------mundo---------------------------------------------------------------

  iniciar();

  //--------------------------------------------------------------------------  
  c=new Obstaculos();
  p=new Obstaculos();
  a=new Obstaculos();

  //-----------Imágenes cargadas----------------------------------------------
  miniBotin=loadImage("b2.png");
  fondo=loadImage("foto0.png");
  ganar=loadImage("foto1.png");
  perder=loadImage("foto2.png");
  arco=loadImage("foto3.png");
  pie=loadImage("foto10.png");
  trofeo=loadImage("foto11.png");
  portada=loadImage("foto15.png");
  //----------contadores------------------------------------------------------

  contadorTrofeos=5;
  contadorVidas=3;

  //----------estado inicial--------------------------------------------------

  estado="juego";

  //--------------------------------------------------------------------------

  dibujarPortada=true;
  dibujarGanar=false;
  dibujarPerder=false;

  //--------------------------------------------------------------------------  

  fisica();
  mundo.setGravity(0, 500);
}
void draw() {
  int umbral =250;

  //println("contadorVidas:" + contadorVidas);
  //println("contadorTrofeos:" + contadorTrofeos);
  //println("estado es:" + estado );
  //println("X es:" + mouseX ); 
  //println("Y es:"+ mouseY ); 

  PVector pixelMasBrillante = opencv.max();

  if (estado.equals("juego")) {

    image(fondo, 0, 0); //fondo

    p_y_v.dibujar(); //puntaje y vidas

    mundo.step(); //sucede el tiempo
    mundo.draw(); //dibuja el mundo de física
    image(arco, 1173, 203, 121, 163); //arco2 para contacto con la pelota

    if (dibujarPortada) {
      dibujarPortada(); //se dibuja la portada en el juego
    }
    if (dibujarPortada==false) {
      portada_p.pause(); //pausa la pista de la portada
    }
    if (dibujarGanar) {
      dibujarGanar(); //se dibuja la pantalla de ganar en el juego
      dibujarPerder=false; //para que no se dibuje la pantalla de perder cuando está la de ganar
      dibujarPortada=false;
    }
    if (dibujarPerder) {
      dibujarPerder(); //se dibuja la pantalla de perder en el juego
      dibujarGanar=false;  //para que no se dibuje la pantalla de ganar cuando está la de perder
      dibujarPortada=false;
    }
    //------ PORTADA con la captura-------------------------------------------

    if (dibujarPortada==true&& pixelMasBrillante.y>450) { //si dibujarPortada es verdadero y el punto más brillante en y es mayor a 450 empieza el juego

      dibujarPortada=false; //se va la portada, se entra al juego
      portada_p.pause(); //se pausa el sonido de portada al pasar al juego
      ambiente.loop(); //se inicia el sonido del juego
    }
    //------ GANAR con la captura---------------------------------------------

    if (dibujarGanar==true && pixelMasBrillante.x<400) { //si dibujarGanar es verdadero y el punto más brillante en x es menor a 400 empieza de nuevo el juego

      reset();
    }

    //------ PERDER con la captura--------------------------------------------

    if (dibujarPerder==true && pixelMasBrillante.x<400) { //si dibujarPerder es verdadero y el punto más brillante en x es menor a 400 empieza de nuevo el juego

      reset();
    }
  }
  image( miniBotin, pixelMasBrillante.x, pixelMasBrillante.y );
  cadena.setTarget(pixelMasBrillante.x, pixelMasBrillante.y);

  //------cámara--------------------------------------------------------------

  if ( camara.available() ) {
    camara.read();
    opencv.loadImage( camara );   //cargo en openCV la imagen de la camara

    opencv.threshold(umbral);

    //PImage salida=opencv.getOutput();
    //image(salida,0,0);
  }
}

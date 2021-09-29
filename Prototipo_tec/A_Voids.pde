void dibujarPerder() {

  fill(0, 190);
  rect(0, 0, 1300, 600);
  ambiente.pause(); //pausar sonido de ambiente
  perder_p.play();//inicia la pista de perder
  image(perder, 0, 0);
}

void dibujarGanar() {

  fill(0, 190);
  rect(0, 0, 1300, 600);
  image(ganar, 0, 0);
  ambiente.pause(); //pausar sonido de ambiente
  festejo.play(); //inicia la pista de ganar 
  pape.dibujar();
  pape.cae();
}
void dibujarPortada() {

  fill(0, 190);
  rect(0, 0, 1300, 600);
  image(portada, 0, 0);
  portada_p.play(); //inicia la pista en la portada
}

void reset() {

  p_y_v =new Puntaje_Vidas();
  p_y_v.dibujar();
  contadorTrofeos=5;
  contadorVidas=3;
  iniciar();
  fisica();
  dibujarPortada=true;
  portada_p.play(); //inicia la pista en la portada
  perder_p.pause();
  festejo.pause();
  dibujarPerder=false; //para que no se dibuje la pantalla de perder cuando está en inicio
  dibujarGanar=false;  //para que no se dibuje la pantalla de ganar cuando está en inicio
}

void iniciar() {

  pape =new Papelito();
  p_y_v =new Puntaje_Vidas();
  mundo= new FWorld(); //creación del mundo
  mundo.setEdges(); //bordes de la pantalla para que no se escapen los objetos
}

void fisica() {

  //----------piso------------------------------------------------------------

  piso =new Plataforma(1300, 55); //tamaño
  piso.iniciar0(width/2, height-30);  //posición 
  mundo.add(piso.suelo);

  //----------pelota----------------------------------------------------------

  balon =new Pelota(40); //tamaño
  balon.iniciar(102, height-108);  //posición 
  mundo.add(balon.circulo); 

  //----------Pared del arco-----------------------------------------------------------

  piso =new Plataforma(8, 163);
  piso.paredGol(1291, 285); //posición e imagen
  mundo.add(piso.pared); 

  //----------botin-----------------------------------------------------------

  botin =new Botin(60, 518, pie); //posición e imagen
  mundo.add(botin.pie); 

  //---------cadena----------------------------------------------------------

  cadena=new FMouseJoint(botin.pie, 60, 518);
  cadena.setFrequency(100);//velocidad a la q el objeto se acerca al punto
  mundo.add(cadena); 

  //---------plataformas------------------------------------------------------

  for (int i=0; i<2; i++) { 

    plataforma_chica =new Plataforma(130, 35); //plataforma narajanja
    plataforma_chica.iniciarPlataformaChica(280+i*100, 200+i*300); //Posición 
    mundo.add(plataforma_chica.plataforma_chica);
  }
  for (int i=0; i<2; i++) { 

    piso =new Plataforma(220, 35); //plataforma azul
    piso.iniciar(300+i*610, 300); //Posición 
    mundo.add(piso.plataforma_grande);
  }
  for (int i=0; i<2; i++) { 

    piso =new Plataforma(220, 35); //plataforma rosa
    piso.iniciar(width/2, 200+i*230); //Posición 
    mundo.add(piso.plataforma_grande);
  }
  for (int i=0; i<2; i++) { 

    plataforma_chica =new Plataforma(130, 35); //plataforma verde
    plataforma_chica.iniciarPlataformaChica(1050+i*45, 100+i*345); //Posición
    mundo.add(plataforma_chica.plataforma_chica);
  }
  piso =new Plataforma(130, 35); //plataforma del arco
  piso.iniciarPlataformaChica(1230, 380); //Posición
  mundo.add(piso.plataforma_chica);

  //---------trofeos----------------------------------------------------------

  for (int i=0; i<2; i++) { 

    copa =new Trofeos(50, 50); //trofeo sobre plataforma naranja
    copa.iniciar(285+i*130, 160+i*300, trofeo); //Posición e imagen
    mundo.add(copa.trofeo);
  }
  for (int i=0; i<2; i++) { 

    copa =new Trofeos(50, 50); //trofeo sobre plataforma verde
    copa.iniciar(1000, 60+i*200, trofeo); //Posición e imagen
    mundo.add(copa.trofeo);
  }

  copa =new Trofeos(50, 50); //trofeo sobre plataforma rosa
  copa.iniciar(width/2, 390, trofeo); //Posición e imagen
  mundo.add(copa.trofeo);

  //---------conos-------------------------------------------------------------

  for (int i=0; i<2; i++) { //sobre plataforma naranja
    c =new Obstaculos(); 
    c.iniciar(339+i*23, 463+i*300); //posición
    mundo.add(c.cono);
  }
  for (int i=0; i<2; i++) { //sobre plataforma rosa
    c =new Obstaculos(); 
    c.iniciar(width/2-58+i*100, 163); //posición
    mundo.add(c.cono);
  }
  for (int i=0; i<2; i++) {  //sobre plataforma azul
    c =new Obstaculos(); 
    c.iniciar(1050+i*45, 63+i*345); //posición 
    mundo.add(c.cono);
  }
  for (int i=0; i<2; i++) {  //sobre plataforma azul
    c =new Obstaculos(); 
    c.iniciar(250+i*600, 263); //posición
    mundo.add(c.cono);
  }
  for (int i=0; i<6; i++) { //sobre plataforma piso
    c =new Obstaculos(); 
    c.iniciar(width/2+i*40, 523); //posición 
    mundo.add(c.cono);
  }
  for (int i=0; i<5; i++) { //sobre plataforma piso
    c =new Obstaculos(); 
    c.iniciar(width/2+400+i*40, 523); //posición 
    mundo.add(c.cono);
  }
  //---------pinches----------------------------------------------------------

  p =new Obstaculos(); //pinche del medio
  p.iniciar1_1(645, 230); //posición 
  mundo.add(p.pinches);

  p =new Obstaculos(); //pinche de izquierda
  p.iniciar1_2(245, 330); //posición 
  mundo.add(p.pinches);

  p =new Obstaculos(); //pinche de derecha
  p.iniciar1_3(848, 330); //posición 
  mundo.add(p.pinches);

  //---------charcos-----------------------------------------------------------
  for (int i=0; i<2; i++) {
    a =new Obstaculos(); //charco del medio//arriba y abajo
    a.iniciar3(649-i*47, 184+i*230); //posición
    mundo.add(a.agua);
  }
  for (int i=0; i<2; i++) {
    a =new Obstaculos(); //charco del medio//arriba y abajo
    a.iniciar3(339+i*560, 284); //posición 
    mundo.add(a.agua);
  }
}
void contactStarted(FContact contacto) { 

  FBody body1 = contacto.getBody1(); 
  FBody body2 =  contacto.getBody2(); 

  //----------------contacto entre pelota y botin------------------------------

  if (( body1.getName()== "pelota" && (body2.getName()== "botin" ))  
    || (  body2.getName()== "pelota" && (body1.getName()== "botin" ))) {

    pelotaBotin.trigger();//sonido de botin pateando la pelota

    println(body1.getName(), body2.getName());
    println(contacto.getNormalX(), contacto.getNormalY(), contacto.getVelocityY());
  }

  //----------------contacto entre pelota y pinches del medio -----------------

  if (( body1.getName()== "pelota" && (body2.getName()== "pinches1_1")) 
    || (  body2.getName()== "pelota" && (body1.getName()== "pinches1_1"))) {

    chispa.trigger();//sonido de chispa

    //cuando toca el pinche cambia a la imagen2 

    p =new Obstaculos(); //pinche del medio
    p.iniciar2_1(645, 230); //posición 
    mundo.add(p.pinches);
  }
  //----------------contacto entre pelota y pinches de izquierda --------------

  if (( body1.getName()== "pelota" && (body2.getName()== "pinches1_2")) 
    || (  body2.getName()== "pelota" && (body1.getName()== "pinches1_2"))) {

    chispa.trigger();//sonido de chispa

    //cuando toca el pinche cambia a la imagen2 

    p =new Obstaculos(); //pinche de izquierda
    p.iniciar2_2(245, 330); //posición 
    mundo.add(p.pinches);
  }
  //----------------contacto entre pelota y pinches de derecha ----------------

  if (( body1.getName()== "pelota" && (body2.getName()== "pinches1_3")) 
    || (  body2.getName()== "pelota" && (body1.getName()== "pinches1_3"))) {

    chispa.trigger();//sonido de chispa

    //cuando toca el pinche cambia a la imagen2 

    p =new Obstaculos(); //pinche de derecha
    p.iniciar2_3(848, 330); //posición 
    mundo.add(p.pinches);
  }
  //----------------contacto entre pelota y cono--------------------------------

  if (( body1.getName()== "pelota" && (body2.getName()== "cono" ))  
    || (  body2.getName()== "pelota" && (body1.getName()== "cono" ))) {

    conoGolpear.trigger();
    println(body1.getName(), body2.getName());
    println(contacto.getNormalX(), contacto.getNormalY(), contacto.getVelocityY());
  }
  //----------------contacto entre pelota y trofeo------------------------------

  if (( body1.getName()== "pelota" && (body2.getName()== "trofeo" ))  
    || (  body2.getName()== "pelota" && (body1.getName()== "trofeo" ))) {

    mundo.remove( body1);//desaparece el trofeo cuando la pelota lo toca

    trofeoGolpear.trigger(); 

    contadorTrofeos-=1;
    p_y_v.cantidadTrofeo= p_y_v.cantidadTrofeo-1;

    println(body1.getName(), body2.getName());
    println(contacto.getNormalX(), contacto.getNormalY(), contacto.getVelocityY());
  }

  //----------------contacto entre pelota y la pared del arco-------------------

  if (( body1.getName()== "pelota" && (body2.getName()== "pared" ))  
    || (  body2.getName()== "pelota" && (body1.getName()== "pared" ))) {

    if (estado.equals("juego")&& contadorTrofeos==2 || contadorTrofeos==1 || contadorTrofeos==0) { //pasar a la pantalla de ganar agarrando 3,4 o 5 trofeos y tocando la pared del arco

      dibujarGanar=true;

      println(body1.getName(), body2.getName());
      println(contacto.getNormalX(), contacto.getNormalY(), contacto.getVelocityY());
    }
  }
  //------------------contacto entre pelota y plataforma chica------------------

  if (( body1.getName()== "pelota" && (body2.getName()== "plataforma_chica" ))  
    || (  body2.getName()== "pelota" && (body1.getName()== "plataforma_chica" ))) {

    balon.RebotarMenos(0.4); //si la pelota toca las plataformas mas pequeñas rebota menos
    piquePelota.trigger(); //sonido de pelota en plataforma

    println(body1.getName(), body2.getName());
    println(contacto.getNormalX(), contacto.getNormalY(), contacto.getVelocityY());
  }
  //-----------------------contacto entre pelota y plataforma grande-------------

  if (( body1.getName()== "pelota" && (body2.getName()== "plataforma_grande" )) 
    || (  body2.getName()== "pelota" && (body1.getName()== "plataforma_grande" ))) {

    balon.RebotarMas(0.8); //si la pelota toca las plataformas mas grandes rebota mas
    piquePelota.trigger(); //sonido de pelota en plataforma

    println(body1.getName(), body2.getName());
    println(contacto.getNormalX(), contacto.getNormalY(), contacto.getVelocityY());
  }
  //-----------------------contacto entre pelota y suelo--------------------------

  if (( body1.getName()== "pelota" && (body2.getName()== "suelo" )) 
    || (  body2.getName()== "pelota" && (body1.getName()== "suelo" ))) {


    piquePelota.trigger(); //sonido de pelota en suelo

    println(body1.getName(), body2.getName());
    println(contacto.getNormalX(), contacto.getNormalY(), contacto.getVelocityY());
  }
  //-----------------------contacto entre pelota y el charco-----------------------

  if (( body1.getName()== "pelota" && (body2.getName()== "agua" )) 
    || (  body2.getName()== "pelota" && (body1.getName()== "agua" ))) {


    balon.perderVelocidad(2, 2); //cuando pasa por un charco

    charco_De_Agua.trigger(); //sonido de charco de agua

    println(body1.getName(), body2.getName());
    println(contacto.getNormalX(), contacto.getNormalY(), contacto.getVelocityY());
  }
}
void contactEnded(FContact contactoFinalizado) { 

  FBody body1 = contactoFinalizado.getBody1(); 
  FBody body2 =  contactoFinalizado.getBody2(); 

  //-----------------------contacto entre pelota y pinches---------------------------

  if (( body1.getName()== "pelota" && (body2.getName()== "pinches"|| body2.getName()== "pinches1_1"|| body2.getName()=="pinches1_2" ||body2.getName()=="pinches1_3")) 
    || (  body2.getName()== "pelota" &&( body1.getName()== "pinches" || body1.getName()== "pinches1_1"|| body1.getName()=="pinches1_2" ||body1.getName()=="pinches1_3"))) {


    //cambia a la imagen 1 de los pinches
    p =new Obstaculos(); //pinche del medio
    p.iniciar1_1(645, 230); //posición 
    mundo.add(p.pinches);

    p =new Obstaculos(); //pinche de izquierda
    p.iniciar1_2(245, 330); //posición 
    mundo.add(p.pinches);

    p =new Obstaculos(); //pinche de derecha
    p.iniciar1_3(848, 330); //posición 
    mundo.add(p.pinches);

    contadorVidas-=1;
    p_y_v.vidaspelota= p_y_v.vidaspelota-1;

    //---------------cambiar imagen de pelota----------------------------------------

    if (estado.equals("juego")&& contadorVidas==2) { 

      balon.cambiarPelota2();
    }
    if (estado.equals("juego")&& contadorVidas==1) { 

      balon.cambiarPelota3();
    }

    //--------------------------------------------------------------------------------

    if (estado.equals("juego")&& contadorVidas==0) { //pasar a la pantalla de perder

      dibujarPerder=true;
      mundo.remove(balon.circulo); //desaparecer pelota al perder
    }

    println(body1.getName(), body2.getName());
    println(contactoFinalizado.getNormalX(), contactoFinalizado.getNormalY(), contactoFinalizado.getVelocityY());
  }
}

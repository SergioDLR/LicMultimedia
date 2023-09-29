import processing.sound.*;
SoundFile cancionInicio;
SoundFile reloj;
SoundFile acierto;
SoundFile ganar;
SoundFile perder;
int contador=0;
boolean centro= false;
boolean izquierda = false;
boolean derecha = false;
String estado;



void setup() {
  size(800, 800);
  cancionInicio = new SoundFile(this, "alarma.wav");
  reloj = new SoundFile(this, "reloj.wav");
  acierto = new SoundFile(this, "acierto.mp3");
  perder = new  SoundFile(this, "perder.mp3");
  ganar = new SoundFile(this, "ganar.mp3");
  cancionInicio.play();
  estado = "menu";
}


void draw() {

  contador++;
  //println(cancionInicio.isPlaying());
  if (!cancionInicio.isPlaying() && contador>50 && !reloj.isPlaying() && estado== "menu") {
    reloj.play();
    estado = "reloj";
  }
  if (centro && izquierda && derecha && estado == "reloj") {
    //ganar
    reloj.stop();
    estado = "ganar";
    ganar.play();
    println("ganaste");
  }

  if (!cancionInicio.isPlaying() && !reloj.isPlaying() && contador>18722 && estado == "reloj") {
    estado = "perdiste";
    perder.play();
    println("perdiste");
  }
}


void mousePressed() {
  if (estado == "reloj") {
    if (mouseButton == LEFT && !izquierda ) {
      izquierda = true;
      acierto.play();
    }
    if (mouseButton == CENTER && !centro) {
      centro = true;
      acierto.play();
    }
    if (mouseButton == RIGHT && !derecha) {
      derecha = true;
      acierto.play();
    }
  }
}

import oscP5.*;
import netP5.*;

OscP5 oscP5;
Cell celula;
Ebo ebo;
Parasito p1, p2, p3, p4;

PImage mascara;

float amp_, frec_;
int total;

int maxpal = 512;
int numpal = 0;
int fade;

boolean iniciar;

color[] goodcolor = new color[maxpal];

public void setup() {
  //size(displayWidth, displayHeight);
  size(800, 600);

  noCursor();
  background(0);

  //Conexión OSC
  oscP5 = new OscP5(this, 12000);

  //Configuración
  mascara = loadImage("mask.jpg");

  //Asignación
  celula = new Cell(random(width), random(height));
  ebo = new Ebo(width/2, height/2);
  p1 = new Parasito(-700, height-100, 1);
  p2 = new Parasito(width+700, 100, -1);
  p3 = new Parasito(-700, height-120, -1);
  p4 = new Parasito(width+700, 120, 1);

  iniciar = false;
  total = 1;
  fade = 255;

  maxpal = 512;
  numpal = 0;
}

public void draw() {
  background(0);

  //Mostramos y Movemos Célula
  celula.mover();
  celula.mostrar();

  //Mostramos y Movemos Ebo
  if (celula.centro) {
    ebo.comportamiento();
  }

  //Mostramos y Movemos Parásitos
  p1.comportamiento();
  p2.comportamiento();
  p3.comportamiento();
  p4.comportamiento();


  //Actualizar valores de Amplitud
  if (amp_ < 10) {
    amp_ = 0;
  }

  //Aplicar máscara
  blend(mascara, 0, 0, width, height, (width-1024)/2, 0, 1024, 768, SOFT_LIGHT);

  //FadeIn-Out
  pushStyle();
  fill(0, fade);
  rect(0, 0, width, height);
  fade = constrain(fade, 0, 280);
  if (celula.tamano > -500 && ebo.n < 20.0) {
    fade -= 3;
  }
  popStyle();

  //Llamar a la función de Resetear
  resetear();

  //Imprimir cantidad de Células para control
  println("Cantidad de Células: "+total);
}


public class Cell {
  ArrayList celulitas;

  color[] myc = new color[9];

  float off, movx, movy, di, movo, elx, ely, n, x, y, pmask;
  float diametro, co;
  int tamano, edad;

  boolean centro;

  Cell(float x_, float y_) {
    takecolor("paleta.gif");
    movx = x_;
    movy = y_;
    diametro = 50;

    elx = random(0.001, 0.006);
    ely = random(0.001, 0.005);

    pmask = random(100, 500);
    edad = 1;

    for (int i=0; i < myc.length; i++) {         
      myc[i] = somecolor();
    }

    celulitas = new ArrayList();
  }

  public void mover() {    
    off = off + di;
    movx = movx + elx+movo/8;
    movy = movy + ely+movo/8;

    n = noise(off) * (di * 200);

    di = map(amp_, 65, 80, 0, 0.4);
    di = constrain(di, 0.06, 0.4);

    movo = map(amp_, 65, 80, 0, 0.4);
    movo = constrain(movo, 0, 0.4);

    if (iniciar == false) {
      tamano = constrain(tamano, 1, 1000);
    }
    else {
      tamano = constrain(tamano, -1000, 1000);
    }

    if (centro != true) {
      if (di > 0.07 && di < 0.2) {
        tamano += 5;
        iniciar = true;
      }
      else if (di > 0.2) {
        edad+=3;
      }
      else if (di <= 0.07) {
        tamano--;
      }
    }

    if (centro) {
      x = lerp(x, width/2+random(-65, 65), .09);
      y = lerp(y, height/2+random(-65, 65), .09);
      diametro = lerp(diametro, 20+random(-10, 10), .02);
      co = lerp(co, 150, .02);
    }
    else {
      x = (noise(movx) * 400) + (width/2-200);
      y = (noise(movy) * 400) + (height/2-200);

      if (tamano > 100 && tamano < 300) {
        diametro = lerp(diametro, 60, .1);
      }
      else if (tamano > 300 && tamano < 500) {
        diametro = lerp(diametro, 70, .1);
      }
      else if (tamano > 500) {
        diametro = lerp(diametro, 80, .1);
      }
      else if (tamano < -10 && tamano > -200) {
        diametro = lerp(diametro, 40, .1);
      }
      else if (tamano < -200 && tamano > -500) {
        diametro = lerp(diametro, 25, .1);
      }
      else if (tamano < -500) {
        diametro = lerp(diametro, 10, .1);
      }
    }

    if (total >= 40 && tamano > 100) {
      centro = true;
    }
  }

  public void mostrar() {
    pushStyle();
    noStroke();
    fill(red(myc[0])+co*2, green(myc[0])+co*2, blue(myc[0])+co*2, 210-co/4);
    ellipse(x, y, diametro+n, diametro+n);
    fill(red(myc[1])-co*2, green(myc[1])+co/2, blue(myc[1])+co, 210-co/4);
    ellipse(x-diametro/2, y, diametro/3+n, diametro/3+n);
    fill(red(myc[2])-co*3, green(myc[2])+co/2, blue(myc[2])+co, 210-co/4);
    ellipse(x, y-diametro/2, diametro/3+n, diametro/3+n);
    fill(red(myc[3])-co, green(myc[3])+co/3, blue(myc[3])+co*2, 210-co/4);
    ellipse(x+diametro/2, y, diametro/3+n, diametro/3+n);
    fill(red(myc[4])-co/2, green(myc[4])+co/1.5, blue(myc[4])+co, 210-co/4);
    ellipse(x, y+diametro/2, diametro/3+n, diametro/3+n);
    fill(red(myc[5])-co*3, green(myc[5])+co/2, blue(myc[5])+co, 210-co/4);
    ellipse(x-diametro/3, y-diametro/3, diametro/3+n, diametro/3+n);
    fill(red(myc[6])-co*2, green(myc[6])+co, blue(myc[6])+co, 210-co/4);
    ellipse(x+diametro/3, y+diametro/3, diametro/3+n, diametro/3+n);
    fill(red(myc[7])-co, green(myc[7])+co/3, blue(myc[7])+co*2, 210-co/4);
    ellipse(x-diametro/3, y+diametro/3, diametro/3+n, diametro/3+n);
    fill(red(myc[8])-co*3, green(myc[8])+co/3, blue(myc[8])+co*2, 210-co/4);
    ellipse(x+diametro/3, y-diametro/3, diametro/3+n, diametro/3+n);
    popStyle();

    if (edad % 100 == 0) {
      if (total < 40) {
        celulitas.add(new Cell(movx, movy));
        total++;
      }
    }

    for (int i = celulitas.size()-1; i >= 0; i--) { 
      Cell celuli = (Cell) celulitas.get(i);
      celuli.mover();
      celuli.mostrar();
    }
  }
}


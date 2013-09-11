public color somecolor() {
  return goodcolor[int(random(numpal))];
}

void takecolor(String fn) {
  PImage b;
  b = loadImage(fn);
  image(b,0,0);

  for (int x=0;x<b.width;x++){
    for (int y=0;y<b.height;y++) {
      color c = get(x,y);
      boolean exists = false;
      for (int n=0;n<numpal;n++) {
        if (c==goodcolor[n]) {
          exists = true;
          break;
        }
      }
      if (!exists) {
        if (numpal<maxpal) {
          goodcolor[numpal] = c;
          numpal++;
        }
      }
    }
  }
}

void poligono(float x_, float y_, float r_, float l_) {
  float x = x_;         //Posición X
  float y = y_;         //Posición Y
  float r = r_;         //Radio del polígono
  float l = (int)l_;    //Lados del polígono

  pushMatrix();
  translate(x, y);
  beginShape();
  for (int i = 0; i < l;i++) {
    vertex(r/2 * cos(radians(360 * i / l)), r/2 * sin(radians(360 * i / l)));
  }
  endShape(CLOSE);
  popMatrix();
}

public void resetear() {
  if (celula.tamano < -500 || ebo.n > 20) {
    fade += 3;
  }
  
  if(fade >= 270){
    setup();
  }
}

public void mousePressed() {
  //setup();  //Solo Emergencia
}

public void keyPressed(){
  //exit(); //Solo Emergencia
}


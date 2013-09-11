public class Parasito {
  float r = 10;
  float R = r * 2;

  float x, y, py;
  int dire, num;

  int spd_sign;
  float spd;

  float t, a;
  color ro, g, b;

  boolean ataque, escapa, contar;

  Parasito(int x_, int y_, int dire_) {
    x = x_;
    y = y_;
    py = y_;
    dire = dire_;

    ro = (int)random(180, 250);
    g = (int)random(30, 120);
    b = (int)random(0, 40);

    if (random(1) >= 0.5) {
      spd_sign = -1;
    } 
    else {
      spd_sign = 1;
    }

    spd = random(0, 4.5);
  }

  public void comportamiento() {
    pushStyle();
    pushMatrix();
    noStroke();
    translate(x, y+sin(a)*35);
    rotate(t);
    fill(221, 20, 13, 120);
    poligono(0, 0, (r*2)*3.5, 6);

    for (int i = 0; i < 6; i++) {
      pushMatrix();
      translate(R*cos(radians(360*i/6+90)), R*sin(radians(360*i/6+90)));
      rotate(-t);
      noStroke();
      fill(ro, g, b, 110);
      poligono(0, 0, r*2, 6);
      popMatrix();
    }
    popMatrix();
    popStyle();

    ////////////////////////////MOV////////////////////////////
    
    if(celula.tamano < -500){
      ataque = true;
    }
    
    if (celula.edad % 100 == 0) {
      if (total < 40) {
        contar = true;
      }
    }
    
    if(contar == true){
      num++;
    }else{
      num = 0;
    }
    
    if(num > 0 && num < 150){
      escapa = true;
    }else if(num == 0){
      escapa = false;
    }else if(num > 150){
      contar = false;
    }
    
    println(num);
    
    if (ataque) {
      x = lerp(x, celula.x, .1);
      y = lerp(y, celula.y, .1);
      r = lerp(r, 40, .02);
    }
    else if (escapa) {
      if(y <= 400){
        y = lerp(y, -200, .1);
      }else{
        y = lerp(y, height+200, .1);
      }
    }
    else {
      x += (2 + spd) * dire;
      y = lerp(y, py, .1);
    }

    t += spd_sign * 0.04 * 0.8;

    if (x > width + R + r) {
      x = - R -r;
    }
    if (x < - R - r) {
      x = width + R + r;
    }

    a+=0.05;
  }
}


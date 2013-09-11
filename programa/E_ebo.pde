public class Ebo {
  int x, y;
  float d, f;
  float n;

  Ebo(int x_, int y_) {
    x = x_;
    y = y_;
    d = 500;
    f = 0;
  }

  public void comportamiento() {
    if (d < 120) {
      n += 0.095;
    }

    if (celula.centro) {
      pushStyle();
      fill(20, f);
      ellipse(x, y, d+sin(n)*15, d+sin(n)*15);
      noFill();
      for (int i = 0; i < 20; i++) {
        stroke(180, 200, 240, f-(i*11));
        ellipse(x, y, (d-i)+sin(n)*10, (d-i)+sin(n)*10);
      }
      popStyle();

      d = lerp(d, 110, 0.02);
      f = lerp(f, 110, 0.04);
    }
  }
}


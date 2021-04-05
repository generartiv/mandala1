class Motif {

  int nbDiv;

  MovingVal distAnchor1;
  MovingVal distAnchor2;
  MovingVal distControl1;
  MovingVal distControl2;

  MovingVal angleControl1;
  MovingVal angleControl2;

  Courbe courbes[];

  Motif(int nbD, float distA1, float distA2, float decalAngleInit) {
    nbDiv = nbD;
    float angleStep = TWO_PI / nbDiv;

    courbes = new Courbe[nbDiv*2];
    for (int i=0; i<nbDiv; i++) {
      courbes[i*2] = new Courbe( decalAngleInit + angleStep * i - angleStep/2, decalAngleInit + angleStep * i);
      courbes[i*2 + 1] = new Courbe(decalAngleInit + angleStep * i, decalAngleInit + angleStep * i + angleStep/2);
    }


    distAnchor1 = new MovingVal(distA1, distA1, random(0.2, 0.5));
    distAnchor2 = new MovingVal(distA2, distA2, random(0.2, 0.5));
    distControl1 = new MovingVal(distA1, distA1, random(0.2, 0.5));
    distControl2 = new MovingVal(distA2, distA2, random(0.2, 0.5));

    angleControl1= new MovingVal(angleStep/8, angleStep/4, random(0.2, 0.5));
    angleControl2= new MovingVal(angleStep/8, angleStep/4, random(0.2, 0.5));
  }

  void run() {
    calc();
    display();
  }

  void calc() {
    distAnchor1.calc();
    distAnchor2.calc();
    distControl1.calc();
    distControl2.calc();
    angleControl1.calc();
    angleControl2.calc();
  }

  void display() {


    float coef = distAnchor1.val/2;
    float lum = 100;
    for (int n=0; n<60; n++) {
      lum*=0.9;

      fill(0, 0, lum, 100);
      beginShape();
      strokeWeight(2);

      courbes[0].calc(distAnchor1.val+coef, distAnchor2.val+coef, distControl1.val+coef, distControl2.val+coef, angleControl1.val, angleControl2.val );

      vertex(courbes[0].anchor1.x, courbes[0].anchor1.y);

      for (int i=0; i<nbDiv; i++) {
        courbes[i*2].calc(distAnchor1.val+coef, distAnchor2.val+coef, distControl1.val+coef, distControl2.val+coef, angleControl1.val, angleControl2.val);
        bezierVertex(courbes[i*2].control1.x, courbes[i*2].control1.y, courbes[i*2].control2.x, courbes[i*2].control2.y, courbes[i*2].anchor2.x, courbes[i*2].anchor2.y);
        courbes[i*2+1].calc(distAnchor2.val+coef, distAnchor1.val+coef, distControl2.val+coef, distControl1.val+coef, -angleControl2.val, -angleControl1.val);
        bezierVertex(courbes[i*2+1].control1.x, courbes[i*2+1].control1.y, courbes[i*2+1].control2.x, courbes[i*2+1].control2.y, courbes[i*2+1].anchor2.x, courbes[i*2+1].anchor2.y);
      }

      endShape();
      coef*=0.95;
    }
  }
}
class Courbe {

  PVector anchor1 = new PVector(0, 0);
  PVector anchor2 = new PVector(0, 0);

  PVector control1 = new PVector(0, 0);
  PVector control2 = new PVector(0, 0);

  float ang1;
  float ang2;

  Courbe(float a1, float a2) {
    ang1 = a1;
    ang2 = a2;
  }

  void calc(float distAnchor1, float distAnchor2, float distControl1, float distControl2, float angleControl1,float angleControl2) {
    anchor1.x = cos(ang1) * distAnchor1 + width/2;
    anchor1.y = sin(ang1) * distAnchor1 + height/2;

    anchor2.x = cos(ang2) * distAnchor2 + width/2;
    anchor2.y = sin(ang2) * distAnchor2 + height/2;

    control1.x = cos(ang1+angleControl1) * distControl1 + width/2;
    control1.y = sin(ang1+angleControl1) * distControl1 + height/2;

    control2.x = cos(ang2+angleControl2) * distControl2 + width/2;
    control2.y = sin(ang2+angleControl2) * distControl2 + height/2;
  }
}
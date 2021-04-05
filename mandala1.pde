
Motif motifs[];



float a = 0;

void setup() {
  size(1280, 720);

  motifs = new Motif[6];
  float size = height/3;
  motifs[0] = new Motif(8, size, size*0.1, 0);
  size*=0.7;
  motifs[1] = new Motif(8, size, size*0.2, (TWO_PI/8)*0.5);
  size*=0.7;
  motifs[2] = new Motif(8, size, size*0.4, 0);
  size*=0.7;
  motifs[3] = new Motif(8, size, size*0.7, (TWO_PI/8)*0.5);
  size*=0.7;
  motifs[4] = new Motif(8, size, size*1.0, 0);
  size*=0.6;
  motifs[5] = new Motif(8, size, size*1.5, (TWO_PI/8)*0.5);

  a = random(TWO_PI);

  colorMode(HSB, 100);
  noStroke();
}


void draw() {

  background(100, 0, 0);

  a+=0.05;

  for (int i=0; i<6; i++) {
    motifs[i].run();
  }


  //saveFrame("/frames/frame-######.jpg");
}
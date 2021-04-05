class MovingVal {

  float val = 0;
  float midVal = 0;
  float echelleVariation = 0;
  float vitesseVariation = 0.1;
  float decalNoise = 0;

  MovingVal(float mV, float eV, float vV) {
    midVal = mV;
    echelleVariation = eV;
    vitesseVariation = vV;
    decalNoise = random(100000);
  }

  void calc() {
    val = midVal + (cos(a * vitesseVariation + decalNoise) +0.5)*0.5 * echelleVariation;
  }
}
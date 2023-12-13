
ComplexNumber EtaFunction(ComplexNumber s){
  ComplexNumber sum = new ComplexNumber(0, 0);
  for(int i = 1; i <= 50000; i++){
    sum = Add(sum, Mult(pow(-1, i + 1), Pow(i, Mult(-1.0, s))));
  }
  return Mult(Pow(Sub(1, Pow(2, Sub(1, s))), -1), sum);
}

ComplexNumber Function(ComplexNumber s){
  return EtaFunction(s);
}

void setup(){
  size(1200, 1200);
  background(30);
  
  strokeWeight(2);
  stroke(255);
  line(width / 2, 0, width / 2, height);
  line(0, height / 2, width, height / 2);
}

PVector lastStep = new PVector(-1.46035, 0);
void draw(){
  if(frameCount < 60.0)
    return;
  
  ComplexNumber s = new ComplexNumber(0.5, (frameCount - 60) / 30.0);
  ComplexNumber output = Function(s);
  
  pushMatrix();
  translate(width / 2, height / 2);
  if(lastStep != null){
    float multiplier = 130;
    println(output.a + ", " + output.b);
    println(lastStep.x + ".." + lastStep.y);
    
    stroke(lerpColor(color(200, 255, 100), color(200, 80, 100), Modulus(output) * 0.5));
    strokeWeight(5);
    line(output.a * multiplier, output.b * multiplier, lastStep.x * multiplier, lastStep.y * multiplier);
  }
  popMatrix();
  
  saveFrame("output/gif-"+nf(frameCount, 4)+".png");
  
  lastStep = new PVector(output.a, output.b);
}

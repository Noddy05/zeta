
class ComplexNumber{
  float a, b;
  ComplexNumber(float a, float b){
    this.a = a;
    this.b = b;
  }
  
  
}
float Modulus(ComplexNumber z){
  return sqrt(z.a * z.a + z.b * z.b);
}

ComplexNumber Mult(float a, ComplexNumber b){
  return new ComplexNumber(a * b.a, a * b.b);
}
ComplexNumber Mult(ComplexNumber a, ComplexNumber b){
  float rA = sqrt(a.a * a.a + a.b * a.b);
  float thetaA = atan2(a.b, a.a);
  
  float rB = sqrt(b.a * b.a + b.b * b.b);
  float thetaB = atan2(b.b, b.a);
  return Mult(rA * rB, new ComplexNumber(cos(thetaA + thetaB), sin(thetaA + thetaB)));
}
ComplexNumber Div(ComplexNumber a, ComplexNumber b){
  float rA = sqrt(a.a * a.a + a.b * a.b);
  float thetaA = atan2(a.b, a.a);
  
  float rB = sqrt(b.a * b.a + b.b * b.b);
  float thetaB = atan2(b.b, b.a);
  return Mult(rA / rB, new ComplexNumber(cos(thetaA - thetaB), sin(thetaA - thetaB)));
}
  
ComplexNumber Add(float a, ComplexNumber b){
  return new ComplexNumber(a + b.a, b.b);
}
ComplexNumber Sub(float a, ComplexNumber b){
  return new ComplexNumber(a - b.a, b.b);
}

ComplexNumber Add(ComplexNumber a, ComplexNumber b){
  return new ComplexNumber(a.a + b.a, a.b + b.b);
}
ComplexNumber Sub(ComplexNumber a, ComplexNumber b){
  return new ComplexNumber(a.a - b.a, a.b - b.b);
}

float e = 2.718281828;
ComplexNumber EPow(ComplexNumber a){
  return Mult(pow(e, a.a), new ComplexNumber(cos(a.b), sin(a.b)));
}
ComplexNumber Cos(ComplexNumber z){
  return Mult(0.5, Add(EPow(z), EPow(Mult(-1, z))));
}

ComplexNumber Pow(ComplexNumber a, float b){
  float r = sqrt(a.a * a.a + a.b * a.b);
  float theta = atan2(a.b, a.a);
  
  return Mult(pow(r, b), new ComplexNumber(cos(theta * b), sin(theta * b)));
}

ComplexNumber Pow(float a, ComplexNumber b){
  return Mult(pow(a, b.a), new ComplexNumber(cos(log(a) * b.b), sin(log(a) * b.b)));
}

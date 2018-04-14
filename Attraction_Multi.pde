import processing.sound.*;
import ddf.minim.*;

SoundFile file;
Amplitude amp;

int num = 250;
int transparency = 100;
int stroke = 1;
int transparencyBk = 25;
Minim gestor;
AudioPlayer musica_fondo;

Group1 [] objects1 = new Group1[num];
Group2 [] objects2 = new Group2[num];
Group3 [] objects3 = new Group3[num];
Group4 [] objects4 = new Group4[num];
//Snake  [] snake = new Snake[10];

float vel_limit_m = 14;
float vel_limit = 7;
float dir_mag_m = 0.8;
float dir_mag = 0.6;

PVector home1 = new PVector(265,100);
PVector home2 = new PVector(1015,100);
PVector home3 = new PVector(265,650);
PVector home4 = new PVector(1015,650);

PVector target1 = new PVector(0,0);
PVector target2 = new PVector(0,0);
PVector target3 = new PVector(0,0);
PVector target4 = new PVector(0,0);

int thresh = 0;

void setup(){
  for(int i = 0; i<num;i++){
    objects1[i] = new Group1();
    objects2[i] = new Group2();
    objects3[i] = new Group3();
    objects4[i] = new Group4();
  }
  size(1280,750,P2D);
  background(55);
  file = new SoundFile(this,"tnt.mp3");
  delay(1000);
  file.play();
  amp = new Amplitude(this);
  amp.input(file);
  gestor = new Minim(this);
  //Codigo para que el sonido salga estereo y no mono (faltan correcciones)
  //musica_fondo = gestor.loadFile("tnt.mp3");
  //musica_fondo.setGain(-5);
  //delay(250);
  //musica_fondo.play();
  
}

void draw(){
  //background(255);
  fill(255,transparencyBk);
  dir_mag = amp.analyze();
  println(amp.analyze());
  rect(0,0,width,height);
  if((amp.analyze())>0.4){
    thresh = 1;
    println("TRUE");
  }
  else{
      thresh = 0;
      println("FALSE");
  }
  for(int i = 0; i<num; i++){
    objects1[i].Response(thresh);
    objects1[i].Update();
    objects1[i].Display(stroke);
    //objects1[i].Bounce();
    
    objects2[i].Response(thresh);
    objects2[i].Update();
    objects2[i].Display(stroke);
    //objects2[i].Bounce();
    
    objects3[i].Response(thresh);
    objects3[i].Update();
    objects3[i].Display(stroke);
    //objects3[i].Bounce();
    
    objects4[i].Response(thresh);
    objects4[i].Update();
    objects4[i].Display(stroke);
    //objects4[i].Bounce();
  }
}

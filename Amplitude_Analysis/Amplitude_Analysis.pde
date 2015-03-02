// NOTE: First time only when running this code, need to:
// 1. Go to Sketch menu.
// 2. Choose Import Library.
// 3. Choose Add Library.
// 4. Search for 'Sound' library, and install, then restart Processing.

// Load the sound library
import processing.sound.*;

// Object to read the sound file
SoundFile file;
float red =100;
float green =100;
float blue =100;
float redc=random(10);
float greenc=random(10);
float bluec=random(10);
float rflip = 1;
float gflip = 1;
float bflip = 1;
// Object to analyze the sound file
Amplitude amp;

// Variable to store amplitude of current sample from audio file
float currentAmplitude = 0;
float previousAmp=0;
int xmove = 0;
void setup() {

  // Canvas characteristics
  size(1280, 800);
  background(0); // black
  // Load a soundfile from the /data folder of the sketch and play it back
  file = new SoundFile(this, "suprise.mp3");
  file.play();

  // Create an Amplitude analyzer
  amp = new Amplitude(this);
  // Set the sound file as input to the analyzer
  amp.input(file);
}      

void draw() {

  float redc=random(5);
  float greenc=random(5);
  float bluec=random(5);

  // Erase whatever was drawn last time the draw() function looped
  noStroke();
  fill(0, 10); // black
  rect(0, 0, width, height);

  // Get the current amplitude from the analyzer
  // Will always return a float value between 0 and 1
  currentAmplitude = amp.analyze();

  // Print the raw output of the analysis to the console
  println(currentAmplitude);

  xmove=xmove+2;
  if (xmove>width) {
    fill(0);
    rect(0, 0, width, height);
    xmove = 0;
  }
  red = red + (redc * rflip);
  if (red > 255||red < 0) {
    rflip = rflip * -1;
  }

  green = green + (greenc * gflip);
  if (green > 255||green < 0) {
    gflip = gflip * -1;
  }

  blue = blue + (bluec * bflip);
  if (blue > 255||blue < 0) {
    bflip = bflip * -1;
  }

  // Use the amplitude value to draw a circle in centre of screen
  // Maximum diameter of 500 pixels (when currentAmplitude is 1)
  fill(red, green, blue, 1);
  stroke(red, green, blue); // white
  //ellipse(width/2, height/2, currentAmplitude * 500, currentAmplitude * 500);
  rect(xmove, height-currentAmplitude * 2000, 2, 5000);
  stroke(255);
  line(xmove, height-currentAmplitude * 2000 - 10, xmove-1, height-previousAmp*2000 - 10);
  previousAmp = amp.analyze();
  fill(0);
  noStroke();
  rect(0, 0, 250, 20);
  fill(255);
  textAlign(LEFT);
  text("Amplitude: " + currentAmplitude, 0, 10);
  textAlign(RIGHT);
  text("Brendan Leder", width, height);
}

void keyPressed() {
 if (key=='a') {
 }
}

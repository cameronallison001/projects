color[] palette = {
 (#ff80ed),
 (#a4a0e6),
 (#293065),
 (#ff82ab),
 (#17badd),
 (#a03b49)
};

//^^^color palette
//variables used in code and bloom class
class Bloom {
  float x;
  float y; 
  color c;
  //int size;
  int maxSize = 400;
  int maxCycles = 15;
  float vol = 0;
  int size = 0; 
  int cycles = 0; 
  SoundFile sound;
  Audio audio;

  Bloom(float x, float y, Audio audio) {
    this.x = x;
    this.y = y;
    this.audio = audio;
    int index = floor(random(palette.length)); //random coloring of blooms
    c = palette[index];
    int numSamples = audio.samples();
    int sampleIndex = floor(random(numSamples));
    sound = audio.makeSound(sampleIndex);
    
    sound.amp(0.8);
    sound.play();

    
    
  }
  
  
  void update() { 
    if (cycles < maxCycles) {
      size++; 
      
    if (size > maxSize) {
    size = 0; // reset 
      cycles += 1;
     
        //if (cycles < maxCycles) {
          vol = map(cycles, 0, maxCycles - 1, 0.8, 0.1);
          sound.stop();
          sound.play();

          sound.amp(vol);
       
        }
      }
  }
 
  void display() {
    //the transparency settings for the blooms as they grow
    if (cycles < maxCycles) {
    float maxTransparency = map(cycles, 0, maxCycles, 255, 100);
    float transparency = map(size, 0, 400, maxTransparency, 0); 
    
    fill(c, transparency); //calling to random color and transparency 
    noStroke();
    ellipse(this.x, this.y, size, size); // the actual bloom
     }
  }

  boolean isZombie() {
    return cycles >= maxCycles;
  }
}

import processing.sound.*;

//declares objects
Bloom bloom;
Audio audio;

ArrayList<Bloom> blooms = new ArrayList<Bloom>(); //bloom objs

//setup function
  void setup(){ 
    size(1000, 800); //screen size
    audio = new Audio(this); //audio input
    colorMode(HSB); //hues saturation brightness
  }
  
  void draw() {
    //background(#01005c); //background color
    //background (0);
    drawGradient(); //calls to gradient function to make the background
    //if (bloom != null) { //bloom is null, so keeps code going
    //  bloom.update(); // calling update function
    //  bloom.display(); //calling display function 
    
    
    //loop
    for (int i = blooms.size()-1; i >= 0; i--){
      Bloom bloom = blooms.get(i);
      bloom.update();
      bloom.display();
      
      if (bloom.isZombie()) { //remove bloom when cycle over
        blooms.remove(i);
      }
    }
       if (random(0, 5.0) < .006) { //random blooms
        makeBloom(random(width), random(height));
  }
    }
    
  void makeBloom(float x, float y) { //new bloom
     Bloom bloom = new Bloom(x, y, audio);
     blooms.add(bloom);
   }
  void mousePressed () {
    makeBloom(mouseX, mouseY); //mouse pressed create bloom
  } 
  
void drawGradient() { //the gradient function 
  //stroke(#007777, #005555, #003333);
  colorMode(HSB, 360, 100, 100);
  float startHue = 180;
  float startSaturation = 100;
  float startBrightness = 50;
  float endBrightness = 20;
  
 for(int y = 0; y < height; y++){
 
  float brightness = map(y, 0, height, startBrightness, endBrightness);
  int c = color(startHue, startSaturation, brightness);
  stroke(c);
  line(0, y, width, y);
 } 
}
//  void update() {
//size = size + 1;
//    if (size > maxSize) {
//  size = 0;
//      cycle++;
//    }
//  }
  
//  void display () {
//    if (cycle < 15) {
      
//      float transparency = map(bloomsize, 0, maxSize, 255, 0);
//      fill(255);
//      fill(c, transparency);
//      circle(x, y, size);
//    }
//  }
  
    

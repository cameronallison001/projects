import processing.sound.*;

class Audio {
  String fileName[] = {"A4.mp3", "A5.mp3", "C4.mp3", "C5.mp3", "D4.mp3", "D5.mp3", "E4.mp3", "E5.mp3", "G4.mp3", "G5.mp3"};
  SoundFile samples[] = new SoundFile[fileName.length];
  PApplet parent;
  
  Audio(PApplet parent) {
    this.parent = parent;
    for (int i = 0; i < fileName.length; i++) {
      samples[i] = new SoundFile(parent, fileName[i], true);   // cache for quicker start
    }
  }

  int samples() {
    return fileName.length;
  }
  
  SoundFile makeSound(int num) {
    return new SoundFile(parent, fileName[num], true);
  }
}

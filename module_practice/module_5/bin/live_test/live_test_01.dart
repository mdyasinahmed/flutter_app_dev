// The Main Class
void main() {
  // Creating instances of Media and Song
  Media media = Media();
  Song song = Song("Tahsan Khan");

  // Calling play methods
  media.play();
  song.play();
}

// Media Class
class Media {
  // Method to play media
  void play() {
    print("Playing media...");
  }
}

// Song Class which Extends Media Class
class Song extends Media {
  // Additional attribute for artist
  String artist;

  // Constructor to initialize artist
  Song(this.artist);

  // Overriding the play method
  @override
  void play() {
    print("Playing song by $artist...");
  }
}

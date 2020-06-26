class Video {
  String id;
  String title;
  String image;
  String category;

  Video(String id, String title, String image, {String category = 'Python'}) {
    this.id = id;
    this.title = title;
    this.image = image;
    this.category = category;
  }
}

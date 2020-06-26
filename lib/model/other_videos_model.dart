class OtherVideos {
  String id;
  String title;
  String image;
  String category;

  OtherVideos(String id, String title, String image,
      {String category = 'Python'}) {
    this.id = id;
    this.title = title;
    this.image = image;
    this.category = category;
  }

  OtherVideos.fromJsonMap(Map<String, dynamic> map)
      : id = map["id"],
        title = map["title"],
        category = map["category"],
        image = map["image"];
}

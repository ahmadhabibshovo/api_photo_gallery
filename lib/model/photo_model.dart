class Photo {
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo(this.id, this.title, this.url, this.thumbnailUrl);

  // Parse JSON (example without error handling)
  static Photo fromJson(Map<String, dynamic> json) {
    return Photo(json['id'], json['title'], json['url'], json['thumbnailUrl']);
  }
}

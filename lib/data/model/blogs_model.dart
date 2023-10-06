
class Blogs{
  String? _id;
  String? _imageUrl;
  String? _title;

  Blogs({String? id, String? imageUrl, String? title}) {
    if (id != null) {
      _id = id;
    }
    if (imageUrl != null) {
      _imageUrl = imageUrl;
    }
    if (title != null) {
      _title = title;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get imageUrl => _imageUrl;
  set imageUrl(String? imageUrl) => _imageUrl = imageUrl;
  String? get title => _title;
  set title(String? title) => _title = title;

  Blogs.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _imageUrl = json['image_url'];
    _title = json['title'];
  }
}

import 'ImageNews.dart';

class News {

    String? datacreate;
    String? description;
    int? id;
    String? imagepath;
    String? title;
    List<ImageNews>? imagenews;

    News({this.datacreate, this.description, this.id, this.imagepath, this.title, this.imagenews});

    factory News.fromJson(Map<String, dynamic> json) {
        return News(
            datacreate: json['datacreate'],
            description: json['description'], 
            id: json['id'], 
            imagepath: json['imagepath'], 
            title: json['title'],
            imagenews: json['imageNewsList'] != null ? (json['imageNewsList'] as List).map((i) => ImageNews.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['datacreate'] = this.datacreate;
        data['description'] = this.description;
        data['id'] = this.id;
        data['imagepath'] = this.imagepath;
        data['title'] = this.title;
        data['imageNewsList'] = this.imagenews;
        return data;
    }
}
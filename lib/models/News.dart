class News {

    String? datacreate;
    String? description;
    int? id;
    String? imagepath;
    String? title;

    News({this.datacreate, this.description, this.id, this.imagepath, this.title});

    factory News.fromJson(Map<String, dynamic> json) {
        return News(
            datacreate: json['datacreate'],
            description: json['description'], 
            id: json['id'], 
            imagepath: json['imagepath'], 
            title: json['title'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['datacreate'] = this.datacreate;
        data['description'] = this.description;
        data['id'] = this.id;
        data['imagepath'] = this.imagepath;
        data['title'] = this.title;
        return data;
    }
}
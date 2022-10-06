


class ImageData {
    String? datacreate;
    int? id;
    String? imagepath;
    String? name;
    bool? web;

    ImageData({this.datacreate, this.id, this.imagepath, this.name, this.web});

    factory ImageData.fromJson(Map<String, dynamic> json) {
        return ImageData(
            datacreate: json['datacreate'], 
            id: json['id'], 
            imagepath: json['imagepath'], 
            name: json['name'], 
            web: json['web'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['datacreate'] = this.datacreate;
        data['id'] = this.id;
        data['imagepath'] = this.imagepath;
        data['name'] = this.name;
        data['web'] = this.web;
        return data;
    }
}
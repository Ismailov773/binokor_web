import 'ImageDom.dart';

class Dom {
    int? id;
    List<ImageDom>? imageDataList;
    String? name;

    Dom({this.id, this.imageDataList, this.name});

    factory Dom.fromJson(Map<String, dynamic> json) {
        return Dom(
            id: json['id'], 
            imageDataList: json['imageDataList'] != null ? (json['imageDataList'] as List).map((i) => ImageDom.fromJson(i)).toList() : null,
            name: json['name'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['name'] = this.name;
        if (this.imageDataList != null) {
            data['imageDataList'] = this.imageDataList!.map((v) => v.toJson()).toList();
        }
        return data;
    }
}
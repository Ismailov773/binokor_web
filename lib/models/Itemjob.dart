

class ItemJob {
    String? description;
    int? id;
    bool? title;

    ItemJob({this.description, this.id, this.title});

    factory ItemJob.fromJson(Map<String, dynamic> json) {
        return ItemJob(
            description: json['description'], 
            id: json['id'], 
            title: json['title'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['description'] = this.description;
        data['id'] = this.id;
        data['title'] = this.title;
        return data;
    }
}
class Kompleks {

    String? customer;
    String? dateproject;
    String? description;
    int? id;
    String? statusbuilding;
    String? title;
    String? typehouse;
    String? mainimagepath;


    Kompleks({this.customer,
        this.dateproject,
        this.description,
        this.id,
        this.statusbuilding,
        this.title,
        this.typehouse,
    this.mainimagepath});

    factory Kompleks.fromJson(Map<String, dynamic> json) {
        return Kompleks(
            customer: json['customer'],
            dateproject: json['dateproject'], 
            description: json['description'], 
            id: json['id'], 
            statusbuilding: json['statusbuilding'], 
            title: json['title'], 
            typehouse: json['typehouse'],
            mainimagepath: json['mainimagepath'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['customer'] = this.customer;
        data['dateproject'] = this.dateproject;
        data['description'] = this.description;
        data['id'] = this.id;
        data['statusbuilding'] = this.statusbuilding;
        data['title'] = this.title;
        data['typehouse'] = this.typehouse;
        data['mainimagepath'] = this.mainimagepath;
        return data;
    }
}
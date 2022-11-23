import 'Orderb.dart';

class LightUser {
    String? adress;
    int? id;
    String? name;
    List<Orderb>? orderList;
    String? phone;

    LightUser({this.adress, this.id, this.name, this.orderList, this.phone});

    factory LightUser.fromJson(Map<String, dynamic> json) {
        return LightUser(
            adress: json['adress'], 
            id: json['id'], 
            name: json['name'],
            orderList: json['orderList'] != null ? (json['orderList'] as List).map((i) => Orderb.fromJson(i)).toList() : null,
            phone: json['phone'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['adress'] = this.adress;
        data['id'] = this.id;
        data['name'] = this.name;
        data['phone'] = this.phone;
        if (this.orderList != null) {
            data['orderList'] = this.orderList!.map((v) => v.toJson()).toList();
        }
        return data;
    }
}
import 'Make.dart';

class Orderb {
    String? concrete;
    int? count;
    String? heigth;
     int? id;
    String? length;
    Make? make;
    String? mass;
    String? name;
    String? volume;
    String? weigth;

    Orderb({this.id, this.concrete, this.count, this.heigth, this.length, this.make, this.mass, this.name, this.volume, this.weigth});

    factory Orderb.fromJson(Map<String, dynamic> json) {
        return Orderb(
            concrete: json['concrete'],
            count: json['count'], 
            heigth: json['heigth'],
             id: json['id'],
            length: json['length'], 
            make: json['make'] != null ? Make.fromJson(json['make']) : null, 
            mass: json['mass'], 
            name: json['name'], 
            volume: json['volume'],
            weigth: json['weigth'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['concrete'] = this.concrete;
        data['count'] = this.count;
        data['heigth'] = this.heigth;
         data['id'] = this.id;
        data['length'] = this.length;
        data['mass'] = this.mass;
        data['name'] = this.name;
        data['volume'] = this.volume;
        data['weigth'] = this.weigth;
        if (this.make != null) {
            data['make'] = this.make!.toJson();
        }
        return data;
    }
}
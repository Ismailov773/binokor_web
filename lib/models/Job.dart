import 'Itemjob.dart';

class Job {
  String? department;
  int? id;
  List<ItemJob>? joblist;
  String? vacancy;

  Job({this.department, this.id, this.joblist, this.vacancy});

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      department: json['department'],
      id: json['id'],
      joblist: json['joblist'] != null
          ? (json['joblist'] as List).map((i) => ItemJob.fromJson(i)).toList()
          : null,
      vacancy: json['vacancy'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['department'] = this.department;
    data['id'] = this.id;
    data['vacancy'] = this.vacancy;
    if (this.joblist != null) {
      data['joblist'] = this.joblist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

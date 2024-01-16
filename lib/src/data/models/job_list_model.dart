import 'package:aureus_group/src/data/models/job_model.dart';

class JobListModel {
  List<JobModel>? data;

  JobListModel({this.data});

  JobListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <JobModel>[];
      json['data'].forEach((v) {
        data!.add( JobModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

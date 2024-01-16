
class JobModel {
  String? address;
  String? dueDate;
  int? id;
  String? image;
  bool? isApplied;
  String? jobDesc;
  String? jobTitle;
  int? maxSalary;
  int? minSalary;
  String? name;
  String? requirements;

  JobModel(
      {this.address,
      this.dueDate,
      this.id,
      this.image,
      this.isApplied,
      this.jobDesc,
      this.jobTitle,
      this.maxSalary,
      this.minSalary,
      this.name,
      this.requirements});

  JobModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    dueDate = json['due_date'];
    id = json['id'];
    image = json['image'];
    isApplied = json['is_applied'];
    jobDesc = json['job_desc'];
    jobTitle = json['job_title'];
    maxSalary = json['max_salary'];
    minSalary = json['min_salary'];
    name = json['name'];
    requirements = json['requirements'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['due_date'] = dueDate;
    data['id'] = id;
    data['image'] = image;
    data['is_applied'] = isApplied;
    data['job_desc'] = jobDesc;
    data['job_title'] = jobTitle;
    data['max_salary'] = maxSalary;
    data['min_salary'] = minSalary;
    data['name'] = name;
    data['requirements'] = requirements;
    return data;
  }
}
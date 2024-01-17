class UserModel {
  String? email;
  String? imageLink;
  String? name;
  String? phone;

  UserModel({this.email, this.imageLink, this.name, this.phone});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    imageLink = json['image_link'];
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['image_link'] = imageLink;
    data['name'] = name;
    data['phone'] = phone;
    return data;
  }
}
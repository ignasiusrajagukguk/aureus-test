import 'dart:convert';
import 'package:aureus_group/src/common/util/logger.dart';
import 'package:aureus_group/src/data/models/user.dart';
import 'package:http/http.dart' as http;

class ProfileRepository {
  Future<UserModel> getProfileData(String email) async {
    List<UserModel> userModel = <UserModel>[];
    final response = await http.get(
      Uri.parse(
          'https://job-portal-36fdd-default-rtdb.asia-southeast1.firebasedatabase.app/users.json'),
      headers: {},
    );
    Log.colorGreen('profile :${response.body}');
    var datadecode = jsonDecode(response.body) as Map<String,dynamic>;
    datadecode.forEach((key, value) {
userModel.add(UserModel.fromJson(value));
    });
    Iterable<UserModel> filterList = userModel.where((element) => element.email==email);
    return filterList.first;
  }
}

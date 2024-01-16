import 'dart:convert';
import 'package:aureus_group/src/common/util/logger.dart';
import 'package:aureus_group/src/data/models/login_response.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  Future<LoginResponseModel> signIn({required String email, required String password}) async {
    final response = await http.post(
      Uri.parse(
          'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyA_cHI1vOu3Q1oViVJEhQ9oRhkVYmgG9Jk'),
  
      body: json.encode({
        "email": email,
        "password":password,
        "returnSecureToken":true,
      })
    );
    // var data = jsonDecode(response.body);
    Log.colorGreen('Login Status :${response.body}');
    return LoginResponseModel.fromJson(jsonDecode(response.body));
  }


  Future<LoginResponseModel>  signUp({required String email, required String password}) async {
    final response = await http.post(
      Uri.parse(
          'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyA_cHI1vOu3Q1oViVJEhQ9oRhkVYmgG9Jk'),
  
      body: json.encode({
        "email": email,
        "password":password,
        "returnSecureToken":true,
      })
    );
    // var data = jsonDecode(response.body);
    Log.colorGreen('Login Status :${response.body}');
    return LoginResponseModel.fromJson(jsonDecode(response.body));
  }
}

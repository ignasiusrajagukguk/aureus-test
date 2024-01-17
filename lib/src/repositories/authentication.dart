import 'dart:convert';
import 'dart:io';
import 'package:aureus_group/src/common/util/logger.dart';
import 'package:aureus_group/src/data/models/login_response.dart';
import 'package:aureus_group/src/data/models/sign_up_response.dart';
import 'package:camera/camera.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  Future<LoginResponseModel> signIn(
      {required String email, required String password}) async {
    final response = await http.post(
        Uri.parse(
            'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyA_cHI1vOu3Q1oViVJEhQ9oRhkVYmgG9Jk'),
        body: json.encode({
          "email": email,
          "password": password,
          "returnSecureToken": true,
        }));
    // var data = jsonDecode(response.body);
    Log.colorGreen('Login Status :${response.body}');
    return LoginResponseModel.fromJson(jsonDecode(response.body));
  }

  Future<SignUpResponse> signUp(
      {required String email, required String password}) async {
    final response = await http.post(
        Uri.parse(
            'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyA_cHI1vOu3Q1oViVJEhQ9oRhkVYmgG9Jk'),
        body: json.encode({
          "email": email,
          "password": password,
          "returnSecureToken": true,
        }));
    // var data = jsonDecode(response.body);
    Log.colorGreen('Sign Up Status :${response.body}');
    return SignUpResponse.fromJson(jsonDecode(response.body));
  }

  Future<String> uploadImage({required XFile file}) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    var myRef = storage.ref('images');
    myRef.child(file.name).putFile(File(file.path));
    String url = await myRef.getDownloadURL();
    Log.info('URL: $url');
    return url;
  }

  Future<void> postUserData(
      {required String email,
      required String imageLink,
      required String name,
      required String phone}) async {
    final response = await http.post(
        Uri.parse(
            'https://job-portal-36fdd-default-rtdb.asia-southeast1.firebasedatabase.app/users.json'),
        body: json.encode({
          "email": email,
          "image_link": imageLink,
          "name": name,
          "phone": phone,
        }));
    Log.colorGreen('Post User Data Status :${response.body}');
  }
}

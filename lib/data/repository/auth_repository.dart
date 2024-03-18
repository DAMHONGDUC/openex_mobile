import 'dart:async';
import 'dart:convert';
import 'package:openex_mobile/core/network/dio/dio_service.dart';
import 'package:openex_mobile/core/network/end_points.dart';
import 'package:openex_mobile/data/models/user_model.dart';

class AuthRepository {
  Future<User?> login(String username, String password) async {
    Map<String, dynamic> requestData = {
      "username": username,
      "password": password
    };
    final response = await DioService.post(Endpoints.LOGIN, requestData);

    if (response?.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.toString());

      return User.fromJson(data);
    }

    return null;
  }
}

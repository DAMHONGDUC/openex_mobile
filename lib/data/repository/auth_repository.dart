import 'dart:async';
import 'package:openex_mobile/config/network/dio_service.dart';

class AuthRepository {
  Future<String?> login(String url, String username, String password) async {
    Map<String, dynamic> requestData = {
      "username": username,
      "password": password
    };
    final response = await DioService.post(url, requestData);
    return null;
  }
}

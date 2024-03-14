import 'dart:async';
import 'package:openex_mobile/config/network/dio_service.dart';

class AuthRepository {
  Future<String?> login(String url) async {
    final response = await DioService.get(url);
    return null;
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_attendance/pages/profile/bloc/profile_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/anggota_model.dart';
import 'endpoint.dart';

class ApiService {
  final _dio = Dio();
  String token = '';

  Future _loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = (prefs.getString('token_sanctum') ?? '');
    return token;
  }

  Future<AnggotaDataResponse> getDataAnggota() async {
    String baseUrl = "https://attendance.putraprima.id/api/anggota-detail/";
    final token = await _loadToken();
    final _response = await _dio.get(Endpoint.getDataAnggota,
        options: Options(headers: {"authorization": "Bearer $token"}));
    print(token);
    return AnggotaDataResponse.fromJson(jsonDecode(_response.data));
  }
}

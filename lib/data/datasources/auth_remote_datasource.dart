import 'dart:convert';
import 'package:avis_pos/core/constants/variables.dart';
import 'package:avis_pos/data/model/payloads/login_payload.dart';
import 'package:avis_pos/data/model/responses/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class IAuthRemoteDataSource {
  Future<UserModel> login(LoginPayload payload);
  Future<void> logout();
  Future<UserModel> getProfile();
}

class AuthRemoteDataSourceImpl implements IAuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImpl({required this.client});

  Future<Map<String, String>> _getHeaders() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  @override
  Future<UserModel> login(LoginPayload payload) async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}auth/login',
    );
    try {
      final response = await client.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode(payload.toJson()),
      );

      final body = json.decode(response.body);

      if (response.statusCode == 200) {
        final token = body['token'];

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', token);

        final userData = body['user'] as Map<String, dynamic>;
        userData['token'] = token;

        return UserModel.fromJson(userData);
      } else {
        if (response.statusCode == 422 && body['errors'] != null) {
          final errors = body['errors'] as Map<String, dynamic>;
          final firstError = errors.values.first[0];
          throw Exception(firstError);
        }
        throw Exception(body['message'] ?? 'Login gagal');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  @override
  Future<void> logout() async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}auth/logout',
    );
    try {
      final response = await client.post(url, headers: await _getHeaders());

      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('auth_token');

      if (response.statusCode != 200) {
        final body = json.decode(response.body);
        throw Exception(body['message'] ?? 'Logout gagal di server');
      }
    } catch (e) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('auth_token');
      throw Exception('Error: $e');
    }
  }

  @override
  Future<UserModel> getProfile() async {
    final url = Uri.parse('${Variables.baseUrl}${Variables.apiVersion}auth/me');
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token') ?? '';

      final response = await client.get(url, headers: await _getHeaders());
      final body = json.decode(response.body);

      if (response.statusCode == 200) {
        final userData = body['data'] ?? body;
        userData['token'] = token;
        return UserModel.fromJson(userData);
      } else {
        throw Exception(body['message'] ?? 'Gagal mengambil profil');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

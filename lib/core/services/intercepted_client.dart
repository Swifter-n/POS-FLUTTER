import 'dart:async';
import 'dart:io';
import 'package:avis_pos/core/services/navigation_service.dart';
import 'package:avis_pos/presentation/settings/pages/server_error_page.dart';
import 'package:http/http.dart' as http;

class InterceptedClient extends http.BaseClient {
  final http.Client _inner = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    try {
      final response = await _inner.send(request);
      if (response.statusCode == 500) {
        NavigationService.push(const ServerErrorPage());
      }
      return response;
    } on SocketException {
      rethrow;
    }
  }
}

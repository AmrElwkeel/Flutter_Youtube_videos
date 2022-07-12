import '../base/api_base.dart';

class AuthRepo {
  final String _apiKey = "/api/login";
  final ApiBase _apiBase = ApiBase();

  Future<dynamic> login(String? email, String? password) async {
    final response = await _apiBase
        .postLogin(_apiKey, {"email": email, "password": password});
    return response;
  }
}

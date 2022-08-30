import 'package:flutter_videos/src/model/user.dart';

import '../base/api_base.dart';

class RepositoryFetchData {
  final String _key = "/api/users?page=2";
  final ApiBase _apiBase = ApiBase();
  Future<List<User>> FetchUsers() async {
    final response = await _apiBase.getData(_key);
    List<User> user =
        (response as List).map((data) => User.fromJson(data)).toList();
    return user;
  }
}

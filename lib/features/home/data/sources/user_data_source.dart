import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_app/core/api/api_services.dart';

import '../models/user.dart';

abstract class UserDataSource {
  Future<List<User>> fetchUser();
}

final userDataSourceProvider = Provider<UserDataSource>((ref) {
  return UserDataSourceImpl(ref.watch(apiServiceProvider));
});

class UserDataSourceImpl extends UserDataSource {
  final ApiService _apiService;

  UserDataSourceImpl(this._apiService);
  @override
  Future<List<User>> fetchUser() async {
    final result = await _apiService.getData(endpoint: '/users');
    final users = result as List<dynamic>;
    return users.map((user) => User.fromMap(user)).toList();
  }
}

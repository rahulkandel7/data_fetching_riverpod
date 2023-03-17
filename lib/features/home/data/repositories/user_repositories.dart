import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_app/core/api/api_error.dart';
import 'package:simple_app/core/api/dio_exception.dart';
import 'package:simple_app/features/home/data/models/user.dart';
import 'package:simple_app/features/home/data/sources/user_data_source.dart';

abstract class UserRepository {
  Future<Either<ApiError, List<User>>> fetchUser();
}

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(ref.watch(userDataSourceProvider));
});

class UserRepositoryImpl extends UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl(this._userDataSource);
  @override
  Future<Either<ApiError, List<User>>> fetchUser() async {
    try {
      final result = await _userDataSource.fetchUser();
      return right(result);
    } on DioException catch (e) {
      return left(ApiError(message: e.message!));
    }
  }
}

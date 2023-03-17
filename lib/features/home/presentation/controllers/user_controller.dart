import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_app/features/home/data/models/user.dart';
import 'package:simple_app/features/home/data/repositories/user_repositories.dart';

class UserController extends StateNotifier<AsyncValue<List<User>>> {
  final UserRepository _userRepository;
  UserController(this._userRepository) : super(const AsyncLoading()) {
    fetchUser();
  }

  fetchUser() async {
    final result = await _userRepository.fetchUser();
    result.fold(
        (error) =>
            state = AsyncError(error, StackTrace.fromString(error.message)),
        (success) => state = AsyncData(success));
  }
}

final userControllerProvider =
    StateNotifierProvider<UserController, AsyncValue<List<User>>>((ref) {
  return UserController(ref.watch(userRepositoryProvider));
});

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/src/features/auth/models/user_credentials.dart';
import 'package:user_list/src/features/auth/repositories/auth_repository.dart';
import 'package:user_list/src/features/auth/states/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authStorage;

  AuthCubit(
    this._authStorage,
  ) : super(const AuthState());

  void logIn(UserCredentials userCredentials) {
    if (userCredentials == user1Credentials ||
        userCredentials == user2Credentials) {
      _authStorage.setIsAuthorized(true);
      emit(state.copyWith(isAuthorized: true));
    } else {
      emit(state.copyWith(error: 'Wrong password'));
    }
  }
}

const user1Credentials = UserCredentials(
  email: '1@1.ru',
  password: '1',
);

const user2Credentials = UserCredentials(
  email: '2@2.ru',
  password: '2',
);

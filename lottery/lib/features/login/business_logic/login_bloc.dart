import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_bloc.freezed.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState.success()) {
    on<_Clear>(_onCleared);
    on<_Login>(_onLogin);
  }

  Future<void> _onCleared(
    _Clear event,
    Emitter<LoginState> emit,
  ) async {
    emit(
      const LoginState.success(
        userName: '',
        password: '',
        error: '',
      ),
    );
  }

  Future<void> _onLogin(
    _Login event,
    Emitter<LoginState> emit,
  ) async {
    bool isSuccess = false;

    if (event.userName == 'admin' && event.password == 'admin') {
      isSuccess = true;

      emit(
        LoginState.success(
          userName: event.userName,
          password: event.password,
          isSuccess: isSuccess,
          error: '',
        ),
      );
    } else {
      emit(
        LoginState.success(
          userName: event.userName,
          password: event.password,
          isSuccess: isSuccess,
          error: "Incorrect Login",
        ),
      );
    }
  }
}

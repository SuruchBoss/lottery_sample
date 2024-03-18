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
      ),
    );
  }

  Future<void> _onLogin(
    _Login event,
    Emitter<LoginState> emit,
  ) async {
    print(event.userName);
    print(event.password);
    emit(
      const LoginState.success(
        userName: '',
        password: '',
      ),
    );
  }
}

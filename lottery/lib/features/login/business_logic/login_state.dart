part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.success({
    @Default('') String? userName,
    @Default('') String? password,
    @Default(false) bool isSuccess,
  }) = _Success;
}

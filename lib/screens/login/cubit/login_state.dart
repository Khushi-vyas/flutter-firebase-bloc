part of 'login_cubit.dart';

enum LoginStatus { initial, submitting, success, error }

class LoginState extends Equatable {
  final String email;
  final String password;
  final LoginStatus status;
  final bool isValid;
  final String? errorMessage;

  const LoginState(
      {required this.email,
      required this.password,
      required this.status,
      required this.isValid,
      this.errorMessage});

  factory LoginState.initial() {
    return const LoginState(
        email: '', password: '', status: LoginStatus.initial, isValid: true);
  }

  LoginState copyWith(
      {String? email,
      String? password,
      LoginStatus? status,
      bool? isValid,
      String? errorMessage}) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [email, password, status, isValid, errorMessage];
}

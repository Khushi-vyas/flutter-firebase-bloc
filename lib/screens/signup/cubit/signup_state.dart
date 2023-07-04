part of 'signup_cubit.dart';

enum SignupStatus { initial, submitting, success, error }

class SignupState extends Equatable {
  final String email;
  final String password;
  final SignupStatus status;
  final bool isValid;
  final String? errorMessage;
  const SignupState(
      {required this.email,
      required this.password,
      required this.status,
      required this.isValid,
      this.errorMessage});

  factory SignupState.initial() {
    return const SignupState(
        email: '', password: '', status: SignupStatus.initial, isValid: true);
  }

  SignupState copyWith(
      {String? email,
      String? password,
      SignupStatus? status,
      bool? isValid,
      String? errorMessage}) {
    return SignupState(
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

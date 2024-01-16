import 'package:equatable/equatable.dart';

class LoginRequest extends Equatable {
  final String? email;
  final String? password;
  const LoginRequest({
    this.email,
    this.password,
  });

  LoginRequest copyWith({
    String? email,
    String? password,
  }) {
    return LoginRequest(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  String toString() => 'LoginRequest(email: $email, password: $password)';

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}

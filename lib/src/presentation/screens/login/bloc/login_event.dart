part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}


class LoginWithEmail extends LoginEvent {
  final String email;
  final String password;

  const LoginWithEmail({
    this.email = CommonStrings.emptyString,
    this.password = CommonStrings.emptyString,
  });

  @override
  List<Object> get props => [email, password];
}


class LoginSetPasswordVisibility extends LoginEvent {
  final bool isObscurePassword;

  const LoginSetPasswordVisibility({this.isObscurePassword = true});
}

class LoginValidateEmail extends LoginEvent {
  final String? email;
  const LoginValidateEmail({
    required this.email,
  });
}

class LoginValidatePassword extends LoginEvent {
  final String? password;
  const LoginValidatePassword({
    required this.password,
  });
}

class LoginWithEmailPassword extends LoginEvent {
  final String? email;
  final String? password;

  const LoginWithEmailPassword({
    required this.email,
    required this.password,
  });
}


class SignUpWithEmailPassword extends LoginEvent {
  final String? email;
  final String? password;

  const SignUpWithEmailPassword({
    required this.email,
    required this.password,
  });
}
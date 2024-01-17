part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpWithEmail extends SignUpEvent {
  final String email;
  final String password;

  const SignUpWithEmail({
    this.email = CommonStrings.emptyString,
    this.password = CommonStrings.emptyString,
  });

  @override
  List<Object> get props => [email, password];
}

class SignUpSetPasswordVisibility extends SignUpEvent {
  final bool isObscurePassword;

  const SignUpSetPasswordVisibility({this.isObscurePassword = true});
}

class SignUpValidateEmail extends SignUpEvent {
  final String? email;
  const SignUpValidateEmail({
    required this.email,
  });
}

class SignUpValidatePassword extends SignUpEvent {
  final String? password;
  const SignUpValidatePassword({
    required this.password,
  });
}

class SignUpWithEmailPassword extends SignUpEvent {
  final String? email;
  final String? password;
  final String? name;
  final String? phone;
  final String? imageUrl;

  const SignUpWithEmailPassword({
    this.name,
    this.phone,
    this.imageUrl,
    this.email,
    this.password,
  });
}

class SignUpUpdateImage extends SignUpEvent {
  final XFile? file;
  const SignUpUpdateImage({
    required this.file,
  });
}

class SignUpUploadImage extends SignUpEvent {
  final XFile? file;
  const SignUpUploadImage({
    required this.file,
  });
}

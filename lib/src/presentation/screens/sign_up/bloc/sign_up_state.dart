part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  const SignUpState(
      {this.message = CommonStrings.emptyString,
      this.requestState = RequestState.empty,
      this.isObscurePassword = true,
      this.emailValidation = Validation.none,
      this.passwordValidation = Validation.none,
      this.loginSuccessful = false,
      required this.file,
      this.imageUrl = ''});

  /// [message] is used to throw error from data layer
  /// to show message from presentation layer
  /// use [requestState] on screen bloc listener instead
  final String message;
  final RequestState requestState;
  final bool isObscurePassword;
  final Validation emailValidation;
  final Validation passwordValidation;
  final bool loginSuccessful;
  final XFile file;
  final String imageUrl;

  SignUpState copyWith({
    String? message,
    RequestState? requestState,
    bool? isObscurePassword,
    Validation? emailValidation,
    Validation? passwordValidation,
    bool? loginSuccessful,
    XFile? file,
    String? imageUrl,
  }) {
    return SignUpState(
        message: message ?? this.message,
        requestState: requestState ?? this.requestState,
        isObscurePassword: isObscurePassword ?? this.isObscurePassword,
        emailValidation: emailValidation ?? this.emailValidation,
        passwordValidation: passwordValidation ?? this.passwordValidation,
        loginSuccessful: loginSuccessful ?? this.loginSuccessful,
        file: file ?? this.file,
        imageUrl: imageUrl ?? this.imageUrl);
  }

  factory SignUpState.initial() => SignUpState(file: XFile(''));

  @override
  List<Object> get props => [
        message,
        requestState,
        isObscurePassword,
        emailValidation,
        passwordValidation,
        loginSuccessful,
        file,
        imageUrl
      ];
}

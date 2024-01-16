part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.message = CommonStrings.emptyString,
    this.requestState = RequestState.empty,
    this.isObscurePassword = true,
    this.emailValidation = Validation.none,
    this.passwordValidation = Validation.none,
    this.loginSuccessful = false
  });

  /// [message] is used to throw error from data layer
  /// to show message from presentation layer
  /// use [requestState] on screen bloc listener instead
  final String message;
  final RequestState requestState;
  final bool isObscurePassword;
  final Validation emailValidation;
  final Validation passwordValidation;
  final bool loginSuccessful;

  LoginState copyWith({
    String? message,
    RequestState? requestState,
    bool? isObscurePassword,
    Validation? emailValidation,
    Validation? passwordValidation,
    bool? loginSuccessful
  }) {
    return LoginState(
      message: message ?? this.message,
      requestState: requestState ?? this.requestState,
      isObscurePassword: isObscurePassword ?? this.isObscurePassword,
      emailValidation: emailValidation ?? this.emailValidation,
      passwordValidation: passwordValidation ?? this.passwordValidation,
      loginSuccessful: loginSuccessful ?? this.loginSuccessful,
    );
  }

  factory LoginState.initial() => const LoginState();

  @override
  List<Object> get props => [
        message,
        requestState,
        isObscurePassword,
        emailValidation,
        passwordValidation,
        loginSuccessful
      ];
}

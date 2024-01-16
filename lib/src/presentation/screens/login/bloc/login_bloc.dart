import 'package:aureus_group/src/common/constants/common_strings.dart';
import 'package:aureus_group/src/common/constants/regular_expresions.dart';
import 'package:aureus_group/src/common/enum/request_state.dart';
import 'package:aureus_group/src/common/enum/validation.dart';
import 'package:aureus_group/src/common/helper/common_util.dart';
import 'package:aureus_group/src/repositories/authentication.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginBloc() : super(LoginState.initial()) {
    // on<LoginWithEmail>(_loginEmail);
    on<LoginSetPasswordVisibility>(_loginSetPasswordVisibility);
    on<LoginValidateEmail>(_loginValidateEmail);
    on<LoginValidatePassword>(_loginValidatePassword);
    on<LoginWithEmailPassword>(_loginWithEmailPassword);
    on<SignUpWithEmailPassword>(_signUpWithEmailPassword);
  }

  bool get isEmailAndPasswordValid =>
      state.emailValidation == Validation.valid &&
      state.passwordValidation == Validation.valid;

  void _loginWithEmailPassword(LoginWithEmailPassword event, emit) async {
    try {
      emit(state.copyWith(requestState: RequestState.loading));
      bool loginsuccessful = await AuthRepository().signIn(email: event.email??'', password: event.password??'');
      emit(state.copyWith(
        loginSuccessful: loginsuccessful,
          requestState: RequestState.success));
    } catch (e) {
      emit(state.copyWith(requestState: RequestState.error));
    }
  }

  void _signUpWithEmailPassword(SignUpWithEmailPassword event, emit) async {
    try {
      emit(state.copyWith(requestState: RequestState.loading));
      bool loginsuccessful = await AuthRepository().signIn(email: event.email??'', password: event.password??'');
      emit(state.copyWith(
        loginSuccessful: loginsuccessful,
          requestState: RequestState.success));
    } catch (e) {
      emit(state.copyWith(requestState: RequestState.error));
    }
  }

  void _loginSetPasswordVisibility(
      LoginSetPasswordVisibility event, emit) async {
    emit(state.copyWith(isObscurePassword: event.isObscurePassword));
  }

  void _loginValidateEmail(LoginValidateEmail event, emit) {
    Validation emailValidation = state.emailValidation;
    if (CommonUtil.falsyChecker(event.email) ||
        (event.email != null &&
            !RegularExpressions.email.hasMatch(event.email!))) {
      emailValidation = Validation.invalid;
    } else {
      emailValidation = Validation.valid;
    }
    emit(state.copyWith(emailValidation: emailValidation));
  }

  void _loginValidatePassword(LoginValidatePassword event, emit) {
    Validation passwordValidation = state.emailValidation;
    if (CommonUtil.falsyChecker(event.password)) {
      passwordValidation = Validation.invalid;
    } else {
      passwordValidation = Validation.valid;
    }
    emit(state.copyWith(passwordValidation: passwordValidation));
  }
}

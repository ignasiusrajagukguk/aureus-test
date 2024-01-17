import 'package:aureus_group/src/common/constants/common_strings.dart';
import 'package:aureus_group/src/common/constants/regular_expresions.dart';
import 'package:aureus_group/src/common/enum/request_state.dart';
import 'package:aureus_group/src/common/enum/validation.dart';
import 'package:aureus_group/src/common/helper/common_util.dart';
import 'package:aureus_group/src/data/models/sign_up_response.dart';
import 'package:aureus_group/src/repositories/authentication.dart';
import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpState.initial()) {
    // on<LoginWithEmail>(_loginEmail);
    on<SignUpSetPasswordVisibility>(_loginSetPasswordVisibility);
    on<SignUpValidateEmail>(_loginValidateEmail);
    on<SignUpValidatePassword>(_loginValidatePassword);
    on<SignUpWithEmailPassword>(_signUpWithEmailPassword);
    on<SignUpUpdateImage>(_signUpUpdateImageFile);
    on<SignUpUploadImage>(_uploadFile);
  }

  bool get isEmailAndPasswordValid =>
      state.emailValidation == Validation.valid &&
      state.passwordValidation == Validation.valid;

  void _signUpWithEmailPassword(SignUpWithEmailPassword event, emit) async {
    try {
      emit(state.copyWith(requestState: RequestState.loading));
      SignUpResponse data = await AuthRepository()
          .signUp(email: event.email ?? '', password: event.password ?? '');
      await AuthRepository().postUserData(
          email: event.email ?? '',
          imageLink: event.imageUrl!,
          name: event.name!,
          phone: event.phone!);
      emit(state.copyWith(
          loginSuccessful: data.idToken != null,
          requestState: RequestState.success));
    } catch (e) {
      emit(state.copyWith(requestState: RequestState.error));
    }
  }

  void _uploadFile(SignUpUploadImage event, emit) async {
    try {
      emit(state.copyWith(requestState: RequestState.loading));
      String data = await AuthRepository().uploadImage(file: event.file!);
      emit(state.copyWith(imageUrl: data, requestState: RequestState.success));
    } catch (e) {
      emit(state.copyWith(requestState: RequestState.error));
    }
  }

  void _loginSetPasswordVisibility(
      SignUpSetPasswordVisibility event, emit) async {
    emit(state.copyWith(isObscurePassword: event.isObscurePassword));
  }

  void _signUpUpdateImageFile(SignUpUpdateImage event, emit) async {
    emit(state.copyWith(file: event.file));
  }

  void _loginValidateEmail(SignUpValidateEmail event, emit) {
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

  void _loginValidatePassword(SignUpValidatePassword event, emit) {
    Validation passwordValidation = state.emailValidation;
    if (CommonUtil.falsyChecker(event.password)) {
      passwordValidation = Validation.invalid;
    } else {
      passwordValidation = Validation.valid;
    }
    emit(state.copyWith(passwordValidation: passwordValidation));
  }
}

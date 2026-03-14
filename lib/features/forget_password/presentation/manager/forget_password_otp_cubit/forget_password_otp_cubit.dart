import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/features/forget_password/domain/use_cases/verify_otp_forget_password_use_case.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../config/error_handling/result.dart';
import 'forget_password_otp_state.dart';

@injectable
class ForgetPasswordOtpCubit extends Cubit<ForgetPasswordOtpState> {
  ForgetPasswordOtpCubit(this.verifyOtpUseCase)
    : super(ForgetPasswordOtpInitial());

  static ForgetPasswordOtpCubit get(context) => BlocProvider.of(context);

  String otpCode = '';
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();
  TextEditingController otpController = TextEditingController();

  VerifyOtpForgetPasswordUseCase verifyOtpUseCase;

  void verifyOtp(String otp) async {
    otpCode = otp;

    emit(ForgetPasswordOtpLoading());

    var result = await verifyOtpUseCase.call(otp: otpCode);

    switch (result) {
      case Success():
        emit(ForgetPasswordOtpVerified());

      case Failure():
        errorController.add(ErrorAnimationType.shake);
        otpController.clear();
        emit(ForgetPasswordOtpFailure(result.errorMessage));
    }
  }

  @override
  Future<void> close() {
    errorController.close();
    otpController.dispose();
    return super.close();
  }
}

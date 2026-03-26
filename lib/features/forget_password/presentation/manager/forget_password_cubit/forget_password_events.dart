sealed class ForgetPasswordEvents {}

class SendEmailEvent extends ForgetPasswordEvents {}

class ClearSendEmailSuccessEvent extends ForgetPasswordEvents {}

class VerifyOtpEvent extends ForgetPasswordEvents {}

class ResetPasswordEvent extends ForgetPasswordEvents {}

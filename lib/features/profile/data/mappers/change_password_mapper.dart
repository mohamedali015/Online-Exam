import '../../domain/entities/change_password_entity.dart';
import '../models/responses/change_password/change_password_response.dart';

extension ChangePasswordMapper on ChangePasswordResponse {
  ChangePasswordEntity toEntity() {
    return ChangePasswordEntity(message: message, token: token);
  }
}

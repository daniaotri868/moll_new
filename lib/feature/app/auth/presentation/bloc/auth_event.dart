part of 'auth_bloc.dart';

@immutable
class AuthEvent {}

class RegisterEvent extends AuthEvent {
  final String password;
  final String email;
  final VoidCallback onSuccess;
  RegisterEvent({required this.password, required this.onSuccess,required this.email});
}

class CheckCodeEvent extends AuthEvent {
  final String FirstName;
  final String LastName;
  final String PhoneNumber;
  final String Image;
  final String Password;
  final String Email;
  final String DeviceToken;
  final String Address;
  final String AreaId;
  final VoidCallback onSuccess;
  CheckCodeEvent({
    required this.FirstName,
    required this.DeviceToken,
    required this.Image,
    required this.LastName,
    required this.PhoneNumber,
    required this.Email,
    required this.Password,
    required this.onSuccess,
    required this.AreaId,
    required this.Address,
  });
}


class AllAreaEvent extends AuthEvent {
  AllAreaEvent();
}

class UpdateUserInfoEvent extends AuthEvent {
  final String FirstName;
  final String LastName;
  final String PhoneNumber;
  final String Image;
  final String OldPassword;
  final String Email;
  final String DeviceToken;
  final String UserId;
  final String NewPassword;
  final VoidCallback onSuccess;

  UpdateUserInfoEvent(
      {
        required this.FirstName,required this.NewPassword,required this.UserId,
        required this.DeviceToken,required this.Image, required this.LastName,
        required this.PhoneNumber,required this.Email,required this.OldPassword,required this.onSuccess
      });
}

class GetProfileEvent extends AuthEvent {
  String? id;
  GetProfileEvent({required this.id});
}





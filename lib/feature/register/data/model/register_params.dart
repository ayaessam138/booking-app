import 'package:bookingapp/feature/register/domain/entity/register_entity.dart';

class RegisterParams {
  final String name;
  final String email;
  final String password;

  const RegisterParams({
    required this.name,
    required this.email,
    required this.password,
  });


  factory RegisterParams.fromEntity(RegisterParamsEntity entity) {
    return RegisterParams(
      name: entity.name ?? '',
      email: entity.email ?? '',
      password: entity.password ?? '',
    );
  }

 
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
    };
  }
}

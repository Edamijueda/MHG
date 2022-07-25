import 'package:freezed_annotation/freezed_annotation.dart';

part 'login.freezed.dart';
part 'login.g.dart';

@freezed
class Login with _$Login {
  //const Login._();

  const factory Login({
    required final String mail,
    required final String pass,
  }) = _Login;

  factory Login.fromJson(Map<String, Object?> json) => _$LoginFromJson(json);
  /*Map<String, dynamic> toMap(
    Map<String, dynamic> loginData,
  ) {
    mail = loginData.keys,
  }*/

/*factory Login.fromMap(

      ) {
    return Login(
      mail: mail,
      pass: loginData.get(passTxt),
    );
  }*/
}

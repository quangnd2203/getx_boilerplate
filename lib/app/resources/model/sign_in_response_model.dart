import 'package:werewolf_client/app/resources/model/user_model.dart';

class SignInResponseModel {
  UserModel user;
  String accessToken;

  SignInResponseModel({
      this.user,
      this.accessToken});

  SignInResponseModel.fromJson(dynamic json) {
    user = json["user"] != null ? UserModel.fromJson(json['user']) : UserModel();
    accessToken = json["accessToken"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["user"] = user;
    map["accessToken"] = accessToken;
    return map;
  }

}
class UserModel {
  int id;
  String fullName;
  String email;
  dynamic avatar;
  String username;
  String password;
  int score;
  int coin;

  UserModel({
      this.id, 
      this.fullName, 
      this.email, 
      this.avatar, 
      this.username, 
      this.password, 
      this.score, 
      this.coin});

  UserModel.fromJson(dynamic json) {
    id = json["id"];
    fullName = json["fullName"];
    email = json["email"];
    avatar = json["avatar"];
    username = json["username"];
    password = json["password"];
    score = json["score"];
    coin = json["coin"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["fullName"] = fullName;
    map["email"] = email;
    map["avatar"] = avatar;
    map["username"] = username;
    map["password"] = password;
    map["score"] = score;
    map["coin"] = coin;
    return map;
  }

}
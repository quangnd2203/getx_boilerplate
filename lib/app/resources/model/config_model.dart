class ConfigModel {
  int id;
  String versionAndroid;
  int versionNumberAndroid;
  String versionIos;
  int versionNumberIos;
  int requiredVersionAndroid;
  int requiredVersionIos;
  String storeAndroid;
  String storeIos;
  int enableAds;

  ConfigModel(
      {this.id,
      this.versionAndroid,
      this.versionNumberAndroid,
      this.versionIos,
      this.versionNumberIos,
      this.requiredVersionAndroid,
      this.requiredVersionIos,
      this.storeAndroid,
      this.storeIos,
      this.enableAds});

  String storeIosToUrl() {
    return "https://apps.apple.com/us/app/id${this.storeIos}";
  }

  bool get isEnableAds => this.enableAds == 1;

  ConfigModel.fromJson(dynamic json) {
    id = json["id"];
    versionAndroid = json["version_android"];
    versionNumberAndroid = json["version_number_android"];
    versionIos = json["version_ios"];
    versionNumberIos = json["version_number_ios"];
    requiredVersionAndroid = json["required_version_android"];
    requiredVersionIos = json["required_version_ios"];
    storeAndroid = json["store_android"];
    storeIos = json["store_ios"];
    enableAds = json['enable_ads'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["version_android"] = versionAndroid;
    map["version_number_android"] = versionNumberAndroid;
    map["version_ios"] = versionIos;
    map["version_number_ios"] = versionNumberIos;
    map["required_version_android"] = requiredVersionAndroid;
    map["required_version_ios"] = requiredVersionIos;
    map["store_android"] = storeAndroid;
    map["store_ios"] = storeIos;
    map['enable_ads'] = enableAds;
    return map;
  }
}

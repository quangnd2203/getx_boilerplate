class AppEndpoint {
  AppEndpoint._();

  static const String BASE_URL = "http://172.20.10.2:8888";

  static const String BASE_URL_SOCKET = "http://172.20.10.2:3000";

  static const int connectionTimeout = 5000;
  static const int receiveTimeout = 5000;
  static const String keyAuthorization = "Authorization";

  static const String GET_CONFIG = "/api/get/config";

  static const String POST_SIGN_UP = "/api/post/signUp";

  static const String POST_SIGN_IN = "/api/post/signIn";

  static const String GET_PROFILE = "/api/get/profile";
}

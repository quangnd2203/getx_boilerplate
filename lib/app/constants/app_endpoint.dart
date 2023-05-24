class AppEndpoint {
  AppEndpoint._();

  static const String BASE_URL_DEV = '';
  static const String BASE_URL_STAGING = '';
  static const String BASE_URL_PROD = '';

  static const String TEST_API = 'https://jsonplaceholder.typicode.com/posts';

  static const int connectionTimeout = 30000;
  static const int receiveTimeout = 30000;
  static const String keyAuthorization = 'Authorization';

  static const int SUCCESS = 200;
  static const int UNAUTHORIZED = 401;
  static const int BAD_REQUEST = 400;
  static const int NOT_FOUND = 404;
  static const int FORBIDDEN = 403;

  static const int ERROR_VALIDATE = 422;
  static const int ERROR_SERVER = 500;
  static const int ERROR_DISCONNECT = -1;

  static const String SIGN_UP = '/api/auth/signup';
  static const String SIGN_IN = '/api/auth/login';
}

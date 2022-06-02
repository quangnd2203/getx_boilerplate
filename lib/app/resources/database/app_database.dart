// import 'package:backendless_sdk/backendless_sdk.dart';
// import 'package:flutter/services.dart';
// import 'package:logger/logger.dart' as log;
//
// const String BACKEND_DOMAIN = 'regalbehavior.backendless.app';
// const String APPLICATION_ID = 'F569DB07-7FF4-3326-FF60-EBD2506F9E00';
// const String ANDROID_API_KEY = 'D4BD3656-A27A-47EB-A01E-C2E904E681A3';
// const String IOS_API_KEY = '7EAC864C-994A-40C6-A0A1-313526A2CE10';
// const String JS_API_KEY = '175E8A6D-9F95-41EF-A2E7-63193B8B9CC4';
//
// class AppDataBase {
//
//   /// Với mong muốn dùng một thể hiện của đối tượng này trong suốt chương trình
//   /// ta thực hiện dùng Singleton pattern
//   AppDataBase._();
//
//   static AppDataBase? _instance;
//
//   static log.Logger logger = log.Logger();
//
//   factory AppDataBase() {
//     return _instance ??= AppDataBase._();
//   }
//
//   /// Hàm này dùng để kết nối với Backendless trả về true nếu kết nối thành công.
//   ///
//   /// Nên dùng lúc mới bắt đầu chạy chương trình.
//   ///
//   /// bool success = await AppDataBase().initDataBase();
//   Future<bool> initDataBase() async {
//     await Backendless.initApp(
//       applicationId: APPLICATION_ID,
//       androidApiKey: ANDROID_API_KEY,
//       iosApiKey: IOS_API_KEY,
//       // jsApiKey: JS_API_KEY,
//       customDomain: BACKEND_DOMAIN,
//     );
//     final _success = await Backendless.isInitialized();
//     logger.i(_success == true
//         ? 'CONNECT DATABASE SUCCESS'
//         : 'CONNECT DATABASE FAILED');
//     return _success == true;
//   }
//
//   /// Hàm này dùng để query dữ liệu theo tên bảng và theo điều kiện đầu vào.
//   ///
//   /// Cac biến:
//   ///   tableName: tên của bảng cần query
//   ///   queryBuilder: điều kiện đầu vào (có thể có hoặc không).
//   ///
//   /// Ví dụ: read('HS_SINHVIEN');
//   Future<List<Map<dynamic, dynamic>?>?> read(String tableName,
//       {DataQueryBuilder? queryBuilder}) async {
//     logger.d('FIND: $tableName\nQUERY: ${queryBuilder?.toJson()}');
//     List<Map<dynamic, dynamic>?>? data;
//     try {
//       data = await Backendless.data.of(tableName).find(queryBuilder);
//       logger.i('RESPONSE: $data');
//     } catch (e) {
//       _handleError(e);
//     }
//     return data;
//   }
//
//   /// Hàm này dùng để bắt lỗi khi gọi query các bảng ở trên Backendless hoặc lỗi hệ thống bất ngờ.
//   ///
//   /// BackendlessException: Object errors Backendless định nghĩa.
//   /// PlatformException: Object errors theo bắt lỗi theo từng nền tảng (IOS hoặc Android).
//   _handleError(e) {
//     if (e is BackendlessException) {
//       logger.e("URL: ${e.uri}/n${e.code} - Error ${e.message}");
//     } else if (e is PlatformException) {
//       logger.e("${e.code} - Error ${e.message}");
//     } else {
//       logger.e("ERROR: $e");
//     }
//   }
// }

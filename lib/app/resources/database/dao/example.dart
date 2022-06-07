// import 'package:flutter_app/src/resource/resource.dart';
//
// class StudentDao implements Dao<StudentModel>{
//   StudentDao._();
//
//   static StudentDao? _instance;
//
//   factory StudentDao() {
//     return _instance ??= StudentDao._();
//   }
//
//   /// Khởi tạo AppDataBase để có thể thao tác với Backendless
//
//   @override
//   AppDataBase appDatabase = AppDataBase();
//
//   /// Gán tên của bảng trên Backendless vào đây.
//   @override
//   String tableName = 'HS_SINHVIEN';
//
//   /// Phương thức này dùng để query CSDL trả ra List<StudentModel>
//   ///
//   /// Cac biến:
//   ///   queryBuilder: điều kiện đầu vào (có thể có hoặc không).
//   @override
//   Future<List<StudentModel>> read({DataQueryBuilder? queryBuilder}) async {
//     List<StudentModel> result = [];
//     final response = await appDatabase.read(tableName, queryBuilder: queryBuilder);
//     if(response != null){
//       result = response.map((e) => StudentModel.fromJson(e)).toList();
//     }
//     return result;
//   }
//
// }

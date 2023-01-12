// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:student_management_system_app/constants/static_user.dart';
import 'package:student_management_system_app/data/remote/model/grade_model.dart';

class GradeService {
  static GradeService service = GradeService._();

  GradeService._();

  Dio dio = Dio();

  final String BASE_URL = "http://4665-88-244-30-68.ngrok.io/api/";
  final String GRADE = "grade";
  final String USER = "user";

  Future<List<GradeModel>> fetchAllGrades() async {
    var url = "$BASE_URL$GRADE";
    var id = StaticUser.userType == "student" ? "studentId" : "lecturerId";

    try {
      Response response = await dio.get(url, queryParameters: {id: StaticUser.userId});
      List<GradeModel> grades = (response.data as List).map((e) => GradeModel.fromJson(e)).toList();
      return grades;
    } on DioError catch (e) {
      print(e);
      return List.empty();
    }
  }
}

import 'package:dio/dio.dart';
import 'package:student_management_system_app/data/remote/model/auth_model.dart';

class AuthService {
  static AuthService service = AuthService._();

  AuthService._();

  final String BASE_URL = "http://4665-88-244-30-68.ngrok.io/api/";
  final String LOGIN = "login";

  Dio dio = Dio();

  Future<AuthModel?> login(Map<String, String> loginModel) async {
    final url = "$BASE_URL$LOGIN";

    try {
      Response response = await dio.post(url, data: loginModel);
      AuthModel model = AuthModel.fromJson(response.data);
      return model;
    } on DioError catch (e) {
      print(e);
    }

    return null;
  }
}

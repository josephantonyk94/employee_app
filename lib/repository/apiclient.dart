import 'package:dio/dio.dart';
import 'package:sample_api_test/model/user.dart';

class ApiClient{
  Dio dio =Dio();
 Future login(UserModel user){
    FormData formData=FormData.fromMap({
      "email": "eve.holt@reqres.in",
      "password": "cityslicka"
    });
    try {
      var result=  dio.post('https://reqres.in/api/login', data: formData);
      return result;
 } on DioError catch (e){
      print(e.message);
    }
  }
  Future fetchEmployees(int page){
   return dio.get('https://reqres.in/api/users',queryParameters: {"page":page.toString()});
  }
}
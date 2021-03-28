import 'package:dio/dio.dart';
import 'package:sample_api_test/model/user.dart';

class ApiClient{
  Dio dio =Dio();
 // ignore: missing_return
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
   fetchUser(int page) {
   return dio.get("https://jsonplaceholder.typicode.com/users/$page/posts");
  }
}
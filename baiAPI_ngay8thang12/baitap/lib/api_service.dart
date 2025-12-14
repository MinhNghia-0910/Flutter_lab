import 'package:dio/dio.dart';
import 'package:baitap/model/user.dart';

class AuthService {
  // Đăng nhập
  Future<User?> login(String username, String password) async {
    var url = 'https://dummyjson.com/auth/login';
    var dio = Dio();

    try {
      var response = await dio.post(
        url,
        data: {'username': username, 'password': password},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      print('Status Code: ${response.statusCode}');
      print('Response: ${response.data}');

      if (response.statusCode == 200) {
        print('Dang nhap thanh cong');
        int userId = response.data['id'];
        String token = response.data['accessToken'] ?? response.data['token'] ?? ''; 

        print('User ID: $userId');
        print('Token: $token');
        User? user = await getUserById(userId, token);
        return user;
      } else {
        print('Loi dang nhap');
        return null;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print('Loi:  ${e.response?.statusCode} - ${e.response?.data}');
      } else {
        print('Loi ket noi: ${e.message}');
      }
      return null;
    } catch (e) {
      print('Loi:  $e');
      return null;
    }
  }

  Future<User?> getUserById(int userId, String token) async {
    var url = 'https://dummyjson.com/users/$userId';
    var dio = Dio();

    try {
      var response = await dio.get(url); 

      print('Get User Status:  ${response.statusCode}');
      print('User Data: ${response.data}');

      if (response.statusCode == 200) {
        print('Lay thong tin user thanh cong');
        var userData = response.data;
        userData['token'] = token;

        User user = User.formJson(userData);
        return user;
      } else {
        print('Loi lay thong tin user');
        return null;
      }
    } catch (e) {
      print('Loi get user: $e');
      return null;
    }
  }
}

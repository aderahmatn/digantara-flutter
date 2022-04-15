import 'package:get/get_connect/connect.dart';

class UserProvider extends GetConnect {
  final url = '';

  // Get request
  Future<Response> getNews() => get(url);
}

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../util/app_urls.dart';
import '../api/user_reponse.dart';

class APIService {
  Future<UserReponse> getUser() async {
    var response = await http.Client().get(
      Uri.parse(AppUrls.baseUrl),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      return UserReponse.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load post');
    }
  }
}

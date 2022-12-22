import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:userlist/model/api/user_reponse.dart';

import '../../util/app_urls.dart';

class APIService {
  Future<UserReponse> getMenu() async {
    var response = await http.Client()
        .post(Uri.parse(AppUrls.baseUrl), body: jsonEncode({}));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      return UserReponse.fromJson(jsonResponse[0]);
    } else {
      throw Exception('Failed to load post');
    }
  }
}

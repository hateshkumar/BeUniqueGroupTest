
import 'dart:convert';

import 'package:Test/models/category_result.dart';
import 'package:Test/models/profile_result.dart';
import 'package:Test/utils/constants.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl;

  ApiClient({
    this.baseUrl = Constants.BASE_URL
  });

  Future<Category> fetchCategoryResults() async {
    print("Called 1");

    final uri = Uri.parse("${baseUrl}api/v1/category/60597fa4eb72561fb6bb064f");
    final response = await http.get(uri);

    return Category.fromJson(json.decode(response.body));
  }


  Future<ProfileModel> fetchProfileResults( ) async {
    print("Called 2");

    final uri = Uri.parse("${baseUrl}api/v1/profile/me");
    final response = await http.get(uri,headers:  <String, String>{
      'Authorization': '${Constants.BEARER_TOKEN}',
    });

    print("response ${response.body}");
    return ProfileModel.fromJson(json.decode(response.body));
  }


}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_users/utilities/api_endpoint.dart';
import 'package:http/http.dart' as http;


final userRepoProvider = ChangeNotifierProvider((ref)=> UserRepoController());

class UserRepoController extends ChangeNotifier{

Future<Map<String, dynamic>> fetchUserDetails(String userName) async {
  final uri = Uri.parse('${ApiEndPoint.url}/$userName');
  final response = await http.get(
    uri,
    headers: {
      'Authorization': 'token ${ApiEndPoint.token}',
      'Accept': 'application/vnd.github.v3+json',
    },
  );

  if (response.statusCode == 200) {
    try {
      return json.decode(response.body) as Map<String, dynamic>;
    } catch (e) {
      debugPrint('Error decoding JSON: $e');
      return {};
    }
  } else {
    debugPrint('Failed to fetch user details. Status code: ${response.statusCode}');
    return {};
  }
}

 Future<List<dynamic>> fetchRepositories(String userName) async {

  final uri = Uri.parse('${ApiEndPoint.url}/$userName/repos');
  final response = await http.get(uri, headers: {
    'Authorization': 'token ${ApiEndPoint.token}',
    'Accept': 'application/vnd.github.v3+json',
  });

  if (response.statusCode == 200) {
    try {
      return json.decode(response.body) as List<dynamic>;
    } catch (e) {
      debugPrint('Error decoding JSON: $e');
      return [];
    }
  } else {
    debugPrint('Failed to fetch repositories. Status code: ${response.statusCode}');
    return [];
  }
}
}



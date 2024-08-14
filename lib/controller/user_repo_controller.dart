
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
final userRepoProvider = ChangeNotifierProvider((ref)=> UserRepoController());

class UserRepoController extends ChangeNotifier{

  final String username = "";
  Future<Map<String, dynamic>> fetchUserDetails() async {
    final response = await http.get(Uri.parse('https://api.github.com/users/$username'));
    return json.decode(response.body);
  }

  Future<List<dynamic>> fetchRepositories() async {
    final response = await http.get(Uri.parse('https://api.github.com/users/$username/repos'));
    return json.decode(response.body);
  }
}
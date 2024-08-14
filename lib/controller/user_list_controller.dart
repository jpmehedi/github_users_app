import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_users/model/user_list_model.dart';
import 'package:github_users/utilities/api_endpoint.dart';
import 'package:github_users/utilities/global.dart';
import 'package:http/http.dart' as http;

final userListProvider = ChangeNotifierProvider((ref)=> UserListController());

class UserListController extends ChangeNotifier{
  final TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController=> _searchController;
  List<UserListModel> _users = <UserListModel>[];
  List get users => _users;
  String _userName  = "";
  String get userName => _userName;
  
  UserListController(){
    fetchUsers();
  }

  void selectedUser(user){
    _userName = user;
    notifyListeners();
  }
    
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
 Future<void> fetchUsers() async {
  _users.clear();
  setLoading(true);
  final response = await http.get(
    Uri.parse(ApiEndPoint.url),
    headers: {
      'Authorization': 'token ${ApiEndPoint.token}',
    },
  );
  logger.f(response.statusCode);
  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    logger.f(data.first);
    List<UserListModel> users = data.map((json) => UserListModel.fromJson(json)).toList();
    _users.addAll(users);
    setLoading(false);
  } else {
    logger.e('Failed to load users');
  }

  notifyListeners();
}

  Future<void> searchUser(String query) async {
    if(query.isEmpty){
      fetchUsers();
    }
   _users =  _users.where((user) => user.login.toLowerCase().contains(query.toLowerCase())).toList();
    notifyListeners();
  }
  
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_users/controller/user_list_controller.dart';
import 'package:github_users/router/route_path.dart';
import 'package:go_router/go_router.dart';

class UserListScreen extends ConsumerWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userListController = ref.watch(userListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Github Users", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: userListController.searchController,
              decoration: const InputDecoration(hintText: 'Search Users...'),
              onSubmitted: userListController.searchUser,
            ),
            userListController.isLoading ?  const Center(child: CircularProgressIndicator()) : Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: userListController.users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(userListController.users[index].avatarUrl),
                    ),
                    title: Text(userListController.users[index].login),
                    onTap: (){
                      context.push(RoutePath.userRepoScreen);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}




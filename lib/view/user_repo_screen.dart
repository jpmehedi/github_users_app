import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_users/controller/user_repo_controller.dart';
import 'package:github_users/router/route_path.dart';
import 'package:go_router/go_router.dart';
class UserRepoScreen extends ConsumerWidget {
  const UserRepoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userRepoController = ref.watch(userRepoProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users Name"),
      ),
      body: FutureBuilder(
        future: Future.wait([userRepoController.fetchUserDetails(), userRepoController.fetchRepositories()]),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final userDetails = snapshot.data![0];
          final repositories = snapshot.data![1].where((repo) => !repo['fork']).toList();

          return SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(userDetails['avatar_url']),
                  ),
                  title: Text(userDetails['name'] ?? "username"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Followers: ${userDetails['followers']}'),
                      Text('Following: ${userDetails['following']}'),
                    ],
                  ),
                ),
                const Divider(),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: repositories.length,
                  itemBuilder: (context, index) {
                    final repo = repositories[index];
                    return ListTile(
                      title: Text(repo['name']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Language: ${repo['language'] ?? 'N/A'}'),
                          Text('Stars: ${repo['stargazers_count']}'),
                          Text(repo['description'] ?? ''),
                        ],
                      ),
                      onTap: (){
                        context.push(RoutePath.webViewScreen);
                      }
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}



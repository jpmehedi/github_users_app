import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_users/controller/user_list_controller.dart';
import 'package:github_users/controller/user_repo_controller.dart';
import 'package:github_users/controller/web_view_controller.dart';
import 'package:github_users/model/user_info_model.dart';
import 'package:github_users/model/user_repo_model.dart';
import 'package:github_users/router/route_path.dart';
import 'package:go_router/go_router.dart';
class UserRepoScreen extends ConsumerWidget {
  const UserRepoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userRepoController = ref.watch(userRepoProvider);
    final userListController = ref.watch(userListProvider);
    final viewController = ref.watch(viewProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ), 
        backgroundColor: Colors.teal,
        title: const Text("User Repository List", style: TextStyle(color: Colors.white),),
      ),
      body: FutureBuilder(
        future: Future.wait([userRepoController.fetchUserDetails(userListController.userName), userRepoController.fetchRepositories(userListController.userName)]),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          UserInfoModel userInfoModel = UserInfoModel.fromJson(snapshot.data![0]);
          final repositories = snapshot.data![1].where((repo) => !repo['fork']).toList();
          return SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(userInfoModel.avatarUrl!),
                  ),
                  title: Text(userInfoModel.name!,  style: const TextStyle(fontSize: 20)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('User name: ${userInfoModel.login}', style: const TextStyle(fontSize: 18),),
                      Text('Followers: ${userInfoModel.followers}', style: const TextStyle(fontSize: 18),),
                      Text('Following: ${userInfoModel.following}', style: const TextStyle(fontSize: 18)),
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
                    UserRepoModel userRepoModel = UserRepoModel.fromJson(repo);
                    return  ListTile(
                      title: Text(userRepoModel.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Language: ${repo['language'] ?? 'N/A'}'),
                          Text('Stars: ${repo['stargazers_count']}'),
                          Text(repo['description'] ?? ''),
                        ],
                      ),
                      onTap: (){
                        viewController.loadWebView(repo['html_url']);
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





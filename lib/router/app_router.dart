import 'package:flutter/material.dart';
import 'package:github_users/router/route_path.dart';
import 'package:github_users/view/user_list_screen.dart';
import 'package:github_users/view/user_repo_screen.dart';
import 'package:github_users/view/webview_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter createRouter({required GlobalKey<NavigatorState> navigatorKey}) {
    return GoRouter(
      navigatorKey: navigatorKey,
      debugLogDiagnostics: true,
      initialLocation: RoutePath.userListScreen,
      routes: [
        GoRoute(
          path: RoutePath.userListScreen,
          builder: (context, state) => const  UserListScreen(),
        ),
        GoRoute(
          path: RoutePath.userRepoScreen,
          builder: (context, state) => const UserRepoScreen(),
        ),
        GoRoute(
          path: RoutePath.webViewScreen,
          builder: (context, state) => const WebViewScreen(),
        ),
      ],
    );
  }
}


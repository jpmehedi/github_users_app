import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_users/controller/theme_controller.dart';
import 'package:github_users/router/app_router.dart';
import 'package:github_users/theme/custom_dark_theme.dart';
import 'package:github_users/theme/custom_light_theme.dart';
import 'package:github_users/utilities/global.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(
      child: MyApp(
        navigatorKey: navigatorKey,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.navigatorKey}); 
  final GlobalKey<NavigatorState> navigatorKey;
  @override
  Widget build(BuildContext context) {
    final goRouter = AppRouter.createRouter(
      navigatorKey: navigatorKey,
    );
    return Consumer(builder: (context, ref, child) {
      final themMode = ref.watch(themeModeProvider);
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: "Github Users",
        theme: CustomLightTheme.customLightTheme,
        darkTheme: CustomDarkTheme.customDarkTheme,
        themeMode: themMode,
        routeInformationParser: goRouter.routeInformationParser,
        routerDelegate: goRouter.routerDelegate,
        routeInformationProvider: goRouter.routeInformationProvider,
      );
    });
  }
}



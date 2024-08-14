

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_users/controller/web_view_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends ConsumerWidget {
  const WebViewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final webViewController = ref.watch(viewProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ), 
        backgroundColor: Colors.teal,
        title: const Text("Repository", style: TextStyle(color: Colors.white),),
      ),
      body: webViewController.loadingPercentage < 100 ? 
       const Center(child: CircularProgressIndicator()) : WebViewWidget(
        controller: webViewController.controller!,
      ),
    );
  }
}


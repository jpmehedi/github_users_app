import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';
final viewProvider = ChangeNotifierProvider((ref)=> ViewController());

class ViewController extends ChangeNotifier {
  WebViewController? controller;
  int _loadingPercentage = 0;
  int get loadingPercentage => _loadingPercentage;

  void loadWebView(String url){
    if (controller == null) {
      controller = WebViewController()
        ..setNavigationDelegate(NavigationDelegate(
          onPageStarted: (_) {
            _loadingPercentage = 0;
            notifyListeners();
          },
          onProgress: (progress) {
            _loadingPercentage = progress;
            notifyListeners();
          },
          onPageFinished: (_) {
            _loadingPercentage = 100;
            notifyListeners();
          },
        ))
        ..loadRequest(Uri.parse(url))
        ..setJavaScriptMode(JavaScriptMode.unrestricted);
    } else {
      controller!.loadRequest(Uri.parse(url));
    }
  }



}



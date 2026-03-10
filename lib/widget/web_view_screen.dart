import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String? url;

  const WebViewScreen({super.key, this.url});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    final url = widget.url ?? "";

    if (url.isEmpty) return;

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)

      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            debugPrint("Loading progress: $progress%");
          },

          onPageStarted: (url) {
            setState(() {
              isLoading = true;
            });
          },

          onPageFinished: (url) {
            setState(() {
              isLoading = false;
            });
          },

          onWebResourceError: (error) {
            debugPrint("WebView error: ${error.description}");
          },
        ),
      )

      ..loadRequest(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    if (widget.url == null || widget.url!.isEmpty) {
      return const Scaffold(
        body: Center(
          child: Text("Invalid URL"),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Web View"),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: controller),

          /// Loading Indicator
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
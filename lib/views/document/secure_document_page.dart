import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:flutter_windowmanager/flutter_windowmanager.dart';

class SecureDocumentPage extends StatefulWidget {
  final String imageUrl;
  final String title;

  const SecureDocumentPage({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  @override
  State<SecureDocumentPage> createState() => _SecureDocumentPageState();
}

class _SecureDocumentPageState extends State<SecureDocumentPage> {

  @override
  void initState() {
    super.initState();
    // _secureScreen();
  }

  @override
  void dispose() {
    // _clearSecure();
    super.dispose();
  }

  // Future<void> _secureScreen() async {
  //   if (Platform.isAndroid) {
  //     await FlutterWindowManager.addFlags(
  //       FlutterWindowManager.FLAG_SECURE,
  //     );
  //   }
  // }

  // Future<void> _clearSecure() async {
  //   if (Platform.isAndroid) {
  //     await FlutterWindowManager.clearFlags(
  //       FlutterWindowManager.FLAG_SECURE,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: InteractiveViewer(
          minScale: 1,
          maxScale: 4,
          child: Image.network(
            widget.imageUrl,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

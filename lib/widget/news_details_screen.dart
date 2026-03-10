import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:baby_eduction/const/design_constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
// import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart'; // PDF support commented

class NewsDetailsScreen extends StatelessWidget {
  final String? title;
  final String? des;
  final String? image;

  const NewsDetailsScreen({super.key, this.des, this.title, this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? ""),
      ),
      body: ListView(
        padding: kStandardPadding(),
        children: [
          _buildMediaWidget(image),
          const SizedBox(height: 16), // spacing
          HtmlWidget(
            des ?? "",
            textStyle: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  /// Returns image only (PDF temporarily disabled)
  Widget _buildMediaWidget(String? filePath) {
    if (filePath == null || filePath.isEmpty) return const SizedBox.shrink();

    // PDF support is commented out for now
    // if (_isPDF(filePath)) {
    //   return SizedBox(
    //     height: 250,
    //     width: double.infinity,
    //     child: PdfView(path: filePath),
    //   );
    // } else {

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
        imageUrl: filePath,
        height: 170,
        width: double.infinity,
        fit: BoxFit.contain,
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
    // }
  }

  // /// Simple PDF check
  // bool _isPDF(String filePath) {
  //   return filePath.toLowerCase().endsWith(".pdf");
  // }
}
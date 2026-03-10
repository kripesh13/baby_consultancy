import 'dart:io';

import 'package:baby_eduction/const/app_fonts.dart';
import 'package:baby_eduction/const/color_schemas.dart';
import 'package:baby_eduction/views/profile/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:image_picker/image_picker.dart';

final documentImagesProvider = StateProvider.family<List<XFile>, String>(
  (ref, docType) => [],
);

class DocumentUploadScreen extends ConsumerWidget {
  const DocumentUploadScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allDocs = [
      'Ward_Document',
      'Land_Document',
      'Family_Citizenship_Document',
    ];

    int uploadedCount = 0;
    for (var doc in allDocs) {
      if (ref.watch(documentImagesProvider(doc)).isNotEmpty) {
        uploadedCount++;
      }
    }

    final totalDocuments = 6;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Document Status',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              // Collect uploadedFiles metadata (titles and types) from your backend or state
              // For demonstration, sending empty list here, replace with actual
              final uploadedFiles = <UploadedFile>[];
              
              await ref.read(profileProvider).uploadDocuments(
                ref: ref,
                uploadedFiles: uploadedFiles,
              );
            },
            child: const Text(
              'Upload',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Progress Section
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '$uploadedCount/$totalDocuments',
                    style: const TextStyle(
                      color: Color(0xFF3D6D9E),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                // Progress bar
                Stack(
                  children: [
                    Container(
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: uploadedCount / totalDocuments,
                      child: Container(
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Positioned(
                      left: (MediaQuery.of(context).size.width - 40) *
                              (uploadedCount / totalDocuments) -
                          10,
                      top: -4,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Assignment Progress',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // Document List Section
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(
                  children: const [
                    DocumentCard(title: 'Ward Document', docType: 'Ward_Document'),
                    SizedBox(height: 12),
                    DocumentCard(title: 'Land Document', docType: 'Land_Document'),
                    SizedBox(height: 12),
                    DocumentCard(
                      title: 'Family_Citizenship_Document',
                      docType: 'Family_Citizenship_Document',
                    ),
                    SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DocumentCard extends ConsumerWidget {
  final String title;
  final String docType;

  const DocumentCard({super.key, required this.title, required this.docType});

  Future<void> _pickImages(BuildContext context, WidgetRef ref) async {
    final ImagePicker picker = ImagePicker();

    final source = await showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Choose Source'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: Text('Camera', style: kkBoldTextStyle()),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: Text('Gallery', style: kkBoldTextStyle()),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
          ],
        ),
      ),
    );

    if (source == null) return;

    try {
      if (source == ImageSource.camera) {
        final XFile? photo = await picker.pickImage(source: ImageSource.camera);
        if (photo != null) {
          final currentImages = ref.read(documentImagesProvider(docType));
          ref.read(documentImagesProvider(docType).notifier).state = [
            ...currentImages,
            photo,
          ];
        }
      } else {
        final List<XFile> images = await picker.pickMultiImage();
        if (images.isNotEmpty) {
          final currentImages = ref.read(documentImagesProvider(docType));
          ref.read(documentImagesProvider(docType).notifier).state = [
            ...currentImages,
            ...images,
          ];
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error picking images: $e')));
    }
  }

  void _removeImage(WidgetRef ref, int index, BuildContext context) {
    final currentImages = ref.read(documentImagesProvider(docType));
    final updatedImages = List<XFile>.from(currentImages);
    updatedImages.removeAt(index);
    ref.read(documentImagesProvider(docType).notifier).state = updatedImages;

    if (updatedImages.isEmpty) {
      Navigator.pop(context);
    }
  }

  void _viewImages(BuildContext context, WidgetRef ref) {
    final images = ref.read(documentImagesProvider(docType));

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$title (${images.length})',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Consumer(
                builder: (context, ref, _) {
                  final images = ref.watch(documentImagesProvider(docType));

                  return GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              File(images[index].path),
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: GestureDetector(
                              onTap: () {
                                _removeImage(ref, index, context);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final images = ref.watch(documentImagesProvider(docType));
    final isUploaded = images.isNotEmpty;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 1.5),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => _pickImages(context, ref),
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: isUploaded
                            ? const Color(0xFFE8F5E9)
                            : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        isUploaded
                            ? Icons.check_circle
                            : Icons.cloud_upload_outlined,
                        color: isUploaded
                            ? const Color(0xFF4CAF50)
                            : Colors.grey.shade600,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade800,
                            ),
                          ),
                          if (isUploaded)
                            Text(
                              '${images.length} file${images.length > 1 ? 's' : ''} uploaded',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (isUploaded)
                      IconButton(
                        icon: const Icon(
                          Icons.visibility,
                          color: Color(0xFF3D6D9E),
                          size: 24,
                        ),
                        onPressed: () => _viewImages(context, ref),
                      )
                    else
                      Icon(
                        Icons.upload_file,
                        color: Colors.grey.shade400,
                        size: 24,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

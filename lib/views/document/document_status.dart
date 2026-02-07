import 'package:baby_eduction/const/color_schemas.dart';
import 'package:baby_eduction/views/profile/model/student_document_model.dart';
import 'package:baby_eduction/views/profile/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DocumentStatusScreen extends ConsumerWidget {
  const DocumentStatusScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileProvider);

    final isLoading = profileState.isLoading;
    // final error = profileState.error;
    final model = profileState.studentDocumentModel;

    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // if (error != null) {
    //   return Scaffold(
    //     appBar: AppBar(title: const Text('Document Status')),
    //     // body: Center(child: Text(error)),
    //   );
    // }

    final data = model?.data;

    final seeDocs = extractUrls(data?.documents?.tENTHGRADESHEET);
    final lor1Docs = extractUrls(data?.documents?.lORI);
    final lor2Docs = extractUrls(data?.documents?.lORII);

    final otherDocs =
        extractUrls(data?.dynamicDocuments?.oTHERDOCUMENT);

    final wardDocs =
        extractUrls(data?.dynamicDocuments?.wARDDOCUMENT);

    final nocDocs =
        extractUrls(data?.dynamicDocuments?.nOCDOCUMENT);

    final allDocs = [
      seeDocs,
      lor1Docs,
      lor2Docs,
      otherDocs,
      wardDocs,
      nocDocs,
    ];

    final uploadedCount =
        allDocs.where((e) => e.isNotEmpty).length;

    const totalDocuments = 6;

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
      ),

      body: Column(
        children: [
          _buildProgressSection(
            context,
            uploadedCount,
            totalDocuments,
          ),

          const SizedBox(height: 10),

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
                padding: const EdgeInsets.all(20),
                child: ListView(
                  children: [
                    ReadOnlyDocumentCard(
                      title: 'SEE Certificate',
                      imageUrls: seeDocs,
                    ),
                    const SizedBox(height: 12),

                    ReadOnlyDocumentCard(
                      title: 'LOR I',
                      imageUrls: lor1Docs,
                    ),
                    const SizedBox(height: 12),

                    ReadOnlyDocumentCard(
                      title: 'LOR II',
                      imageUrls: lor2Docs,
                    ),
                    const SizedBox(height: 12),

                    ReadOnlyDocumentCard(
                      title: 'Other Documents',
                      imageUrls: otherDocs,
                    ),
                    const SizedBox(height: 12),

                    ReadOnlyDocumentCard(
                      title: 'Ward Documents',
                      imageUrls: wardDocs,
                    ),
                    const SizedBox(height: 12),

                    ReadOnlyDocumentCard(
                      title: 'NOC Documents',
                      imageUrls: nocDocs,
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

  Widget _buildProgressSection(
    BuildContext context,
    int uploaded,
    int total,
  ) {
    final progress = total == 0 ? 0.0 : uploaded / total;

    return Padding(
      padding: const EdgeInsets.all(20),
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
              '$uploaded/$total',
              style: const TextStyle(
                color: Color(0xFF3D6D9E),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(height: 12),

          LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;

              return Stack(
                children: [
                  Container(
                    height: 8,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  Container(
                    height: 8,
                    width: width * progress,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  Positioned(
                    left: width * progress - 8,
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
              );
            },
          ),

          const SizedBox(height: 16),

          const Text(
            'Assignment Progress',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

/* ---------------- HELPER FUNCTIONS ---------------- */

List<String> extractUrls(List<dynamic>? docs) {
  if (docs == null) return [];

  return docs
      .map((doc) {
        if (doc is TENTHGRADESHEET) return doc.path;
        if (doc is LORII) return doc.path;
        if (doc is OTHERDOCUMENT) return doc.file?.path;
        if (doc is WARDDOCUMENT) return doc.file?.path;
        return null;
      })
      .whereType<String>()
      .toList();
}

/* ---------------- CARD WIDGET ---------------- */

class ReadOnlyDocumentCard extends StatelessWidget {
  final String title;
  final List<String> imageUrls;

  const ReadOnlyDocumentCard({
    super.key,
    required this.title,
    required this.imageUrls,
  });

  void _viewImages(BuildContext context) {
    if (imageUrls.isEmpty) return;

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
              padding: const EdgeInsets.all(16),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$title (${imageUrls.length})',
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
              child: GridView.builder(
                padding: const EdgeInsets.all(16),

                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),

                itemCount: imageUrls.length,

                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),

                    child: Image.network(
                      imageUrls[index],
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) {
                        return Container(
                          color: Colors.grey.shade200,
                          child: const Icon(Icons.broken_image),
                        );
                      },
                    ),
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
  Widget build(BuildContext context) {
    final isUploaded = imageUrls.isNotEmpty;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 1.5),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),

      child: Material(
        color: Colors.transparent,

        child: InkWell(
          onTap: isUploaded ? () => _viewImages(context) : null,

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
                        : Icons.cloud_off,

                    color: isUploaded
                        ? const Color(0xFF4CAF50)
                        : Colors.grey.shade600,
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
                          '${imageUrls.length} file${imageUrls.length > 1 ? 's' : ''} uploaded',

                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                    ],
                  ),
                ),

                if (isUploaded)
                  const Icon(
                    Icons.visibility,
                    color: Color(0xFF3D6D9E),
                  )
                else
                  Icon(
                    Icons.block,
                    color: Colors.grey.shade400,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:baby_eduction/const/design_constant.dart';
import 'package:baby_eduction/views/profile/model/student_document_model.dart';
import 'package:baby_eduction/views/profile/provider/profile_provider.dart';
import 'package:baby_eduction/widget/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'secure_document_page.dart';

class StudentDocumentsPage extends ConsumerStatefulWidget {
  const StudentDocumentsPage({super.key});

  @override
  ConsumerState<StudentDocumentsPage> createState() =>
      _StudentDocumentsPageState();
}

class _StudentDocumentsPageState extends ConsumerState<StudentDocumentsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(profileProvider).getStudentDocument();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(profileProvider).studentDocumentModel?.data;

    return Scaffold(
      body: data == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBarWidget(),
                  Padding(
                    padding: kStandardPadding(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Student Documents",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        heightBox(10),
                        Divider(thickness: 2),

                        if (data.moiDetail != null) ...[
                          _sectionTitle("MOI Detail"),
                          _infoCard(data.moiDetail),
                        ],

                        if (data.documents != null) _sectionTitle("Documents"),
                        ..._buildStaticDocuments(context, data.documents!),
                        if (data.dynamicDocuments != null)
                          _sectionTitle("Other Documents"),
                        ..._buildDynamicDocuments(
                          context,
                          data.dynamicDocuments!,
                        ),
                      ],
                    ),
                  ),

                  heightBox(100),
                ],
              ),
            ),
    );
  }

  // -------------------- UI HELPERS --------------------
  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _infoCard(dynamic detail) {
    if (detail == null) return const SizedBox();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _infoRow("Name", detail.recommenderName),
            _infoRow("Designation", detail.recommenderDesignation),
            _infoRow("Organization", detail.organizationName),
            _infoRow("Email", detail.email),
            _infoRow("Contact", detail.contactNumber),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String? value) {
    if (value == null || value.isEmpty) return const SizedBox();
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text("$label: $value"),
    );
  }

  // For static documents - build ExpansionTiles manually for each field
  List<Widget> _buildStaticDocuments(BuildContext context, Documents docs) {
    List<Widget> widgets = [];

    if (docs.lORII != null && docs.lORII!.isNotEmpty) {
      widgets.add(
        ExpansionTile(
          title: const Text("LOR II"),
          children: docs.lORII!
              .map(
                (doc) => _documentTile(
                  context,
                  doc.fileName ?? "",
                  doc.path ?? "",
                  "LOR II",
                ),
              )
              .toList(),
        ),
      );
    }

    if (docs.tENTHGRADESHEET != null && docs.tENTHGRADESHEET!.isNotEmpty) {
      widgets.add(
        ExpansionTile(
          title: const Text("Tenth Gradesheet"),
          children: docs.tENTHGRADESHEET!
              .map(
                (doc) => _documentTile(
                  context,
                  doc.fileName ?? "",
                  doc.path ?? "",
                  "Tenth Gradesheet",
                ),
              )
              .toList(),
        ),
      );
    }

    if (docs.lORI != null && docs.lORI!.isNotEmpty) {
      widgets.add(
        ExpansionTile(
          title: const Text("LOR I"),
          children: docs.lORI!
              .map(
                (doc) => _documentTile(
                  context,
                  doc.fileName ?? "",
                  doc.path ?? "",
                  "LOR I",
                ),
              )
              .toList(),
        ),
      );
    }

    return widgets;
  }

  // For dynamic documents - build ExpansionTiles manually as well
  List<Widget> _buildDynamicDocuments(
    BuildContext context,
    DynamicDocuments docs,
  ) {
    List<Widget> widgets = [];

    if (docs.oTHERDOCUMENT != null && docs.oTHERDOCUMENT!.isNotEmpty) {
      widgets.add(
        ExpansionTile(
          title: const Text("Other Documents"),
          children: docs.oTHERDOCUMENT!
              .map(
                (item) => _documentTile(
                  context,
                  item.title ?? "",
                  item.file?.path ?? "",
                  "Other Documents",
                ),
              )
              .toList(),
        ),
      );
    }

    if (docs.wARDDOCUMENT != null && docs.wARDDOCUMENT!.isNotEmpty) {
      widgets.add(
        ExpansionTile(
          title: const Text("Ward Documents"),
          children: docs.wARDDOCUMENT!
              .map(
                (item) => _documentTile(
                  context,
                  item.title ?? "",
                  item.file?.path ?? "",
                  "Ward Documents",
                ),
              )
              .toList(),
        ),
      );
    }

    if (docs.nOCDOCUMENT != null && docs.nOCDOCUMENT!.isNotEmpty) {
      widgets.add(
        ExpansionTile(
          title: const Text("NOC Documents"),
          children: docs.nOCDOCUMENT!
              .map(
                (item) => _documentTile(
                  context,
                  item.title ?? "",
                  item.file?.path ?? "",
                  "NOC Documents",
                ),
              )
              .toList(),
        ),
      );
    }

    return widgets;
  }

  Widget _documentTile(
    BuildContext context,
    String title,
    String path,
    String section,
  ) {
    return ListTile(
      leading: const Icon(Icons.insert_drive_file),
      title: Text(title),
      subtitle: Text(section),
      trailing: const Icon(Icons.visibility),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => SecureDocumentPage(imageUrl: path, title: title),
          ),
        );
      },
    );
  }
}

import 'dart:convert';
import 'dart:io' as io;

import 'package:baby_eduction/routes/route_names.dart';
import 'package:baby_eduction/storage/secure_storage_service.dart';
import 'package:baby_eduction/storage/storage_key.dart';
import 'package:baby_eduction/utils/bot_toast.dart';
import 'package:baby_eduction/utils/custom_navigator.dart';
import 'package:baby_eduction/views/document/add_document_screen.dart';
import 'package:baby_eduction/views/profile/model/profile_model.dart';
import 'package:baby_eduction/views/profile/model/student_document_model.dart';
import 'package:baby_eduction/views/profile/repo/profile_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final profileProvider = ChangeNotifierProvider<ProfileNotifier>(
  (ref) => ProfileNotifier(ref),
);

class ProfileNotifier extends ChangeNotifier {
  final Ref ref;

  ProfileModel? profile;
  StudentDocumentModel? studentDocumentModel;
  bool isLoading = false;
  Object? error;
  StackTrace? stackTrace;

  ProfileNotifier(this.ref) {
    fetchProfile();
    getStudentDocument();
  }

  // bool _mounted = true;

  // @override
  // void dispose() {
  //   _mounted = false;
  //   super.dispose();
  // }

   bool _mounted = true;

  @override
  void dispose() {
    _mounted = false;
    super.dispose();
  }

  Future<void> fetchProfile({BuildContext? context}) async {
    // if (!_mounted) return;

    isLoading = true;
    error = null;
    if (_mounted) notifyListeners();

    try {
      final repo = ref.read(profileRepo);
      profile = await repo.getProfile();

      // if (!_mounted) return;

      notifyListeners();
      final userId = profile?.data?.id;
      if (userId != null) {
        await SecureStorageService().write(
          key: StorageKeys.userId,
          value: userId.toString(),
        );
      } else {
        print("Warning: userId is null, cannot save");
      }

      if (context != null) {
        if (profile?.data?.personalDetail?.isPasswordResetRequired == true) {
          CustomNavigator.push(context, RouteNames.changePassword);
        } else {
          CustomNavigator.pushReplace(context, RouteNames.navBraScreen);
        }
      }
    } catch (e, st) {
      // if (!_mounted) return;
      error = e;
      stackTrace = st;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }


  Future getStudentDocument() async {
    final String? id =
        await SecureStorageService().read(key: StorageKeys.userId) ??
            profile?.data?.id?.toString();
    try {
      final repo = ref.read(profileRepo);
      studentDocumentModel = await repo.getDocument(studentId: id);
      notifyListeners();
    } catch (e) {}
  }

  Future<void> uploadDocuments({
    required WidgetRef ref,
    required List<UploadedFile> uploadedFiles,
  }) async {
    loading(visible: true);
    final formData = FormData();

    final String? id =
        await SecureStorageService().read(key: StorageKeys.userId) ??
            profile?.data?.id?.toString();

    const documentGroups = [
      'Ward_Document',
      'Land_Document',
      'Family_Citizenship_Document',
      'Other_Document',
    ];

    final List<Map<String, dynamic>> dynamicDocs = [];

    for (final uploadedFile in uploadedFiles) {
      dynamicDocs.add({
        "title": uploadedFile.title,
        "dynamicDocumentType": uploadedFile.type,
      });
    }

    print("Uploaded Files: ${uploadedFiles.map((e) => e.title).toList()}");
    for (final group in documentGroups) {
      final files = ref.read(documentImagesProvider(group));
      if (files.isEmpty) continue;

      for (int i = 0; i < files.length; i++) {
        final file = files[i];
        final fileExists = await io.File(file.path).exists();
        if (!fileExists) continue;

        final key =
            i == 0 ? group.toUpperCase() : '${group.toUpperCase()}${i + 1}';

        formData.files.add(
          MapEntry(
            key,
            await MultipartFile.fromFile(
              file.path,
              filename: file.name,
            ),
          ),
        );

        dynamicDocs.add({
          "title": file.name,
          "dynamicDocumentType": key,
        });
      }
    }

    final studentPayload = {
      "studentId": id,
      "moiDetail": {
        "referenceType": "",
        "recommenderName": "",
        "recommenderDesignation": "",
        "relationWithApplicant": "",
        "contactNumber": "",
        "email": "",
        "organizationName": "",
        "organizationAddress": "",
      },
      "firstLorDetail": {
        "referenceType": "test",
        "recommenderName": "test",
        "recommenderDesignation": "test",
        "relationWithApplicant": "test",
        "contactNumber": "9816371621",
        "email": "test@gmail.com",
        "organizationName": "test",
        "organizationAddress": "test",
      },
      "dynamicDocumentDetails": dynamicDocs,
    };

    formData.fields.add(MapEntry("student", jsonEncode(studentPayload)));

    try {
      final repo = ref.read(profileRepo);
      await repo.uploadDocuments(formData: formData);

      await getStudentDocument();
      loading(visible: false);
    } catch (e) {
      print("Error uploading documents: $e");
      loading(visible: false);
    }
    loading(visible: false);
  }
}

class UploadedFile {
  final String title;
  final String type;
  UploadedFile({required this.title, required this.type});
}

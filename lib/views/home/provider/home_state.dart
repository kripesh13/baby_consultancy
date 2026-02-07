import 'package:baby_eduction/utils/bot_toast.dart';
import 'package:baby_eduction/views/home/model/university_model.dart';
import 'package:baby_eduction/views/home/repo/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final homeStateProvider = ChangeNotifierProvider<HomeState>(
  (ref) => HomeState(ref),
);

class HomeState extends ChangeNotifier {
  HomeState(this.ref) {
    getUniversity();
  }

  final Ref ref;

  bool isLoading = false;
  String? errorMessage;
  UniversityModel? universityModel;
  Future<void> getUniversity() async {
    try {
      // isLoading = true;
      // errorMessage = null;
      // notifyListeners();
      loading(visible: true);

      final response = await ref.read(homeRepo).getUniversity();
      universityModel = response;
      notifyListeners();
    } catch (e, s) {
      loading(visible: false);
      print(s);
      print(e);
      errorMessage = e.toString();
    } finally {
      loading(visible: false);
    }
  }
}

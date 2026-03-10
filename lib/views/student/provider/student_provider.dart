import 'package:baby_eduction/views/student/model/testimonial_model.dart';
import 'package:baby_eduction/views/student/repo/student_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final studentProvider = ChangeNotifierProvider<StudentProvider>((ref) {
  return StudentProvider(ref);
});

class StudentProvider extends ChangeNotifier {
  final Ref ref;

  StudentProvider(this.ref) {
    getTestimonial();
  }

  bool isLoading = false;

  TestimonialModel? testimonialModel;

  getTestimonial() async {
    isLoading = true;
    notifyListeners();
    try {
      ref.read(studentRepo).getTestimonial().then((value) {
        testimonialModel = value;
        notifyListeners();
      });
    } catch (e) {
      isLoading = false;
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
  }
}

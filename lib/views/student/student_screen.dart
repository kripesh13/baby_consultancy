import 'package:baby_eduction/const/design_constant.dart';
import 'package:baby_eduction/widget/app_bar_widget.dart';
import 'package:baby_eduction/widget/university_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StudentScreen extends ConsumerWidget {
  const StudentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarWidget(),
            ListView.separated(
              padding: kStandardPadding(),
              separatorBuilder: (context, index) {
                return heightBox(12);
              },
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return UniversityTile();
              },
            ),
            heightBox(50),

          ],
        ),
      ),
    );
  }
}


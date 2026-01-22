import 'package:baby_eduction/const/design_constant.dart';
import 'package:baby_eduction/views/home/provider/home_state.dart';
import 'package:baby_eduction/widget/app_bar_widget.dart';
import 'package:baby_eduction/widget/university_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StudentScreen extends ConsumerWidget {
  const StudentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeStateProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarWidget(),
            state.isLoading == true
                ? Center(child: CircularProgressIndicator())
                : ListView.separated(
                    separatorBuilder: (context, index) {
                      return heightBox(12);
                    },
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.universityModel?.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return UniversityTile(
                        data: state.universityModel?.data?[index],
                      );
                    },
                  ),
            heightBox(50),
          ],
        ),
      ),
    );
  }
}

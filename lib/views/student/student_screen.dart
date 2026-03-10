import 'package:baby_eduction/const/design_constant.dart';
import 'package:baby_eduction/views/home/provider/home_state.dart';
import 'package:baby_eduction/views/student/model/testimonial_model.dart';
import 'package:baby_eduction/views/student/provider/student_provider.dart';
import 'package:baby_eduction/widget/app_bar_widget.dart';
import 'package:baby_eduction/widget/university_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../const/app_fonts.dart';

class StudentScreen extends ConsumerWidget {
  const StudentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(studentProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarWidget(),
            state.isLoading == true
                ? Center(child: CircularProgressIndicator())
                : ListView.separated(
                    separatorBuilder: (context, index) {
                      return heightBox(4);
                    },
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.testimonialModel?.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      var data = state.testimonialModel?.data?[index];
                      return TestimonialModel(
                        data: data,
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

class TestimonialModel extends StatelessWidget {
  final TestimonialData? data;

  const TestimonialModel({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    if (data == null) return const SizedBox();

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.grey.shade200,
                  backgroundImage: data?.file?.path != null
                      ? NetworkImage(data!.file!.path!)
                      : null,
                  child: data?.file?.path == null
                      ? const Icon(Icons.person, size: 32)
                      : null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data?.studentName ?? 'Student Name',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        data?.universityName ?? 'University Name',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Text(
              data?.courseName ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),

            Text(
              "• ${data?.location!}",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade600,
              ),
            ),

            /// Course + Location
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     if (data?.courseName != null)
            //       Expanded(
            //         child:
            //       ),
            //     if (data?.location != null) ...[
            //       const SizedBox(width: 6),
            //       Flexible(
            //         child:
            //       ),
            //     ],
            //   ],
            // ),

            // const SizedBox(height: 12),

            /// Description
            // Text(
            //   data?.description ?? '',
            //   maxLines: 4,
            //   overflow: TextOverflow.ellipsis,
            //   style: kkBoldTextStyle(),
            // ),
          ],
        ),
      ),
    );
  }
}

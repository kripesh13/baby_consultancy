import 'package:baby_eduction/const/app_fonts.dart';
import 'package:baby_eduction/const/asset_path.dart';
import 'package:baby_eduction/const/color_schemas.dart';
import 'package:baby_eduction/const/design_constant.dart';
import 'package:baby_eduction/widget/app_bar_widget.dart';
import 'package:baby_eduction/widget/star_tile.dart';
import 'package:baby_eduction/widget/template_card.dart';
import 'package:baby_eduction/widget/university_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppBarWidget(),
          heightBox(8),
          Padding(
            padding: kStandardPadding(),
            child: Column(
              children: [
                Row(
                  children: [
                    StatTile(title: "Country", value: "20"),
                    SizedBox(width: 10),
                    StatTile(title: "University", value: "99"),
                    SizedBox(width: 10),
                    StatTile(title: "Visa Guaranteed", value: "50"),
                  ],
                ),
                heightBox(20),
                sectionHeader("Template"),
                // heightBox(8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      3,
                      (index) => Padding(
                        padding: EdgeInsets.only(
                          right: 4.w,
                          bottom: 8.h,
                          top: 10.h,
                          left: 4.w,
                        ),
                        child: TemplateCard(
                          image: AssetPath.university1,
                          title: "Sop",
                        ),
                      ),
                    ),
                  ),
                ),

                heightBox(12),

                sectionHeader("Guaranteed Visa Guidance"),
                ListView.separated(
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

                //
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget sectionHeader(String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: kkBoldTextStyle().copyWith(
          color: AppColors.primaryColor.withOpacity(0.9),
          fontSize: 16.sp,
        ),
      ),
      Text(
        "see all",
        style: kBoldTextStyle().copyWith(
          color: AppColors.primaryColor.withOpacity(0.9),
          fontWeight: FontWeight.w700,
        ),
      ),
    ],
  );
}

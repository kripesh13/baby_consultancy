import 'package:baby_eduction/const/app_fonts.dart';
import 'package:baby_eduction/const/asset_path.dart';
import 'package:baby_eduction/const/color_schemas.dart';
import 'package:baby_eduction/const/design_constant.dart';
import 'package:baby_eduction/network/notification_service.dart';
import 'package:baby_eduction/views/home/provider/home_state.dart';
import 'package:baby_eduction/widget/app_bar_widget.dart';
import 'package:baby_eduction/widget/star_tile.dart';
import 'package:baby_eduction/widget/template_card.dart';
import 'package:baby_eduction/widget/university_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    NotificationServices.instance.initialize(context);
  }

  @override
  void dispose() {
    // Clean up any resources if needed (controllers, subscriptions, etc.)
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Watch the provider (same as before)
    final state = ref.watch(homeStateProvider);

    return SingleChildScrollView(
      child: Column(
        children: [
          const AppBarWidget(),
          SizedBox(height: 8.h), // using .h from screenutil
          
          state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: kStandardPadding(),
                  child: Column(
                    children: [
                      // Stats row
                      Row(
                        children: [
                          StatTile(title: "Country", value: "20"),
                          SizedBox(width: 10.w),
                          StatTile(
                            title: "University",
                            value: state.universityModel?.data?.length.toString() ?? "0",
                          ),
                          SizedBox(width: 10.w),
                          const StatTile(title: "Visa Guaranteed", value: "50"),
                        ],
                      ),
                      
                      SizedBox(height: 20.h),

                      // Uncomment if you want to bring back templates later
                      // sectionHeader("Template"),
                      // SizedBox(height: 8.h),
                      // SingleChildScrollView(
                      //   scrollDirection: Axis.horizontal,
                      //   child: Row(
                      //     children: List.generate(
                      //       3,
                      //       (index) => Padding(
                      //         padding: EdgeInsets.only(
                      //           right: 4.w,
                      //           bottom: 8.h,
                      //           top: 10.h,
                      //           left: 4.w,
                      //         ),
                      //         child: TemplateCard(
                      //           image: AssetPath.university1,
                      //           title: "Sop",
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      SizedBox(height: 12.h),

                      sectionHeader("Guaranteed Visa Guidance"),

                      ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(height: 12.h),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.universityModel?.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          final university = state.universityModel?.data?[index];
                          if (university == null) return const SizedBox.shrink();
                          
                          return UniversityTile(data: university);
                        },
                      ),

                      // You can add more sections here later
                    ],
                  ),
                ),
        ],
      ),
    );
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
        // Uncomment if you want "see all" later
        // Text(
        //   "see all",
        //   style: kBoldTextStyle().copyWith(
        //     color: AppColors.primaryColor.withOpacity(0.9),
        //     fontWeight: FontWeight.w700,
        //   ),
        // ),
      ],
    );
  }
}
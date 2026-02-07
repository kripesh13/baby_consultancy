import 'package:baby_eduction/const/app_fonts.dart';
import 'package:baby_eduction/const/color_schemas.dart';
import 'package:baby_eduction/views/home/model/university_model.dart';
import 'package:baby_eduction/views/home/provider/home_state.dart';
import 'package:baby_eduction/widget/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:baby_eduction/const/design_constant.dart';

class UniversityScreen extends ConsumerWidget {
  const UniversityScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeStateProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarWidget(),
              SizedBox(height: 20.h),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: state.universityModel?.data?.length ?? 0,

                itemBuilder: (context, index) {
                  final data = state.universityModel?.data?[index];
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          data?.programName ?? "",
                          style: kkBoldTextStyle().copyWith(),
                        ),
                      ),
                      heightBox(10),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: UniversityCard(data: data),
                      ),
                    ],
                  );
                },
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

class UniversityCard extends StatelessWidget {
  final UniversityData? data;

  const UniversityCard({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_TopBannerCard(), heightBox(16), _DetailsCard(data!)],
    );
  }
}

/// ------------------------------
/// TOP BANNER CARD
/// ------------------------------
class _TopBannerCard extends StatelessWidget {
  const _TopBannerCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: const Color(0xFFBCD6EC66).withOpacity(0.6),
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Wrap(
        spacing: 8.w,
        runSpacing: 8.h,
        children: [
          _tag("Major city", const Color(0xFFA91D54)),
          _tag("Faster Offer TAT", const Color(0xFF1E67ED)),
          _tag("Eligible Non Collateral Loan", const Color(0xFF0091FF)),
          _tag("Scholarship available", const Color(0xFF00A348)),
        ],
      ),
    );
  }
}

/// ------------------------------
/// DETAILS CARD
/// ------------------------------
class _DetailsCard extends StatelessWidget {
  final UniversityData data;

  const _DetailsCard(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: _DetailsSection(data),
    );
  }
}

/// ------------------------------
/// DETAILS CONTENT
/// ------------------------------
class _DetailsSection extends StatelessWidget {
  final UniversityData data;

  const _DetailsSection(this.data);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _infoRow(Icons.school_outlined, data.universityName ?? ""),
        _infoRow(
          Icons.public_outlined,
          data.country ?? "United State Of America",
        ),
        _infoRow(Icons.timer_outlined, "Duration: ${data.duration ?? ""}"),
        SizedBox(height: 20.h),
        Text(
          "Admission Requirement",
          style: kBoldTextStyle().copyWith(color: const Color(0xFF1B4F72)),
        ),
        SizedBox(height: 12.h),
        _scoreTile(
          "ITEP Score: ${data.pteScore ?? ""}",
          const Color(0xFFF9E7ED),
          const Color(0xFFA91D54),
        ),
        _scoreTile(
          "IELTS Score ${data.ieltsScore ?? ""}",
          const Color(0xFFE8EFFF),
          const Color(0xFF1E67ED),
        ),
        _scoreTile(
          "PTE Score ${data.pteScore ?? ""}",
          const Color(0xFFE6F4EA),
          const Color(0xFF00A348),
        ),
        _scoreTile(
          "TOEFL Score ${data.toeflScore ?? ""}",
          const Color(0xFFE1F5FE),
          const Color(0xFF0091FF),
        ),
        SizedBox(height: 20.h),
        _rankingRow(),
      ],
    );
  }
}

/// ------------------------------
/// HELPER WIDGETS
/// ------------------------------
Widget _tag(String label, Color color) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(20.r),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.grid_view_rounded, size: 12.sp, color: Colors.white),
        SizedBox(width: 5.w),
        Text(label, style: sBoldTextStyle().copyWith(color: Colors.white)),
      ],
    ),
  );
}

Widget _scoreTile(String text, Color bgColor, Color textColor) {
  return Container(
    margin: EdgeInsets.only(bottom: 8.h),
    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(25.r),
    ),
    child: Row(
      children: [
        Icon(Icons.grid_view_rounded, size: 14.sp, color: textColor),
        SizedBox(width: 10.w),
        Expanded(
          child: Text(text, style: kBoldTextStyle().copyWith(color: textColor)),
        ),
      ],
    ),
  );
}

Widget _infoRow(IconData icon, String text) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 6.h),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18.sp, color: Colors.black54),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            text,
            style: kTextStyle().copyWith(color: Colors.black87),
          ),
        ),
      ],
    ),
  );
}

Widget _rankingRow() {
  return Row(
    children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Text(
          "365",
          style: kkBoldTextStyle().copyWith(color: Colors.white, fontSize: 12),
        ),
      ),
      SizedBox(width: 12.w),
      Expanded(
        child: Text(
          "In Webometric ranking of United State Of America National",
          style: kkBoldTextStyle().copyWith(
            fontSize: 16,
            color: Color(0xFF24272C),
          ),
        ),
      ),
    ],
  );
}
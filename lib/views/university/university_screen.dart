import 'package:baby_eduction/const/app_fonts.dart';
import 'package:baby_eduction/const/color_schemas.dart';
import 'package:baby_eduction/widget/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:baby_eduction/const/design_constant.dart'; // Assuming your font styles are here

class UniversityScreen extends StatelessWidget {
  const UniversityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          // Makes the whole screen scrollable
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarWidget(),
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "B. A In Anthropology",
                  style: kkBoldTextStyle().copyWith(
                    // color: const Color(0xFF1B4F72),
                  ),
                ),
              ),
              heightBox(10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: const UniversityCard(),
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
  const UniversityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [_TopBannerCard(), heightBox(16), _DetailsCard()]);
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
  const _DetailsCard();

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
      child: const _DetailsSection(),
    );
  }
}

/// ------------------------------
/// DETAILS CONTENT
/// ------------------------------
class _DetailsSection extends StatelessWidget {
  const _DetailsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _infoRow(
          Icons.school_outlined,
          "State University of New York Oswego (SUNY Oswego) (Oswego, New York)",
        ),
        _infoRow(Icons.public_outlined, "United State Of America"),
        _infoRow(Icons.timer_outlined, "Duration: 48 Months"),
        SizedBox(height: 20.h),
        Text(
          "Admission Requirement",
          style: kBoldTextStyle().copyWith(color: const Color(0xFF1B4F72)),
        ),
        SizedBox(height: 12.h),
        _scoreTile(
          "GPA: 2.5     ITEP Score: 4.0",
          const Color(0xFFF9E7ED),
          const Color(0xFFA91D54),
        ),
        _scoreTile(
          "IELTS Score (6)",
          const Color(0xFFE8EFFF),
          const Color(0xFF1E67ED),
        ),
        _scoreTile(
          "PTE Score (55)",
          const Color(0xFFE6F4EA),
          const Color(0xFF00A348),
        ),
        _scoreTile(
          "TOEFL Score",
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

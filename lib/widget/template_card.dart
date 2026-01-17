import 'package:baby_eduction/const/app_fonts.dart';
import 'package:baby_eduction/const/asset_path.dart';
import 'package:baby_eduction/const/color_schemas.dart';
import 'package:baby_eduction/const/design_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TemplateCard extends StatelessWidget {
  final String image;
  final String title;

  const TemplateCard({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      height: 80.h,
      margin: EdgeInsets.only(right: 8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(2, 2),
            blurRadius: 5,
            color: Color.fromARGB(255, 199, 202, 202),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(6.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: kkBoldTextStyle().copyWith(fontSize: 12.sp),
                  ),
                ),
                SvgPicture.asset(AssetPath.download),
              ],
            ),
            SizedBox(height: 4.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: Image.asset(
                image,
                height: 50.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// class TemplateCard extends StatelessWidget {
//   final String image;
//   final String title;

//   const TemplateCard({
//     super.key,
//     required this.image,
//     required this.title,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 140.w, // 👈 IMPORTANT
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: Colors.white,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(12),
//             child: Image.asset(
//               image,
//               height: 90.h,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//           ),
//           heightBox(8),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 8.w),
//             child: Text(
//               title,
//               style: kBoldTextStyle(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

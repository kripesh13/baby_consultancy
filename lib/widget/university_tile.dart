import 'package:baby_eduction/const/app_fonts.dart';
import 'package:baby_eduction/const/asset_path.dart';
import 'package:baby_eduction/const/design_constant.dart';
import 'package:baby_eduction/views/home/model/university_model.dart';
import 'package:baby_eduction/widget/k_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class UniversityTile extends StatelessWidget {
  final UniversityData ? data;

  const UniversityTile({
    super.key,
     this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// IMAGE
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.r),
              topRight: Radius.circular(8.r),
            ),
            child: KCachedNetworkImage(
              borderRadius: 0,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
              isNetwork: data?.websiteUrl != null, // or logo/image field
              image: data?.websiteUrl ?? AssetPath.university1,
            ),
          ),

          Padding(
            padding: EdgeInsets.all(12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// COUNTRY
                Row(
                  children: [
                    Text(
                      _countryFlag(data?.country),
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    widthBox(6),
                    Text(
                      data?.country ?? 'N/A',
                      style: kBoldTextStyle(),
                    ),
                  ],
                ),

                heightBox(6),

                /// UNIVERSITY NAME
                Text(
                  data?.universityName ?? 'Unknown University',
                  style: kkBoldTextStyle(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                heightBox(4),

                /// STUDY LEVEL / PROGRAM
                if (data?.programName != null)
                  Text(
                    data?.programName ?? "",
                    style: kTextStyle(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Convert country name to emoji flag
  String _countryFlag(String? country) {
    switch (country?.toLowerCase()) {
      case 'uk':
      case 'united kingdom':
        return '🇬🇧';
      case 'usa':
      case 'united states':
        return '🇺🇸';
      case 'australia':
        return '🇦🇺';
      case 'canada':
        return '🇨🇦';
      default:
        return '🌍';
    }
  }
}

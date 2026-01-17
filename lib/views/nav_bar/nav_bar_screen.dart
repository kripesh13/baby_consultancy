import 'package:baby_eduction/const/app_fonts.dart';
import 'package:baby_eduction/const/asset_path.dart';
import 'package:baby_eduction/const/color_schemas.dart';
import 'package:baby_eduction/const/design_constant.dart';
import 'package:baby_eduction/views/home/home_screen.dart';
import 'package:baby_eduction/views/profile/profile_screen.dart';
import 'package:baby_eduction/views/student/student_screen.dart';
import 'package:baby_eduction/views/university/university_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_svg/flutter_svg.dart';


final bottomNavIndexProvider = StateProvider<int>((ref) => 0);

class NavBarScreen extends ConsumerWidget {
  NavBarScreen({super.key});

  final List<Widget> pages = [
    HomeScreen(),
    StudentScreen(),
    UniversityScreen(),
    ProfileScreen(),
  ];

  final List<String> pagesLabel = ["Home", "Student", "University", "Profile"];

  final List<String> _icons = const [
    AssetPath.home,
    AssetPath.student,
    AssetPath.university,
    AssetPath.profile,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(bottomNavIndexProvider);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBody: true,
      body: pages[selectedIndex],
      bottomNavigationBar: Container(
        height: 95,
        color: Colors.transparent,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(height: 35, color: AppColors.primaryColor),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: CurvedNavigationBar(
                index: selectedIndex,
                height: 60,
                animationDuration: const Duration(milliseconds: 400),
                backgroundColor: Colors.transparent,
                color: AppColors.primaryColor,
                buttonBackgroundColor: AppColors.primaryColor,
                onTap: (index) {
                  ref.read(bottomNavIndexProvider.notifier).state = index;
                },
                items: List.generate(_icons.length, (index) {
                  final isSelected = selectedIndex == index;
                  return SvgPicture.asset(
                    _icons[index],
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      isSelected
                          ? AppColors.whiteColor
                          : AppColors.whiteColor.withOpacity(0.7),
                      BlendMode.srcIn,
                    ),
                  );
                }),
              ),
            ),
            Positioned(
              bottom: 8,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(pagesLabel.length, (index) {
                  final isSelected = selectedIndex == index;
                  return SizedBox(
                    width: screenWidth / pagesLabel.length,
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          ref.read(bottomNavIndexProvider.notifier).state =
                              index;
                        },
                        child: Text(
                          pagesLabel[index],
                          style: kTextStyle().copyWith(
                            color: isSelected
                                ? AppColors.whiteColor
                                : AppColors.whiteColor.withOpacity(0.7),
                            fontSize: 13,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

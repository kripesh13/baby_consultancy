import 'package:baby_eduction/routes/route_names.dart';
import 'package:baby_eduction/utils/custom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:baby_eduction/const/app_fonts.dart';
import 'package:baby_eduction/const/color_schemas.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
      decoration: const BoxDecoration(color: AppColors.primaryColor),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => _showDocumentMenu(context),
                  child: const Icon(Icons.menu, color: Colors.white, size: 26),
                ),
                Stack(
                  children: const [
                    Icon(
                      Icons.notifications_none,
                      color: Colors.white,
                      size: 26,
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            /// Search
            Container(
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.grey),
                  const SizedBox(width: 10),
                  Text(
                    "Search anything",
                    style: kkTextStyle().copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showDocumentMenu(BuildContext context) {
  final RenderBox overlay =
      Overlay.of(context).context.findRenderObject() as RenderBox;

  showMenu<int>(
    context: context,
    position: RelativeRect.fromRect(
      const Offset(20, 80) & const Size(40, 40),
      Offset.zero & overlay.size,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    items: [
      PopupMenuItem<int>(
        value: 0,
        padding: EdgeInsets.zero,
        onTap: () {
          CustomNavigator.push(context, RouteNames.documentUploadScreen);
        },
        child: _menuItem(
          icon: Icons.description_outlined,
          title: "Consultancy Document",
        ),
      ),
      const PopupMenuDivider(),
      PopupMenuItem<int>(
        value: 1,
        padding: EdgeInsets.zero,
        onTap: () {
          CustomNavigator.push(context, RouteNames.documentStatusScreen);
        },
        child: _menuItem(
          icon: Icons.fact_check_outlined,
          title: "Document Status",
        ),
      ),
    ],
  );
}

Widget _menuItem({required IconData icon, required String title}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    child: Row(
      children: [
        Icon(icon, size: 22),
        const SizedBox(width: 14),
        Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}

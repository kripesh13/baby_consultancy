import 'package:baby_eduction/const/design_constant.dart';
import 'package:baby_eduction/widget/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarWidget(),
            Padding(
              padding: kStandardPadding(),
              child: Column(
                children: [
                  ProfileHeaderCard(),
                  SizedBox(height: 16),
                  ProfileInfoCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileHeaderCard extends StatelessWidget {
  const ProfileHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 26.r,
            backgroundImage: const NetworkImage(
              "https://i.pravatar.cc/150?img=3", // demo image
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Sonu Dhakal",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text(
                  "sonudhakal@gmail.com",
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit, size: 20, color: Color(0xFF1E67ED)),
          ),
        ],
      ),
    );
  }
}

class ProfileInfoCard extends StatelessWidget {
  const ProfileInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: const [
          ProfileInfoRow(
            icon: Icons.public,
            label: "Country",
            value: "Australia",
          ),
          ProfileInfoRow(
            icon: Icons.school,
            label: "Course",
            value: "Computer Engineer",
          ),
          ProfileInfoRow(
            icon: Icons.account_balance,
            label: "University",
            value: "University of Melbourne",
          ),
          ProfileInfoRow(
            icon: Icons.event,
            label: "Intake",
            value: "Oct Intake 2026",
          ),
          ProfileInfoRow(
            icon: Icons.pending_actions,
            label: "Status",
            value: "Pending",
          ),
          ProfileInfoRow(
            icon: Icons.description,
            label: "Docs Progress",
            value: "Progress",
          ),
          ProfileInfoRow(
            icon: Icons.support_agent,
            label: "Counselor",
            value: "Counselor",
            isLast: true,
          ),
        ],
      ),
    );
  }
}

class ProfileInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool isLast;

  const ProfileInfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, size: 18, color: Colors.blueGrey),
            SizedBox(width: 10.w),
            Expanded(
              child: Text(
                "$label:",
                style: const TextStyle(fontSize: 13, color: Colors.black54),
              ),
            ),
            Text(
              value,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        if (!isLast)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Divider(height: 1, color: Colors.grey.shade300),
          ),
      ],
    );
  }
}

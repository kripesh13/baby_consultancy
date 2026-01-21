import 'package:baby_eduction/const/design_constant.dart';
import 'package:baby_eduction/views/profile/model/profile_model.dart';
import 'package:baby_eduction/views/profile/provider/profile_provider.dart';
import 'package:baby_eduction/widget/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileNotifier = ref.watch(profileProvider);

    return Scaffold(
      body: profileNotifier.isLoading
          ? const Center(child: CircularProgressIndicator())
          : profileNotifier.error != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error_outline, size: 48, color: Colors.red),
                      const SizedBox(height: 16),
                      Text(
                        "Failed to load profile\n${profileNotifier.error}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.redAccent),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton.icon(
                        onPressed: () => profileNotifier.refresh(),
                        icon: const Icon(Icons.refresh),
                        label: const Text("Try Again"),
                      ),
                    ],
                  ),
                )
              : profileNotifier.profile == null ||
                      profileNotifier.profile?.data == null
                  ? const Center(child: Text("No profile data available"))
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          AppBarWidget(),
                          Padding(
                            padding: kStandardPadding(),
                            child: Column(
                              children: [
                                ProfileHeaderCard(
                                  profile: profileNotifier.profile!.data!,
                                ),
                                SizedBox(height: 16.h),
                                ProfileInfoCard(
                                  profile: profileNotifier.profile!.data!,
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

// ──────────────────────────────────────────────

class ProfileHeaderCard extends StatelessWidget {
  final Data profile;

  const ProfileHeaderCard({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    final personal = profile.personalDetail;
    final name = "${personal?.firstName ?? ''} ${personal?.lastName ?? ''}".trim();
    final email = personal?.email ?? "No email provided";

    final imageUrl = profile.file?.path;

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
            backgroundColor: Colors.grey.shade200,
            backgroundImage: imageUrl != null
                ? NetworkImage(imageUrl)
                : const NetworkImage("https://i.pravatar.cc/150?img=3"),
            onBackgroundImageError: (_, __) {},
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name.isEmpty ? "User" : name,
                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4.h),
                Text(
                  email,
                  style: TextStyle(fontSize: 13.sp, color: Colors.grey.shade700),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              // TODO: open edit profile screen
            },
            icon: Icon(Icons.edit, size: 20.r, color: const Color(0xFF1E67ED)),
          ),
        ],
      ),
    );
  }
}

// ──────────────────────────────────────────────

class ProfileInfoCard extends StatelessWidget {
  final Data profile;

  const ProfileInfoCard({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    final personal = profile.personalDetail;
    final nationality = personal?.nationalityInfo?.nationality ?? "Not specified";

    String course = "Not specified";
    String university = "Not specified";
    String intake = "Not specified";

    if (profile.academicDetails!.isNotEmpty) {
      final acad = profile.academicDetails!.first;
      course = acad.qualificationAchieved ?? acad.levelOfStudy ?? "Not specified";
      university = acad.universityName ?? "Not specified";
      // You can try to derive intake from startDate later
      // For now we keep your original placeholder
      intake = "Oct Intake 2026";
    }

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
        children: [
          ProfileInfoRow(
            icon: Icons.public,
            label: "Country",
            value: nationality,
          ),
          ProfileInfoRow(
            icon: Icons.school,
            label: "Course",
            value: course,
          ),
          ProfileInfoRow(
            icon: Icons.account_balance,
            label: "University",
            value: university,
          ),
          ProfileInfoRow(
            icon: Icons.event,
            label: "Intake",
            value: intake,
          ),
          ProfileInfoRow(
            icon: Icons.pending_actions,
            label: "Status",
            value: "Pending", // ← can be added to backend later
          ),
          ProfileInfoRow(
            icon: Icons.description,
            label: "Docs Progress",
            value: "In Progress", // ← can be calculated later
          ),
          ProfileInfoRow(
            icon: Icons.support_agent,
            label: "Counselor",
            value: "Your Counselor", // ← can come from backend
            isLast: true,
          ),
        ],
      ),
    );
  }
}

// ──────────────────────────────────────────────

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
            Icon(icon, size: 18.w, color: Colors.blueGrey),
            SizedBox(width: 10.w),
            Expanded(
              child: Text(
                "$label :",
                style: TextStyle(fontSize: 13.sp, color: Colors.black54),
              ),
            ),
            Flexible(
              child: Text(
                value,
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
                textAlign: TextAlign.right,
              ),
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
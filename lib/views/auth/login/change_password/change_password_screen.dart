import 'package:baby_eduction/const/app_fonts.dart';
import 'package:baby_eduction/const/asset_path.dart';
import 'package:baby_eduction/const/color_schemas.dart';
import 'package:baby_eduction/const/design_constant.dart';
import 'package:baby_eduction/views/auth/login/state/auth_provider.dart';
import 'package:baby_eduction/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordScreen extends ConsumerStatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  ConsumerState<ChangePasswordScreen> createState() =>
      _ChangePasswordScreenState();
}

class _ChangePasswordScreenState
    extends ConsumerState<ChangePasswordScreen> {
  late final TextEditingController _currentPassword;
  late final TextEditingController _newPassword;
  late final TextEditingController _confirmPassword;

  bool obscure = true;

  @override
  void initState() {
    super.initState();
    _currentPassword = TextEditingController();
    _newPassword = TextEditingController();
    _confirmPassword = TextEditingController();
  }

  @override
  void dispose() {
    _currentPassword.dispose();
    _newPassword.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// TOP IMAGE
            Image.asset(
              AssetPath.login,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TITLE
                  Text(
                    "Change Password",
                    style: kkBoldTextStyle().copyWith(
                      color: AppColors.primaryColor,
                      fontSize: 24.w,
                    ),
                  ),
                  heightBox(6.h),
                  Text(
                    "Update your account password",
                    style: kTextStyle(),
                  ),

                  heightBox(20.h),

                  /// CURRENT PASSWORD
                  _inputField(
                    controller: _currentPassword,
                    hint: "Enter current password",
                    icon: Icons.lock_outline,
                    obscure: obscure,
                  ),

                  heightBox(14.h),

                  /// NEW PASSWORD
                  _inputField(
                    controller: _newPassword,
                    hint: "Enter new password",
                    icon: Icons.lock_outline,
                    obscure: obscure,
                    suffix: IconButton(
                      icon: Icon(
                        obscure
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.primaryColor,
                      ),
                      onPressed: () {
                        setState(() => obscure = !obscure);
                      },
                    ),
                  ),

                  heightBox(14.h),

                  /// CONFIRM PASSWORD
                  _inputField(
                    controller: _confirmPassword,
                    hint: "Confirm new password",
                    icon: Icons.lock_outline,
                    obscure: obscure,
                  ),

                  heightBox(16.h),

                  /// HELPER TEXT
                  Text(
                    "Your new password must be at least 8 characters long.",
                    style: kTextStyle().copyWith(color: Colors.grey),
                  ),

                  heightBox(20.h),

                  /// CHANGE PASSWORD BUTTON
                  PrimaryButton(
                    onTap: () {
                      final current = _currentPassword.text.trim();
                      final newPass = _newPassword.text.trim();
                      final confirm = _confirmPassword.text.trim();

                      if (current.isEmpty ||
                          newPass.isEmpty ||
                          confirm.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("All fields are required"),
                          ),
                        );
                        return;
                      }

                      if (newPass.length < 8) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Password must be at least 8 characters long",
                            ),
                          ),
                        );
                        return;
                      }

                      if (newPass != confirm) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Passwords do not match"),
                          ),
                        );
                        return;
                      }

                      ref.read(authProvider.notifier).changePassword(
                          newPass,
                          current,
                          context,
                          );
                    },
                    text: "Change Password",
                  ),

                  heightBox(30.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool obscure = false,
    Widget? suffix,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.09),
            blurRadius: 8,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        style: kTextStyle(),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: kTextStyle(),
          prefixIcon: Icon(icon, color: AppColors.primaryColor),
          suffixIcon: suffix,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
        ),
      ),
    );
  }
}

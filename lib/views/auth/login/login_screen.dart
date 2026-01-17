import 'package:baby_eduction/const/app_fonts.dart';
import 'package:baby_eduction/const/asset_path.dart';
import 'package:baby_eduction/const/color_schemas.dart';
import 'package:baby_eduction/const/design_constant.dart';
import 'package:baby_eduction/routes/route_names.dart';
import 'package:baby_eduction/utils/custom_navigator.dart';
import 'package:baby_eduction/views/auth/login/state/auth_provider.dart';
import 'package:baby_eduction/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  bool rememberMe = false;
  bool obscure = true;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TITLE
                  Text(
                    "Login",
                    style: kkBoldTextStyle().copyWith(
                      color: AppColors.primaryColor,
                      fontSize: 24.w,
                    ),
                  ),
                  heightBox(6.h),
                  Text("Login your account", style: kTextStyle()),

                  heightBox(20.h),

                  /// EMAIL FIELD
                  _inputField(
                    controller: _emailController,
                    hint: "Enter your email address",
                    icon: Icons.email_outlined,
                  ),

                  heightBox(14.h),

                  /// PASSWORD FIELD
                  _inputField(
                    controller: _passwordController,
                    hint: "Enter your password",
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

                  heightBox(16.h),

                  Row(
                    children: [
                      Checkbox(
                        value: rememberMe,
                        activeColor: AppColors.primaryColor,
                        onChanged: (v) {
                          setState(() => rememberMe = v!);
                        },
                      ),
                      Text("Remember me", style: kTextStyle()),
                      const Spacer(),
                      Text(
                        "Forget password",
                        style: kBoldTextStyle().copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),

                  heightBox(20.h),

                  /// SIGN IN BUTTON
                  PrimaryButton(
                    onTap: () {
                      ref
                          .read(authProvider.notifier)
                          .login(
                            _emailController.text.trim(),
                            _passwordController.text.trim(),
                          )
                          .then((value) {
                            CustomNavigator.pushReplace(
                              context,
                              RouteNames.navBraScreen,
                            );
                          });
                    },
                    text: "Sign In",
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
          BoxShadow(color: Colors.black.withOpacity(0.09), blurRadius: 8),
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

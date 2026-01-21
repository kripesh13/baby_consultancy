import 'package:baby_eduction/const/app_fonts.dart';
import 'package:baby_eduction/const/asset_path.dart';
import 'package:baby_eduction/const/color_schemas.dart';
import 'package:baby_eduction/routes/route_names.dart';
import 'package:baby_eduction/storage/secure_storage_service.dart';
import 'package:baby_eduction/storage/storage_key.dart';
import 'package:baby_eduction/utils/custom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final animationProvider = Provider((ref) {
  return Duration(seconds: 2);
});

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

@override
  void initState() {
    super.initState();
    final durations = ref.read(animationProvider);
    _animationController = AnimationController(vsync: this, duration: durations)
      ..repeat(reverse: true);
      checkToken();
  }

  checkToken() async {
    final storage = SecureStorageService();

    final token = await storage.read(key: StorageKeys.token);
    if (token == null || token == "" || token.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Future.delayed(Duration(seconds: 3), () {
          CustomNavigator.replaceAll(context, RouteNames.loginScreen);
        });
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Future.delayed(Duration(seconds: 3), () {
          CustomNavigator.replaceAll(context, RouteNames.navBraScreen);
        });
      });
    }
  }
  
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: _animationController.drive(Tween(begin: 0.5, end: 0.9)),
          child: Image.asset(AssetPath.appLogo),
        ),
      ),
    );
  }
}

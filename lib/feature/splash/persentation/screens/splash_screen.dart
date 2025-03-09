import 'package:bookingapp/core/routing/app_routes.dart';
import 'package:bookingapp/core/theming/app_images.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      AppNavigator.go(context, AppRoutes.onBoradingScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    AppImages.splashBackGround,
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: Image.asset(AppImages.appLogo, fit: BoxFit.cover),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

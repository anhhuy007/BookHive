import 'notifier/splash_notifier.dart';
import 'package:flutter/material.dart';
import 'package:loginform/core/app_export.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.primary.withOpacity(1),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 5.v),
                      CustomImageView(
                          imagePath: ImageConstant.imgLogo,
                          height: 72.adaptSize,
                          width: 72.adaptSize)
                    ]))));
  }
}

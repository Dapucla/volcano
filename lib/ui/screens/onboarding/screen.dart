import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:volcano/data/assets.dart';
import 'package:volcano/data/styles.dart';
import 'package:volcano/main.dart';
import 'package:volcano/ui/screens/app/app.dart';

import '../../../data/consts.dart';
import 'components/buttons.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: kDefaultPadding),
            Expanded(child: Image.asset(DAssetImages.onboarding)),
            const SizedBox(height: kDefaultPadding),
            OSButtons(
                title:
                    'Your pocket assistant with all the information about volcanoes.',

                onTap: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => DApp()));
                })
          ],
        ),
      ),
    );
  }

  // void _showOnboarding() async {
  // showOnboardingController.sink.add(true);
  // const FlutterSecureStorage storage = FlutterSecureStorage();
  // await storage.write(key: FSCConsts.showOnboarding, value: 'true');
  // Navigator.pop(context);
  // }
}

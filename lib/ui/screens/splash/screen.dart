import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:volcano/data/assets.dart';
import 'package:volcano/data/styles.dart';
import 'package:volcano/ui/screens/onboarding/screen.dart';

class SplashhScreen extends StatefulWidget {
  Widget? child;
  SplashhScreen({Key? key, this.child}) : super(key: key);

  @override
  _SplashhScreenState createState() => _SplashhScreenState();
}

class _SplashhScreenState extends State<SplashhScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              transitionDuration: Duration(),
              pageBuilder: (context, _, __) => OnboardingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child ??
        // Scaffold(
        //   body: Column(
        //     children: [
        //       Container(),

        //       // Text(
        //       //   'AirPrint',
        //       //   style: TextStyle(
        //       //       fontSize: 40,
        //       //       fontWeight: FontWeight.w600,
        //       //       color: Colors.white),
        //       // )
        //     ],
        //   ),
        // );
        Scaffold(
          body: Padding(
              padding: const EdgeInsets.only(top: kDefaultPadding),
              child: Center(child: Image.asset(DAssetImages.onboarding))),
        );
  }
}

import 'package:flutter/material.dart';
import 'package:volcano/data/assets.dart';
import 'package:volcano/data/styles.dart';
import 'package:volcano/ui/screens/quiz/screen.dart';
import 'package:volcano/ui/widgets/buttons/continue.dart';
import 'package:volcano/services/hive.dart';

import 'components/buttons.dart';

class BuyPremiumScreen extends StatelessWidget {
  const BuyPremiumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HiveBD hiveBD = HiveBD();
    double screenHeight = MediaQuery.of(context).size.height;
    double spacing = screenHeight * 0.15;
    return FutureBuilder(
      future: hiveBD.initDb(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error initializing purchase'));
        } else {
          bool isPremium = hiveBD.getPremiumStatus();

          return Scaffold(
            appBar: AppBar(

              backgroundColor: Colors.transparent, // Set app bar background to transparent
              elevation: 0, // Remove app bar shadow
              title: const Text(
                'Premium',
                style: TextStyle(color: Colors.white), // Set title color to white
              ),
              iconTheme: IconThemeData(color: Colors.white), // Set back button color to white
            ),
            extendBodyBehindAppBar: true, // Extend the body behind the app bar
            body: Stack(
              children: [
                // Background image covering the entire screen
                Image.asset(
                  'assets/images/bg_premium.jpg', // Ensure this path is correct
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Positioned(
                  bottom: spacing,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/images/premium_bg_icons_bottom.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/buy_premium_title.png'),
                      Image.asset('assets/images/premium_bg_icons_top.png'),
                      Image.asset('assets/images/buy_premium_content.png'),
                      const SizedBox(height: kDefaultPadding),
                      OSButtons(
                        title: 'Your pocket assistant with all the information about volcanoes.',
                        onTap: () {
                          hiveBD.setPremiumStatus(true); // Set premium status to true
                          Navigator.pop(context); // Navigate back to the previous screen
                        }, showRestore: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

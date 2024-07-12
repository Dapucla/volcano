import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:volcano/ui/screens/app/app.dart';
import 'package:volcano/data/styles.dart';
import 'package:volcano/ui/screens/game/screen.dart';
import 'package:volcano/ui/widgets/buttons/continue.dart';
import 'package:volcano/services/hive.dart';

import '../buy_premium/screen.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HiveBD hiveBD = HiveBD();

    return FutureBuilder(
      future: hiveBD.initDb(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error initializing Hive'));
        } else {
          bool isPremium = hiveBD.getPremiumStatus();

          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  // Background image at the bottom
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/images/bg_icons.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  // Main content
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Padding(
                          padding: const EdgeInsets.all(kDefaultPadding),
                          child: Column(
                            children: [
                              LayoutBuilder(
                                builder: (BuildContext context, BoxConstraints constraints) {
                                  double width = constraints.maxWidth * 0.7; // 80% of screen width
                                  return Image.asset(
                                    'assets/images/quiz.png',
                                    width: width,
                                    fit: BoxFit.contain,
                                  );
                                },
                              ),
                              const SizedBox(height: kDefaultPadding),
                              DContinueButton(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => const DApp(initialIndex: 6),
                                    ),
                                  );
                                },
                                name: 'Explore types of volcanoes',
                              ),
                              const SizedBox(height: kDefaultPadding),
                              DContinueButton(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) =>  GameScreen(),
                                    ),
                                  );
                                },
                                name: 'Play',
                                enabled: isPremium,
                              ),
                            ],
                          ),
                        ),
                      if (!isPremium)
                      Padding(
                        padding: const EdgeInsets.all(kDefaultPadding),
                        child: Column(
                          children: [
                            Text(
                              'If you want to play the quiz and add volcanos to your favorites, buy a premium.',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(color: Color(0xFFA19D9D)),
                            ),
                            const SizedBox(height: kDefaultPadding),
                            DContinueButton(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) =>
                                        BuyPremiumScreen(),
                                  ),
                                );
                              },
                              name: "Get Premium for \$0.99 / month",
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:volcano/data/assets.dart';
import 'package:volcano/data/styles.dart';
import 'package:volcano/ui/widgets/buttons/continue.dart';
import 'package:volcano/services/hive.dart';

import '../buy_premium/screen.dart';

class ShowNoPremiumScreen extends StatelessWidget {
  const ShowNoPremiumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HiveBD hiveBD = HiveBD();

    return FutureBuilder(
      future: hiveBD.initDb(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error initializing Hive'));
        } else {
          bool isPremium = hiveBD.getPremiumStatus();

          return Scaffold(
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (!isPremium)
                    Padding(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      child: Column(
                        children: [
                          Image.asset('assets/images/no_premium_icons.png'),
                          const SizedBox(height: kDefaultPadding),
                        ],
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    child: Column(
                      children: [
                        Text(
                            'Make a purchase if you want to add volcanoes to your favorites and play quiz.',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleLarge

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
            ),
          );
        }
      },
    );
  }
}

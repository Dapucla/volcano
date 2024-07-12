import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:volcano/data/assets.dart';
import 'package:volcano/data/styles.dart';
import 'package:volcano/main.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            _Element(
              name: 'Privacy Policy',
              icon: DAssetIcons.privacy,
              onTap: privacyPolicyPressed,
            ),
            _Element(
              name: 'Terms of Use',
              icon: DAssetIcons.terms,
              onTap: termsOfUsePressed,
            ),
            _Element(
              name: 'Support',
              icon: DAssetIcons.support,
              onTap: supportPressed,
            ),
          ],
        ),
      ),
    );
  }
}

class _Element extends StatelessWidget {
  final String icon;
  final String name;
  final Function()? onTap;

  const _Element({Key? key, required this.icon, required this.name, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding * 0.75),
        margin: const EdgeInsets.only(bottom: kDefaultPadding / 2),
        decoration: BoxDecoration(
            borderRadius: kSmallBorderRadius,
            color: Theme.of(context).colorScheme.secondary),
        child: Row(children: [
          SizedBox(width: 24, height: 24, child: SvgPicture.asset(icon)),
          const SizedBox(width: kDefaultPadding / 2),
          Expanded(
              child: Text(name,
                  style: const TextStyle(
                      color: kWhiteText, fontWeight: FontWeight.w500)))
        ]),
      ),
    );
  }
}

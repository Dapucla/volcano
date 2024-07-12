import 'package:flutter/material.dart';
import 'package:volcano/main.dart';

import '../../../../data/styles.dart';
import '../../../widgets/buttons/continue.dart';

class OSButtons extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool showRestore;

  const OSButtons({
    Key? key,
    required this.title,
    required this.onTap,
    required this.showRestore, // Default value is true, you can change it as needed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding).copyWith(bottom: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height: kDefaultPadding),
            DContinueButton(onTap: onTap, name: 'Get Premium for \$0.99 / month'),
            // const SizedBox(height: kDefaultPadding / 2),
            Container(
              height: 40,
              margin: const EdgeInsets.fromLTRB(16, 12, 16, 9),
              // padding:
              //     const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: termsOfUsePressed,
                      behavior: HitTestBehavior.opaque,
                      child: Center(
                        child: Text(
                          'Terms of Use',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  if (showRestore) // Conditionally include the "Restore" button
                    Expanded(
                      child: GestureDetector(
                        onTap: termsOfUsePressed,
                        behavior: HitTestBehavior.opaque,
                        child: Center(
                          child: Text(
                            'Restore',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  Expanded(
                    child: GestureDetector(
                      onTap: privacyPolicyPressed,
                      behavior: HitTestBehavior.opaque,
                      child: Center(
                        child: Text(
                          'Privacy Policy',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

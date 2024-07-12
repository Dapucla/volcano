import 'package:flutter/material.dart';
import 'package:volcano/data/styles.dart';

class SummaryVolcanoComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Center(
              child: Text(
                'Summary',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Color(0xFF077FAB),
                ),
              ),
            ),
            const SizedBox(height: kDefaultPadding),
            Text(
              '''• Composite cones, shield volcanoes, cinder cones and supervolcanoes are some of the types of volcanoes formed.
• Composite cones are tall, cone shaped volcanoes that produce explosive eruptions.
• Shield volcanoes form very large, gently sloped volcanoes with a wide base.
• Cinder cones are the smallest volcanic landform. They are formed from accumulation of many small fragments of ejected material.
• A caldera forms when an explosive eruption leaves a large crater when the mountain blows apart.
• Supervolcanoes are tremendously devastating types of volcanoes that could destroy large areas when they erupt.''',
            ),
          ],
        ),
      ],
    );
  }
}

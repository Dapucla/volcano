import 'package:flutter/material.dart';
import 'package:volcano/data/styles.dart';

class VocabularyVolcanoComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            'Vocabulary',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: Color(0xFF077FAB),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: kDefaultPadding),
            Text('Caldera', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: kDefaultPadding / 2),
            Text('Circular-shaped geographic features formed from a massive eruption of an ancient volcano, and the subsequent collapse of the volcano back into the ground.'),
            const SizedBox(height: kDefaultPadding),
            Text('Cinder cone', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: kDefaultPadding / 2),
            Text('A smaller volcano that grows rapidly but only erupts over a short period of the time. Cinder cones are composed of small rock fragments piled on top of one another. They rarely are more than 300 m in height.'),
            const SizedBox(height: kDefaultPadding),
            Text('Composite volcano', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: kDefaultPadding / 2),
            Text('A volcano with a broad base, steep sides, and often a crater at the top. The volcano is composed of alternating layers of ash and lava flows. Also called a stratovolcano.'),
          ],
        ),
      ],
    );
  }
}

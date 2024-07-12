import 'package:flutter/material.dart';
import 'package:volcano/data/styles.dart';

class PointsToConsiderComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            'Points to Consider',
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
            Text(
              '''• Composite volcanoes and volcanic cones usually have craters on the top. Why are the craters not always circular, but sometimes “U” or horseshoe-shaped? 
• A shield volcano is relatively flat, and a composite volcano is relatively steep because of the type of magma that creates them. What process might create a volcano that is more steep than a shield volcano but not as steep as a composite volcano?''',
            ),],
        ),
      ],
    );
  }
}

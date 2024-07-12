import 'package:flutter/material.dart';
import 'package:volcano/data/styles.dart';

class SuperVolcanoComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Center(
              child: Text(
                'Supervolcanoes / Calderas',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Color(0xFF077FAB),
                ),
              ),
            ),
            const SizedBox(height: kDefaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Image.asset('assets/images/supervolcanoes_volcano1.png'),
                      const SizedBox(height: kDefaultPadding / 2),
                      Text(
                        'The caldera at Santorini in Greece is so large that its circular shape can only be seen by satellite',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: kDefaultPadding),
                Expanded(
                  child: Column(
                    children: [
                      Image.asset('assets/images/supervolcanoes_volcano2.png'),
                      const SizedBox(height: kDefaultPadding / 2),
                      Text(
                        'Haruna-Fuji is a cone of Harunasan, seen here above Lake Haruna in the W side of the caldera. The Futatsudake lava dome to the E was the source of two large explosive eruptions during the 6th century CE.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),

              ],
            ),
            const SizedBox(height: kDefaultPadding),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'In certain areas of the world, huge ',
                  ),
                  TextSpan(
                    text: 'calderas',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: ' have been found to be the remains of volcanic eruptions of enormous scale (Figure 8.26). These calderas are volcanic features that are formed by the collapse of a huge amount of land due to the powerful eruptions. Caldera comes from Latin word, meaning cauldron. Calderas are generally circular shaped geographic formations like the picture in figure 6. These are not singular mountains but entire geographical areas. Yellowstone National Park in Wyoming is another caldera that has blown about a hundred times in the last 16 million years.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: kDefaultPadding),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Supervolcanoes ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'represent the most dangerous type of volcano. An eruption from a supervolcano could change life on Earth as we know it for many years. Supervolcanoes were not even accepted in volcanology until this millennium. Many supervolcano eruptions are thought to have occurred, the most recent in New Zealand less than 2000 years ago. That explosion was thought to have ejected about 100 cubic kilometers of material. A supervolcano eruption near what is now Colorado was thought to have let loose over 5,000 cubic kilometers of material millions of years ago. In comparison, the Mt. Saint Helens eruption ejected about 1 cubic kilometer of material.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

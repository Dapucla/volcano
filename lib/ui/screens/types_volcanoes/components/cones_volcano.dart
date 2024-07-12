import 'package:flutter/material.dart';
import 'package:volcano/data/styles.dart';

class ConesVolcanoComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Center(
              child: Text(
                'Cinder Cones/ Scoria Cones',
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
                Flexible(
                  flex: 4, // 30% of the width
                  child: Column(
                    children: [
                      Image.asset('assets/images/cones_volcano1.png'),
                      const SizedBox(height: kDefaultPadding / 2),
                      Text(
                        'Paricutín erupting in 1943, when it first formed. Cinder cones like this one rarely reach even 300 meters high.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: kDefaultPadding / 2),
                Flexible(
                  flex: 6, // 70% of the width
                  child: Column(
                    children: [
                      Image.asset('assets/images/cones_volcano2.png'),
                      const SizedBox(height: kDefaultPadding / 2),
                      Text(
                        'A roughly 15-second time-exposure during the night shows the incandescent trajectories of ejecta from Parícutin on 1 August 1943, near the start of the 1943-52 eruption. Periodic large explosions of bursting lava bubbles in the vent rapidly ejected incandescent lava spatter.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: kDefaultPadding),
            Image.asset('assets/images/cones_volcano3.png'),
            const SizedBox(height:  kDefaultPadding / 2),
            Text(
                'An ash plume rises about 1 km and drifts to the NW above the Akutan caldera scoria cone on 2 June 1988. Dark ash deposits on the flanks extend across the caldera floor and western rim. The snow-covered ridge in the foreground is the SW caldera rim. Intermittent eruptions such as these are typical of Akutan. The 1988 eruption lasted from 26 March to 20 July.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall
            ),
            const SizedBox(height: kDefaultPadding),
            Image.asset('assets/images/cones_volcano4.png'),
            const SizedBox(height: kDefaultPadding),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Cinder Cones/ Scoria Cones',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: ' are both the most common type of volcano and also the smallest. The cinder cone resembles a composite volcano but on a much smaller scale. They rarely reach even 300 meters in height but have even steeper sides than a composite volcano. They usually have a crater at the summit. Cinder cones are composed of small fragments of rock piled on top of one another. These volcanoes usually do not produce streams of lava.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: kDefaultPadding),
            Text('In 1943, a farmer in Mexico witnessed the first eruption of a cinder cone in his field (Figure 8.25). Within a year, the cinder cone Paricutín grew to 336 meters high. By 1952, it grew to a peak of 424 meters tall, and then stopped erupting. This rapid growth and single eruption cycle is characteristic of cinder cones. For this reason, cinder cones do not reach the sizes of stratovolcanoes or shield volcanoes. Often, cinder cones appear near larger volcanoes, but they also may be found away from all other volcanoes, as was the case with Paricutín. The exact composition of a cinder cone depends on the composition.'),
          ],
        ),
      ],
    );
  }
}

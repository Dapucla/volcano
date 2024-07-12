import 'package:flutter/material.dart';
import 'package:volcano/data/styles.dart';

class CalderaVolcanoComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Center(
              child: Text(
                'Caldera Volcano',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Color(0xFF077FAB),
                ),
              ),
            ),
            const SizedBox(height: kDefaultPadding),
            Image.asset('assets/images/caldera_volcano.png'),
            const SizedBox(height: kDefaultPadding),
            Text("The eruptions from supervolcanoes can be so large that the ash ejected into the air blocks the Sun and lowers the temperature on the entire planet. The lowered temperatures caused by these eruptions is called a volcanic winter. A supervolcano eruption at Lake Toba in northern Sumatra may have annihilated about 60% of the world’s human population about 75,000 years ago. One can only imagine how such a huge eruption would change the world in modern times."),
            const SizedBox(height: kDefaultPadding),
            Text("The largest supervolcano in North America is the Yellowstone caldera, which had three super eruptions at 2.1 million, 1.3 million and 640,000 years ago, and much more recent smaller (but still enormous) eruptions. Long Valley caldera, south of Mono Lake in California, is the second largest supervolcano in North America, erupting extremely hot and explosive rhyolite around 700,000 years ago. An earthquake swarm in 1980 alerted geologists to the possibility of another eruption in the future, but the timing of such an event is unknown."),
            const SizedBox(height: kDefaultPadding),
            Text("Supervolcanoes are a fairly new idea so the exact cause of supervolcano eruptions is still debated. However, scientists believe that an entire and very large magma chamber erupts in a catastrophic explosion. This enormous eruption creates a huge hole or caldera where the surface area collapses."),
          ],
        ),
      ],
    );
  }
}

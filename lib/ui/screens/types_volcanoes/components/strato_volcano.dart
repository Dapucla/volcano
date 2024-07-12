import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:volcano/data/styles.dart';

class StratoVolcanoComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Strato-volcano or Composite Volcano',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Color(0xFF077FAB),
              ),
            ),
          ),
          const SizedBox(height: kDefaultPadding),
          Text.rich(
            TextSpan(
              text: 'The picture below shows Mt. Fuji, a classic example of the ',
              children: <TextSpan>[
                TextSpan(text: 'strato-volcano', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ' also known as a '),
                TextSpan(text: 'composite volcano', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: '.'),
              ],
            ),
          ),

          const SizedBox(height: kDefaultPadding),
          Text('This is the type of volcano many people think of when they imagine volcanoes. These volcanoes have broad bases and sides that get steeper and steeper as you get closer to the top.'),
          const SizedBox(height: kDefaultPadding),
          Image.asset('assets/images/strato_volcano.png'),
          const SizedBox(height:  kDefaultPadding / 2),
          Text(
            'They frequently have a large crater at the top created during its last eruption.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall
          ),
          const SizedBox(height: kDefaultPadding),
          Image.asset('assets/images/composite_volcano.png'),
          const SizedBox(height:  kDefaultPadding / 2),
          Text(
              'Mt. Fuji is a dormant composite volcano that is the highest mountain in Japan..',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall
          ),
          const SizedBox(height: kDefaultPadding),
          Text("Mayon in the Philippines is one of Earth's best examples of a classic, conical stratovolcano. Its symmetrical morphology is the exception rather than the rule and is the result of eruptions that are restricted to a single central conduit at the summit. Eruptions are frequent enough to overcome erosion processes that quickly modify the slopes of most volcanoes."),
          const SizedBox(height: kDefaultPadding),
          Image.asset('assets/images/strato_volcano2.png'),
          const SizedBox(height: kDefaultPadding / 2),
          Text(
              'A composite or stratovolcano is created by many levels of alternating materials.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall
          ),
          const SizedBox(height: kDefaultPadding),
          Text('Composite volcanoes are also called stratovolcanoes because of the alternating layers, or strata, of which they are made). The magma that creates stratovolcanoes tends to be more viscous, or thick. Viscous lava creates greater pressure which, in turn, tends to create explosive eruptions. In addition, the viscous lava cannot travel far down the sides of the volcano before it solidifies. This viscous lava thus creates steep sides on stratovolcanoes.'),
          const SizedBox(height: kDefaultPadding),
          Text('When a stratovolcano erupts, it ejects a great deal of pyroclastic material into the air, which then settles back down on the Earth. After an initial explosion, lava then flows from the volcano creating a second layer of material. As these layers solidify, they create alternating levels, or strata, of material. Ash from the volcanic eruption is also present between the lava layers along the edge of the volcano. Composite volcanoes are common along the Pacific Ring of Fire and other major tectonic plate boundaries where the presence of water in the magma chamber creates explosive eruptions.')
        ],
      ),
    );
  }
}

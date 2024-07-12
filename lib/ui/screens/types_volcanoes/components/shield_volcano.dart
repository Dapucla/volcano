import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:volcano/data/styles.dart';

class ShieldVolcanoComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Shield Volcanoes',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Color(0xFF077FAB),
              ),
            ),
          ),
          const SizedBox(height: kDefaultPadding),
          Image.asset('assets/images/shield_volcano1.png'),
          const SizedBox(height:  kDefaultPadding / 2),
          Text(
              'The Mauna Loa Volcano in Hawaii is the largest shield volcano on Earth.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall
          ),
          const SizedBox(height: kDefaultPadding),
          Image.asset('assets/images/shield_volcano2.png'),
          const SizedBox(height: kDefaultPadding),
          Text("Hawaii's two largest shield volcanoes are Mauna Loa (in the background to the S) and Mauna Kea. Mauna Loa has the classic low-angle profile of a shield volcano constructed by repetitive eruptions of thin, overlapping lava flows. Mauna Kea’s profile has been modified by late-stage explosive eruptions that constructed a series of cones at the summit."),
          const SizedBox(height: kDefaultPadding),
          Image.asset('assets/images/shield_volcano3.png'),
          const SizedBox(height: kDefaultPadding),
          Text('A shield volcano is built by layers of more fluid lava that spreads out over broad areas.'),
          const SizedBox(height: kDefaultPadding),
          Text('Shield volcanoes are more common at spreading centers or volcanic hot spots in the middle of tectonic plates (Figure 8.24). The magma that creates shield volcanoes is less viscous, so it flows much more easily. For this reason, the eruptions of shield volcanoes are non-explosive. In addition, the less viscous lava spreads out more, which makes shield volcanoes much larger and flatter than stratovolcanoes. Although shield volcanoes are built by many layers over time, the composition of the layers do not alternate between ash and lava, as they do in stratovolcanoes.')
        ],
      ),
    );
  }
}

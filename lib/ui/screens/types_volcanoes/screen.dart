import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:volcano/data/styles.dart';

import 'components/volcano_types.dart';
import 'components/strato_volcano.dart';
import 'components/shield_volcano.dart';
import 'components/cones_volcano.dart';
import 'components/supervolcano_volcano.dart';
import 'components/caldera_volcano.dart';
import 'components/summary.dart';
import 'components/vocabulary.dart';
import 'components/points_to_ consider.dart';

class TypesVolcanoesScreen extends StatelessWidget {
  const TypesVolcanoesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text('Explore types of volcanoes'),
        ),
      ),
      body:  SingleChildScrollView(
        padding: EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            Image.asset(
              'assets/images/title_image.png', fit: BoxFit.cover,
            ),
            const SizedBox(height: kDefaultPadding * 2),
            VolcanoTypesComponent(),
            const SizedBox(height: kDefaultPadding * 2),
            StratoVolcanoComponent(),
            const SizedBox(height: kDefaultPadding * 2),
            ShieldVolcanoComponent(),
            const SizedBox(height: kDefaultPadding * 2),
            ConesVolcanoComponent(),
            const SizedBox(height: kDefaultPadding * 2),
            SuperVolcanoComponent(),
            const SizedBox(height: kDefaultPadding * 2),
            CalderaVolcanoComponent(),
            const SizedBox(height: kDefaultPadding * 2),
            SummaryVolcanoComponent(),
            const SizedBox(height: kDefaultPadding * 2),
            VocabularyVolcanoComponent(),
            const SizedBox(height: kDefaultPadding * 2),
            PointsToConsiderComponent(),
          ],
        ),
      ),
    );
  }
}

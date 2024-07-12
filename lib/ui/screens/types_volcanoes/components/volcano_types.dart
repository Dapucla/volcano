import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:volcano/data/styles.dart';

class VolcanoTypesComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Volcano types',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Color(0xFF077FAB),
              ),
            ),
          ),
          const SizedBox(height: kDefaultPadding),
          LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/volcano_types.png',
                        width: constraints.maxWidth * 0.4, // 40% of the width
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'When most people think of volcanoes, they think of a tall mountain with a crater on the top, maybe a little snow at the summit and some trees scattered around the base.',
                              textAlign: TextAlign.justify,
                              style: TextStyle(height: 1.3),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Text(
                      'There are many volcanoes like this, but volcanoes exist in many other forms as well. Each type of volcano has characteristic features that distinguish it from other types. Volcanoes differ in appearance because of the composition of their magma and the processes that originally created them. The tall cone shape you usually think of when you think of a volcano describes a composite volcano, one common form of volcanoes. Other types of volcanoes include the shield volcano, the cinder cone, and the supervolcano-caldera.',
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

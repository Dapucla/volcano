import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:volcano/data/assets.dart';
import 'package:volcano/data/styles.dart';
import 'package:volcano/ui/widgets/buttons/click_area.dart';

import '../screens/types_and_features/models/types_and_features_model.dart';
import '../screens/show_types_and_features/screen.dart';

class TypesAndFeaturesItem extends StatelessWidget {
  final TypesAndFeaturesModel model;

  const TypesAndFeaturesItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClickArea(
      onTap: () => Navigator.of(context).push(
          CupertinoPageRoute(
              builder: (context) => ShowTypesAndFeatures(model: model))),
      child: Container(
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Color.fromRGBO(194, 194, 194, 1)))),
        child: Row(children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 85,
                height: 85,
                color: Theme.of(context).colorScheme.surface,
                child: model.image != null && model.image != '/includes/images/noimage.jpg'
                    ? Image.network(
                  model.image!,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child; // Image is fully loaded
                    } else {
                      return Center(
                        child: CupertinoActivityIndicator(),
                      );
                    }
                  },
                  errorBuilder: (context, error, stackTrace) {
                    // Handle error scenario if needed
                    return Image.asset(
                      DAssetImages.noImages,
                      height: 85,
                      width: 85,
                    );
                  },
                )
                    : Image.asset(
                  DAssetImages.noImages,
                  height: 85,
                  width: 85,
                ),
              ),
            ),
          ),
          const SizedBox(width: kDefaultPadding / 2),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text("${model.name}",
                          style: Theme.of(context).textTheme.headlineSmall),
                    ),
                    const SizedBox(width: kDefaultPadding / 4),

                  ],
                ),
                const SizedBox(height: kDefaultPadding / 4),
                Text("${model.subtitle}",  maxLines: 3,overflow: TextOverflow.ellipsis,),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

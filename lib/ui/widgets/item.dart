import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:volcano/data/styles.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';
import 'package:volcano/data/assets.dart';
import 'package:volcano/ui/widgets/buttons/click_area.dart';
import 'package:volcano/ui/widgets/like_button.dart';

import '../../models/volcanes_list_model.dart';
import '../screens/show_volcano/screen.dart';

class VolcanoItem extends StatelessWidget {
  final VolcanesListModel model;

  const VolcanoItem({Key? key, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClickArea(
      onTap: () => Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (context) => ShowVolcanoScreen(model: model))),
      child: Container(
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Color.fromRGBO(194, 194, 194, 1)))),
        child: Row(children: [
          Center(
            child: ClipRRect(
              borderRadius: kSmallBorderRadius,
              child: Container(
                width: 85,
                height: 85,
                color: Theme.of(context).colorScheme.surface,
                child: FutureBuilder<String?>(
                    future: fetchPhoto(),
                    initialData: model.image,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                            child: CupertinoActivityIndicator());
                      }

                      if (snapshot.data != null &&
                          snapshot.data != '/includes/images/noimage.jpg') {
                        return Image.network(
                            "https://volcano.si.edu${snapshot.data}",
                            fit: BoxFit.cover);
                      }

                      return Image.asset(DAssetImages.noImages,
                          height: 85, width: 85);
                    }),
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
                   VolcanoFavoriteButton(model: model)
                  ],
                ),
                const SizedBox(height: kDefaultPadding / 4),
                Text("${model.subregion}"),
                const SizedBox(height: kDefaultPadding / 4),
                Wrap(
                  spacing: kDefaultPadding / 4,
                  runSpacing: kDefaultPadding / 4,
                  children: [model.type, model.evidence]
                      .map((e) => Container(
                            padding: const EdgeInsets.all(kDefaultPadding / 4),
                            decoration: BoxDecoration(
                                borderRadius: kSmallBorderRadius,
                                color: Theme.of(context).colorScheme.secondary),
                            child: Text("$e",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: kWhiteText)),
                          ))
                      .toList(),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Future<String?> fetchPhoto() async {
    var link = await get(
        Uri.parse('https://volcano.si.edu/volcano.cfm?vn=${model.id}'));
    var document = parse(link.body);
    String? image = document
        .getElementsByClassName('volcano-image-container')[0]
        .children[0]
        .attributes["src"];
    model.image = image;
    return image;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:volcano/ui/widgets/buttons/click_area.dart';
import 'package:volcano/services/hive.dart';
import 'package:flutter/cupertino.dart';
import 'package:volcano/ui/screens/app/app.dart';
import '../../data/assets.dart';
import '../../models/volcanes_list_model.dart';

class VolcanoFavoriteButton extends StatelessWidget {
  final VolcanesListModel model;

  const VolcanoFavoriteButton({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isFavorite = false;
    final HiveBD hiveBD = HiveBD();

    return FutureBuilder(
      future: hiveBD.initDb(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            width: 25,
            height: 25,
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const SizedBox(
            width: 25,
            height: 25,
            child: Icon(Icons.error),
          );
        } else {
          bool isPremium = hiveBD.getPremiumStatus();

          return SizedBox(
            width: 25,
            height: 25,
            child: StreamBuilder(
              stream: hiveBD.favoriteStream(),
              builder: (context, snapshot) {
                List<VolcanesListModel> models = hiveBD.getFavorites();
                isFavorite =
                    models.indexWhere((element) => element.id == model.id) != -1;

                return ClickArea(
                  onTap: () {
                    if (isPremium) {
                      hiveBD.addToFavorite(model);
                    } else {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const DApp(initialIndex: 1),
                        ),
                      );
                    }
                  },
                  child: SvgPicture.asset(
                    !isFavorite
                        ? DAssetIcons.favorite
                        : DAssetIcons.favoriteActive,
                    width: 25,
                    height: 25,
                    colorFilter: !isFavorite
                        ? ColorFilter.mode(
                      Theme.of(context).textTheme.bodyMedium!.color!,
                      BlendMode.srcIn,
                    )
                        : const ColorFilter.mode(Colors.red, BlendMode.srcIn),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:volcano/services/hive.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:volcano/ui/screens/quiz/screen.dart';
import 'package:volcano/ui/screens/types_and_features/screen.dart';
import 'package:volcano/ui/screens/types_volcanoes/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:volcano/data/assets.dart';
import 'package:volcano/data/styles.dart';
import 'navigator_bloc.dart';

import '../favorite/screen.dart';
import '../home/screen.dart';
import '../settings/screen.dart';


class DApp extends StatefulWidget {
  final int initialIndex;

  const DApp({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  State<DApp> createState() => _DAppState();
}

class _DAppState extends State<DApp> {
  late NavigatorBloc _navigatorBloc;
  late HiveBD _hiveBD;
  bool _isPremium = false;

  @override
  void initState() {
    _navigatorBloc = NavigatorBloc();
    _hiveBD = HiveBD();
    _checkPremiumStatus(); // Check premium status
    super.initState();
  }

  Future<void> _checkPremiumStatus() async {
    await _hiveBD.initDb();
    setState(() {
      _isPremium = _hiveBD.getPremiumStatus();
    });
  }

  @override
  void dispose() {
    _navigatorBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        maintainBottomViewPadding: true,
        top: false,
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<NavBarItem>(
                stream: _navigatorBloc.itemStream,
                initialData: NavBarItem.values[widget.initialIndex],
                builder: (context, snapshot) {
                  NavBarItem? screen = snapshot.data;
                  switch (screen) {
                    case NavBarItem.favorite:
                      return const FavoriteScreen();
                    case NavBarItem.quiz:
                      return const QuizScreen();
                    case NavBarItem.types_and_features:
                      return const TypesAndFeaturesScreen();
                    case NavBarItem.settings:
                      return const SettingsScreen();
                    case NavBarItem.types_volcanoes:
                      return const TypesVolcanoesScreen();
                    // case NavBarItem.show_types_and_features:
                    //   return const ShowTypesAndFeatures();
                    default:
                      return const HomeScreen();
                  }
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                decoration: const BoxDecoration(
                  color: kPromptTextColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12),
                  ),
                ),
                child: SafeArea(
                  top: false,
                  child: StreamBuilder<NavBarItem>(
                    stream: _navigatorBloc.itemStream,
                    initialData: NavBarItem.values[widget.initialIndex],
                    builder: (context, snapshot) {
                      NavBarItem? screen = snapshot.data;
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _NavigatorItem(
                            voidCallback: () =>
                                _navigatorBloc.pickItem(NavBarItem.home.index),
                            activity: screen == NavBarItem.home,
                            icon: DAssetIcons.volcanos,
                            title: 'Volcanos',
                          ),
                          _NavigatorItem(
                            voidCallback: () =>
                                _navigatorBloc.pickItem(NavBarItem.favorite.index),
                            activity: screen == NavBarItem.favorite,
                            icon: DAssetIcons.favorite,
                            title: 'Favourite',
                          ),
                          _NavigatorItem(
                            voidCallback: () =>
                                _navigatorBloc.pickItem(NavBarItem.types_and_features.index),
                            activity: screen == NavBarItem.types_and_features,
                            icon: DAssetIcons.types_and_features,
                            title: 'Types and Features',
                          ),
                          _NavigatorItem(
                            voidCallback: () =>
                                _navigatorBloc.pickItem(NavBarItem.quiz.index),
                            activity: screen == NavBarItem.quiz,
                            icon: DAssetIcons.quiz,
                            title: 'Quiz game',
                          ),
                          _NavigatorItem(
                            voidCallback: () =>
                                _navigatorBloc.pickItem(NavBarItem.settings.index),
                            activity: screen == NavBarItem.settings,
                            icon: DAssetIcons.settings,
                            title: 'Settings',
                          ),
                        ].map((e) => Expanded(child: e)).toList(),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavigatorItem extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback voidCallback;
  final bool activity;

  const _NavigatorItem({
    Key? key,
    required this.icon,
    required this.voidCallback,
    required this.activity,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: voidCallback,
      child: Center(
        child: Column(
          children: [
            SvgPicture.asset(
              icon,
              colorFilter: activity
                  ? ColorFilter.mode(
                  Theme.of(context).colorScheme.secondary, BlendMode.srcIn)
                  : null,
            ),
            const SizedBox(height: 5),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: activity
                    ? Theme.of(context).colorScheme.secondary
                    : kWhiteText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

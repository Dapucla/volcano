import 'dart:async';

enum NavBarItem { home,
  favorite,
  types_and_features,
  quiz,
  settings,
  show_types_and_features,
  types_volcanoes,
  // game
}

class NavigatorBloc {
  final _navBarController = StreamController<NavBarItem>.broadcast();

  Stream<NavBarItem> get itemStream => _navBarController.stream;
  NavBarItem defaultItem = NavBarItem.home;

  void pickItem(int i) {
    switch (i) {
      case 0:
        _navBarController.sink.add(NavBarItem.home);
        break;
      case 1:
        _navBarController.sink.add(NavBarItem.favorite);
        break;
      case 2:
        _navBarController.sink.add(NavBarItem.types_and_features);
        break;
      case 3:
        _navBarController.sink.add(NavBarItem.quiz);
        break;
      case 4:
        _navBarController.sink.add(NavBarItem.settings);
        break;
      case 5:
        _navBarController.sink.add(NavBarItem.types_volcanoes);
        break;
      // case 6:
      //   _navBarController.sink.add(NavBarItem.game);
      //   break;
    }
  }

  void dispose() {
    _navBarController.close();
  }
}

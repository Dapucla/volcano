import 'package:hive/hive.dart';
import 'package:volcano/models/volcanes_list_model.dart';


class HiveIds {
  static const int volcanesListModel = 1;
  static const int premiumStatus = 2;  // Add this line
}

class HiveBD {
  late Box<VolcanesListModel> volcanoListModelBox;
  late Box<bool> premiumStatusBox;  // Add this line

  Future<void> initDb() async {
    if (!Hive.isAdapterRegistered(HiveIds.volcanesListModel)) {
      Hive.registerAdapter(VolcanesListModelAdapter());
    }

    volcanoListModelBox = await Hive.openBox('volcanes_list_model');
    premiumStatusBox = await Hive.openBox('premium_status');  // Add this line
  }

  void addToFavorite(VolcanesListModel model) {
    List<VolcanesListModel> models = getFavorites();
    int index = models.indexWhere((element) => element.id == model.id);

    if (index == -1) {
      volcanoListModelBox.add(model);
    } else {
      volcanoListModelBox.delete(volcanoListModelBox.keyAt(index));
    }
  }

  Stream<BoxEvent> favoriteStream() => volcanoListModelBox.watch();

  List<VolcanesListModel> getFavorites() => volcanoListModelBox.values.toList();

  bool getPremiumStatus() {
    return premiumStatusBox.get('isPremium', defaultValue: false)!;
  }

  void setPremiumStatus(bool isPremium) {
    premiumStatusBox.put('isPremium', isPremium);
  }
}

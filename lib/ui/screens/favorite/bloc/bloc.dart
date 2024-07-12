import 'package:volcano/main.dart';
import 'package:volcano/models/volcanes_list_model.dart';
import 'package:volcano/services/bloc/bloc.dart';
import 'package:volcano/ui/screens/favorite/bloc/event.dart';
import 'package:volcano/ui/screens/favorite/bloc/state.dart';

class FSBloc extends DBloc<FSState, FSEvent, FSSuccess> {
  @override
  Future<void> fetchData() async {
    List<VolcanesListModel> models = globalHiveDB.getFavorites();
    newState(FSSuccess(models));
  }

  @override
  void mapEventToState(FSEvent event) {
    // TODO: implement mapEventToState
  }
}

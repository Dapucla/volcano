import 'package:html/parser.dart' as parser;
import 'package:http/http.dart';
import 'package:volcano/services/bloc/bloc.dart';
import 'package:volcano/ui/screens/home/bloc/event.dart';
import 'package:volcano/ui/screens/home/bloc/state.dart';

import '../../../../models/volcanes_list_model.dart';

class HomeBloc extends DBloc<HomeState, HomeEvent, HomeSuccess> {
  @override
  void mapEventToState(event) {
    if (event is HomeSearch) {
      successState.filterModel =
          successState.filterModel.copyWith(search: event.name);
      newSuccessState(successState.filteredModel(successState.filterModel));
    } else if (event is HomeUpdateFilterModel) {
      newSuccessState(successState.filteredModel(event.model));
    }
  }

  @override
  Future<void> fetchData() async {
    print('1');
    try {
      var link = await get(
          Uri.parse('https://volcano.si.edu/volcanolist_holocene.cfm'));
      print('2');
      var document = parser.parse(link.body);
      print('3');
      var check = document.getElementsByTagName('tbody').first.children;
      print(check);
      // var check = document
      //     .getElementsByClassName('main')
      //     .first
      //     .children
      //     .first
      //     .children
      //     .firstWhere((element) => element.className == 'content-container')
      //     .children
      //     .firstWhere((element) => element.className == 'WideDivTableGray')
      //     .children
      //     .first
      //     .children
      //     .first
      //     .children[1]
      //     .children;
      // print(check.first.children);
      print('4');

      List<VolcanesListModel> model = List<VolcanesListModel>.from(check.map(
          (x) => VolcanesListModel(
              id: int.parse(x.children.first.children.first.attributes["href"]
                  .toString()
                  .split('=')
                  .last),
              name: x.children.first.text,
              subregion: x.children[1].text,
              type: x.children[2].text,
              evidence: x.children[3].text)));
      print('5');

      newState(HomeSuccess(
          models: model, filterModel: FilterModel(sortByNameIncrease: true)));
    } catch (e) {
      newState(HomeError());
    }
  }
}

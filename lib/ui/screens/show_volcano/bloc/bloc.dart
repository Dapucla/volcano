import 'package:html/parser.dart';
import 'package:http/http.dart';
import 'package:volcano/models/volcano.dart';
import 'package:volcano/services/bloc/bloc.dart';
import '../../../../models/volcanes_list_model.dart';
import 'event.dart';
import 'state.dart';
import 'package:collection/collection.dart';

class SVBloc extends DBloc<SVState, SVEvent, SVSuccess> {
  final int id;
  final VolcanesListModel model;

  SVBloc(this.id, this.model);

  @override
  Future<void> fetchData() async {
    try {
      var link =
          await get(Uri.parse('https://volcano.si.edu/volcano.cfm?vn=$id'));
      var document = parse(link.body);

      var check = document
          .getElementById('wrap')
          ?.children[0]
          .children[5]
          .children[0]
          .children[0]
          .children[0]
          .children;

      var info =
          document.getElementsByClassName('volcano-info-table')[0].children[0];

      var info2 = document
          .getElementsByClassName("volcano-subinfo-table")[0]
          .children[0];

      var summitAll = info2.children[3].text.split('m');

      EmissionHistory? emissionHistoryModel;
      DeformationHistory? deformationHistoryModel;
      EruptiveHistory? historyModel;

      try {
        var history = document
                    .getElementById('wrap')!
                    .children[0]
                    .children[6]
                    .children
                    .length ==
                4
            ? document
                .getElementById('wrap')
                ?.children[0]
                .children[6]
                .children[3]
            : null;

        var deformationHistory =
            document.getElementById('deformation-accordion');

        var emissionHistory = document.getElementById('emission-accordion');

        if (emissionHistory != null) {
          emissionHistoryModel = EmissionHistory(
              startDate: emissionHistory.children[1].children[0].children[0]
                  .children[0].children[0].text
                  .split(':')
                  .last,
              stopDate: emissionHistory.children[1].children[0].children[0]
                  .children[0].children[1].text
                  .split(':')
                  .last,
              method: emissionHistory.children[1].children[0].children[0]
                  .children[0].children[2].text
                  .split(':')
                  .last,
              altitudeMin: emissionHistory.children[1].children[0].children[0]
                  .children[1].children[0].text
                  .split(':')
                  .last,
              altitudeMax: emissionHistory.children[1].children[0].children[0]
                  .children[1].children[1].text
                  .split(':')
                  .last,
              totalMass:
                  emissionHistory.children[1].children[0].children[0].children[1].children[2].text.split(':').last);
        }
        if (deformationHistory != null) {
          deformationHistoryModel = DeformationHistory(
              startDate: deformationHistory.children[1].children[0].children[0]
                  .children[0].children[0].text
                  .split(':')
                  .last,
              stopDate: deformationHistory.children[1].children[0].children[0]
                  .children[0].children[1].text
                  .split(':')
                  .last,
              direction: deformationHistory.children[1].children[0].children[0]
                  .children[0].children[2].text
                  .split(':')
                  .last,
              method: deformationHistory.children[1].children[0].children[0].children[0].children[3].text
                  .split(':')
                  .last,
              magnitude: deformationHistory.children[1].children[0].children[0]
                  .children[1].children[0].text
                  .split(':')
                  .last,
              spatialExtend: deformationHistory.children[1].children[0]
                  .children[0].children[1].children[1].text
                  .split(':')
                  .last);
        }
        if (history != null) {
          historyModel = EruptiveHistory(
              endDate: history
                  .children[1]
                  .children[0]
                  .children[0]
                  .children[1]
                  .children[0]
                  .children[0]
                  .children[0]
                  .children[1]
                  .children[0]
                  .children[1]
                  .children[0]
                  .children[2]
                  .text,
              startDate: history
                  .children[1]
                  .children[0]
                  .children[0]
                  .children[1]
                  .children[0]
                  .children[0]
                  .children[0]
                  .children[1]
                  .children[0]
                  .children[1]
                  .children[0]
                  .children[1]
                  .text,
              eventType: history
                  .children[1]
                  .children[0]
                  .children[0]
                  .children[1]
                  .children[0]
                  .children[0]
                  .children[0]
                  .children[1]
                  .children[0]
                  .children[1]
                  .children[0]
                  .children[3]
                  .text,
              eruption: info.children[2].text,
              place: history.children[1].children[0].children[0].children[0]
                  .children[0].children[1].text,
              desc: history.children[1].children[0].children[0].children[0]
                  .children[1].children[1].text);
        }
      } catch (e) {
        print(e);
      }

      List<SynonymsModel> conesModel = [];
      List<SynonymsModel> cratersModel = [];
      List<SynonymsModel> domesModel = [];
      try {
        var synonyms = document
            .getElementById('wrap')
            ?.children[0]
            .children[4]
            .children[1]
            .children[0];

        int conesId = synonyms?.children
                .indexWhere((element) => element.text.contains('Cones')) ??
            -1;
        int cratersId = synonyms?.children
                .indexWhere((element) => element.text.contains('Craters')) ??
            -1;
        int domesId = synonyms?.children
                .indexWhere((element) => element.text.contains('Domes')) ??
            -1;

        if (synonyms != null) {
          for (var item in synonyms.children) {
            int index = synonyms.children.indexOf(item);

            if (conesId != -1 &&
                index > conesId &&
                index != conesId + 1 &&
                index <
                    (cratersId != -1
                        ? cratersId
                        : domesId != -1
                            ? domesId
                            : synonyms.children.length)) {
              conesModel.add(SynonymsModel(
                  featureName: item.children[0].text,
                  featureType: item.children[1].text,
                  elevation: item.children[2].text,
                  latitude: item.children[3].text,
                  longitude: item.children[4].text));
            } else if (cratersId != -1 &&
                index > cratersId &&
                index != cratersId + 1 &&
                index < (domesId != -1 ? domesId : synonyms.children.length)) {
              cratersModel.add(SynonymsModel(
                  featureName: item.children[0].text,
                  featureType: item.children[1].text,
                  elevation: item.children[2].text,
                  latitude: item.children[3].text,
                  longitude: item.children[4].text));
            } else if (domesId != -1 &&
                index > domesId &&
                index != domesId + 1 &&
                index < synonyms.children.length) {
              domesModel.add(SynonymsModel(
                  featureName: item.children[0].text,
                  featureType: item.children[1].text,
                  elevation: item.children[2].text,
                  latitude: item.children[3].text,
                  longitude: item.children[4].text));
            }
          }
        }
      } catch (e) {
        print(e);
      }
      VolcanoModel model = VolcanoModel(
          conesModel: conesModel,
          cratersModel: cratersModel,
          domesMode: domesModel,
          history: historyModel,
          emissionHistory: emissionHistoryModel,
          image: document
              .getElementsByClassName('volcano-image-container')[0]
              .children[0]
              .attributes["src"],
          deformationHistory: deformationHistoryModel,
          name: document
              .getElementsByClassName("volcano-title-container")[0]
              .text,
          country: info.children[0].text,
          type: info.children[1].text,
          eruption: info.children[2].text,
          latitude: info2.children[0].text,
          longitude: info2.children[1].text,
          summit: '${summitAll[0]}m',
          elevation: summitAll[1],
          summary: check?[1]
                  .children[0]
                  .children[0]
                  .children[1]
                  .getElementsByTagName("p")
                  .map((e) => e.text)
                  .toList()[0]
                  .toString() ??
              '');
      this.model.image = model.image;
      newState(SVSuccess(model: model));
    } catch (e) {
      print(e);
      newState(SVError());
    }
  }

  @override
  void mapEventToState(SVEvent event) {
    if (event is SVSelectType) {
      newSuccessState(successState.copyWith(type: event.type));
    }
  }
}

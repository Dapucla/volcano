import 'dart:async';
import 'package:flutter/material.dart';
import '../services/api.dart';
import '../models/types_and_features_model.dart';
import 'types_and_features_event.dart';
import 'types_and_features_state.dart';

class TypesAndFeaturesBloc with ChangeNotifier {
  final ApiService apiService;

  final StreamController<TypesAndFeaturesState> _stateController = StreamController<TypesAndFeaturesState>.broadcast();
  final StreamController<TypesAndFeaturesEvent> _eventController = StreamController<TypesAndFeaturesEvent>();

  TypesAndFeaturesState _state = TypesAndFeaturesInitial();
  TypesAndFeaturesState get state => _state;

  Stream<TypesAndFeaturesState> get stream => _stateController.stream;
  Stream<TypesAndFeaturesLoaded> get successStream => _stateController.stream.where((state) => state is TypesAndFeaturesLoaded).cast<TypesAndFeaturesLoaded>();

  bool _isDisposed = false;

  TypesAndFeaturesBloc(this.apiService) {
    _eventController.stream.listen(_mapEventToState);
    _stateController.add(_state);
  }

  void addEvent(TypesAndFeaturesEvent event) {
    if (!_eventController.isClosed) {
      _eventController.add(event);
    }
  }

  void _mapEventToState(TypesAndFeaturesEvent event) async {
    if (_eventController.isClosed || _isDisposed) return;

    if (event is FetchTypesAndFeatures) {
      _state = TypesAndFeaturesLoading();
      _stateController.add(_state);

      try {
        final types = await apiService.fetchVolcanoTypes();
        if (_isDisposed) return;
        _state = TypesAndFeaturesLoaded(types);
      } catch (e) {
        if (_isDisposed) return;
        _state = TypesAndFeaturesError('Failed to fetch data: $e');
      }
      if (!_stateController.isClosed) {
        _stateController.add(_state);
      }
      notifyListeners();
    }

    if (event is FetchVolcanoDetails) {
      try {
        final updatedModel = await apiService.fetchVolcanoDetails(event.model, event.url);
        if (_isDisposed) return;
        _state = TypesAndFeaturesDetailsLoaded(updatedModel);
      } catch (e) {
        if (_isDisposed) return;
        _state = TypesAndFeaturesError('Failed to fetch details: $e');
      }
      if (!_stateController.isClosed) {
        _stateController.add(_state);
      }
      notifyListeners();
    }
  }

  @override
  void dispose() {
    if (!_isDisposed) {
      _isDisposed = true;
      _eventController.close();
      _stateController.close();
      super.dispose();
    }
  }
}

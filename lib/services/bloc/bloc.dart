import 'dart:async';

abstract class DBloc<DState, DEvent, DSuccess> {
  final _inputController = StreamController<DEvent>.broadcast();
  final _outputController = StreamController<DState>.broadcast();

  final _outputSuccessController = StreamController<DSuccess>.broadcast();

  Stream<DState> get stream => _outputController.stream;

  Stream<DSuccess> get successStream => _outputSuccessController.stream;

  Sink<DEvent> get sink => _inputController.sink;

  DState? _screenState;

  DState? get screenState => _screenState;

  void setScreenState(initialState) {
    _screenState = initialState;
    if (initialState is DSuccess) {
      _successState = initialState;
    }
  }

  late DSuccess _successState;

  DSuccess get successState => _successState;

  DBloc() {
    _inputController.stream.listen((event) => mapEventToState(event));
    fetchData();
  }

  void mapEventToState(DEvent event);

  bool successInitialize() => _screenState is DSuccess;

  Future<void> fetchData() async {}

  void newState(screenState) {
    if (!_outputController.isClosed) {
      if (screenState is DSuccess) {
        _successState = screenState;
      }
      _screenState = screenState;
      _outputController.add(screenState);
    }
  }

  void newSuccessState(DSuccess screenState) {
    if (!_outputController.isClosed) {
      _successState = screenState;
      _outputSuccessController.add(screenState);
    }
  }

  void dispose() {
    _outputSuccessController.close();
    _inputController.close();
    _outputController.close();
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

import 'bloc/types_and_features_bloc.dart';
import 'bloc/types_and_features_event.dart';
import 'bloc/types_and_features_state.dart';
import 'models/types_and_features_model.dart';
import 'services/api.dart';
import '../../widgets/types_and_features_item.dart';

class TypesAndFeaturesScreen extends StatefulWidget {
  const TypesAndFeaturesScreen({Key? key}) : super(key: key);

  @override
  _TypesAndFeaturesScreenState createState() => _TypesAndFeaturesScreenState();
}

class _TypesAndFeaturesScreenState extends State<TypesAndFeaturesScreen> {
  late TypesAndFeaturesBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = TypesAndFeaturesBloc(ApiService())..addEvent(FetchTypesAndFeatures());
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => bloc,
      child: Scaffold(
        appBar: AppBar(
          title: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text('Types and features'),
          ),
        ),
        body: Consumer<TypesAndFeaturesBloc>(
          builder: (context, bloc, child) {
            return StreamBuilder<TypesAndFeaturesState>(
              stream: bloc.stream,
              initialData: bloc.state,
              builder: (context, snapshot) {
                TypesAndFeaturesState? state = snapshot.data;
                if (state is TypesAndFeaturesLoaded) {
                  return _Success(state.types);
                }
                return const Center(child: CupertinoActivityIndicator());
              },
            );
          },
        ),
      ),
    );
  }
}

class _Success extends StatelessWidget {
  final List<TypesAndFeaturesModel> models;

  const _Success(this.models, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: models.length,
      itemBuilder: (context, index) => TypesAndFeaturesItem(model: models[index]),
    );
  }
}

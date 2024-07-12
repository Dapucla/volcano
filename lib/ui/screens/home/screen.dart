import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volcano/models/volcanes_list_model.dart';
import 'package:volcano/ui/screens/home/bloc/state.dart';

import '../../widgets/search.dart';
import 'bloc/bloc.dart';
import 'bloc/event.dart';
import 'components/filters.dart';
import '../../widgets/item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<HomeBloc>(
      create: (context) => HomeBloc(),
      dispose: (context, bloc) => bloc.dispose(),
      builder: (context, child) {
        HomeBloc bloc = context.read<HomeBloc>();

        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: DSearchBar(
              onSearch: (text) => bloc.sink.add(HomeSearch(text)),
            ),
          ),
          body: StreamBuilder<HomeState>(
            stream: bloc.stream,
            initialData: bloc.screenState,
            builder: (context, snapshot) {
              HomeState? state = snapshot.data;
              if (state is HomeSuccess) {
                return const _Success();
              }
              return const Center(child: CupertinoActivityIndicator());
            },
          ),
        );
      },
    );
  }
}

class _Success extends StatelessWidget {
  const _Success({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeBloc>(
      builder: (context, bloc, _) {
        return Column(
          children: [
            const HomeFilters(),
            Expanded(
              child: StreamBuilder<HomeSuccess>(
                stream: bloc.successStream,
                initialData: bloc.successState,
                builder: (context, snapshot) {
                  HomeSuccess state = snapshot.data!;
                  List<VolcanesListModel> models = state.filteredModels();
                  return ListView.builder(
                      itemCount: models.length,
                      itemBuilder: (context, index) =>
                          VolcanoItem(model: models[index]));
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

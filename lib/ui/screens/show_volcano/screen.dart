import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volcano/data/styles.dart';
import 'package:volcano/ui/screens/show_volcano/bloc/bloc.dart';
import 'package:volcano/ui/screens/show_volcano/bloc/state.dart';

import '../../../data/assets.dart';
import '../../../models/volcanes_list_model.dart';
import '../../widgets/like_button.dart';
import 'components/history.dart';
import 'components/info.dart';
import 'components/select.dart';
import 'components/synonyms.dart';

class ShowVolcanoScreen extends StatelessWidget {
  final VolcanesListModel model;

  const ShowVolcanoScreen({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
           title: Text('${model.name}'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right:  8.0),
              child: VolcanoFavoriteButton(model: model),
            )
          ],),
      body: Provider<SVBloc>(
        create: (context) => SVBloc(model.id!, model),
        dispose: (context, bloc) => bloc.dispose(),
        builder: (context, child) {
          SVBloc bloc = context.read<SVBloc>();
          return Stack(
            children: [
              StreamBuilder<SVState>(
                  stream: bloc.stream,
                  initialData: bloc.screenState,
                  builder: (context, snapshot) {
                    SVState? state = snapshot.data;

                    return Positioned(
                        top: 0,
                        right: 0,
                        left: 0,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: bloc.model.image != null &&
                                bloc.model.image !=
                                    '/includes/images/noimage.jpg'
                            ? Image.network(
                                'https://volcano.si.edu${bloc.model.image}',
                                fit: BoxFit.cover)
                            : Image.asset(DAssetImages.noImages));
                  }),
              DraggableScrollableSheet(
                initialChildSize: 0.7,
                minChildSize: 0.7,
                maxChildSize: 1,
                builder: (context, scrollController) {
                  return Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.only(
                            topRight: kBorderRadius.topRight,
                            topLeft: kBorderRadius.topLeft,
                          )),
                      child: SingleChildScrollView(
                          controller: scrollController,
                          padding: const EdgeInsets.symmetric(
                              vertical: kDefaultPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding),
                                child: Text(bloc.model.name.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding),
                                child: Text(bloc.model.subregion.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(
                                            fontWeight: FontWeight.normal)),
                              ),
                              const SizedBox(height: kDefaultPadding),
                              StreamBuilder(
                                stream: bloc.stream,
                                initialData: bloc.screenState,
                                builder: (context, snapshot) {
                                  SVState? state = snapshot.data;

                                  if (state is SVSuccess) {
                                    return const _Success();
                                  } else if (state is SVError) {
                                    return const Center(
                                        child: Padding(
                                            padding:
                                                EdgeInsets.all(kDefaultPadding),
                                            child: Text('Undefined error')));
                                  }

                                  return const Center(
                                      child: CupertinoActivityIndicator());
                                },
                              ),
                            ],
                          )));
                },
              )
            ],
          );
        },
      ),
    );
  }
}

class _Success extends StatelessWidget {
  const _Success({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SVBloc>(builder: (context, bloc, _) {
      return StreamBuilder<SVSuccess>(
          stream: bloc.successStream,
          initialData: bloc.successState,
          builder: (context, snapshot) {
            SVSuccess state = snapshot.data!;
            return Column(
              children: [
                const SVSelectView(),
                const SizedBox(height: kDefaultPadding),
                if (state.type == SVViewType.info)
                  const SVInfoView()
                else if (state.type == SVViewType.history)
                  const SVHistoryView()
                else
                  const SvSynonymsView()
              ],
            );
          });
    });
  }
}

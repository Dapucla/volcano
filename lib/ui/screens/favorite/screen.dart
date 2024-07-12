import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volcano/data/styles.dart';
import 'package:volcano/ui/screens/favorite/bloc/bloc.dart';
import 'package:volcano/ui/screens/favorite/bloc/state.dart';
import 'package:volcano/services/hive.dart';

import '../../widgets/item.dart';
import '../show_no_premium/screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HiveBD hiveBD = HiveBD();

    return FutureBuilder(
      future: hiveBD.initDb(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error initializing Hive'));
        } else {
          bool isPremium = hiveBD.getPremiumStatus();

          if (!isPremium) {
            return ShowNoPremiumScreen();
          }

          return Scaffold(
            appBar: AppBar(
              title: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text('Favorite'),
              ),
            ),
            body: Provider<FSBloc>(
              create: (context) => FSBloc(),
              dispose: (context, bloc) => bloc.dispose(),
              builder: (context, _) {
                FSBloc bloc = context.read<FSBloc>();
                return StreamBuilder<FSState>(
                  stream: bloc.stream,
                  initialData: bloc.screenState,
                  builder: (context, snapshot) {
                    FSState? state = snapshot.data;
                    if (state is FSSuccess) {
                      return const _Success();
                    }
                    return const Center(child: CupertinoActivityIndicator());
                  },
                );
              },
            ),
          );
        }
      },
    );
  }
}

class _Success extends StatelessWidget {
  const _Success({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FSBloc>(
      builder: (context, bloc, _) {
        return StreamBuilder<FSSuccess>(
          stream: bloc.successStream,
          initialData: bloc.successState,
          builder: (context, snapshot) {
            FSSuccess state = snapshot.data!;
            return ListView.builder(
              itemCount: state.models.length,
              itemBuilder: (context, index) =>
                  VolcanoItem(model: state.models[index]),
            );
          },
        );
      },
    );
  }
}
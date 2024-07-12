import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:volcano/services/hive.dart';
import 'package:volcano/ui/screens/splash/screen.dart';
import 'package:volcano/ui/screens/game/bloc/bloc.dart';

import 'data/assets.dart';
import 'data/consts.dart';
import 'data/styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await globalHiveDB.initDb();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

HiveBD globalHiveDB = HiveBD();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => QuizBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: SplashhScreen(),
      ),
    );
  }

  Future<bool> _showOnboarding() async {
    const FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();
    String? showOnboarding =
    await flutterSecureStorage.read(key: FSCConsts.showOnboarding);
    return showOnboarding != null;
  }
}

privacyPolicyPressed() {
  launchUrl(Uri.parse(
      'https://doc-hosting.flycricket.io/volcano-vigil-tracker-privacy-policy/e47910f1-088e-4cda-b921-fb1b38514872/privacy'));
}

termsOfUsePressed() {
  launchUrl(Uri.parse(
      'https://doc-hosting.flycricket.io/volcano-vigil-tracker-terms-of-use/6353b8d1-0b3b-4d30-bf6b-af41532255c5/terms'));
}

supportPressed() {
  launchUrl(Uri.parse(
      'https://docs.google.com/forms/d/e/1FAIpQLSe48cP-hBnZC2Fp6dRdMeD153QeKrKvlpS8vWCwdDc1q-JMZg/viewform?usp=sf_link'));
}

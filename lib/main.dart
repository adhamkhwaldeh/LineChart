import 'package:enpal_assignment/components/enpal_app.dart';
import 'package:enpal_assignment/di/env.dart';
import 'package:flutter/material.dart';
import 'package:enpal_assignment/di/di.dart' as di;
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    // systemNavigationBarColor: Colors.greenAccent, // navigation bar color
    // statusBarColor: Colors.greenAccent, // status bar color
    statusBarBrightness: Brightness.light, //status bar brigtness
    statusBarIconBrightness: Brightness.light, //status barIcon Brightness
    // systemNavigationBarDividerColor:
    //     Colors.greenAccent, //Navigation bar divider color
    // systemNavigationBarIconBrightness: Brightness.light, //navigation bar icon
  ));

  //Initialize the environment properties
  Env.init();

  //Initialize the dependencies
  await di.init();

  runApp(
    // To relaunch
    Phoenix(
      child: const EnpalApp(),
    ),
  );
}

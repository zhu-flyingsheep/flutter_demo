import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/splash/splashWidget.dart';
import 'package:json_annotation/json_annotation.dart';

import 'env/config_wrapper.dart';
import 'env/env_config.dart';

const _$configJsonLiteral = {'env': 'dev', 'debug': true};

@JsonLiteral('env_json_dev.json', asConst: true)
Map<String, dynamic> get config => _$configJsonLiteral;

void main() {
  runZonedGuarded(() {
    runApp(ConfigWrapper(
      child: const MyApp(),
      config: EnvConfig.fromJson(config),
    ));
    if (Platform.isAndroid) {
      //设置Android头部的导航栏透明
      SystemUiOverlayStyle systemUiOverlayStyle =
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }, (Object obj, StackTrace stack) {
    print(obj);
    print(stack);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RestartWidget(
      child: MaterialApp(
        theme: ThemeData(backgroundColor: Colors.black),
        home: const Scaffold(
          body: SplashWidget(),

        ),
      ),
    );
  }
}

//https://stackoverflow.com/questions/50115311/flutter-how-to-force-an-application-restart-in-production-mode 重启app方案
class RestartWidget extends StatefulWidget {
  const RestartWidget({Key? key, required this.child}) : super(key: key);
  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()?.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}

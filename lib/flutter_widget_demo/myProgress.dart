import 'package:flutter/material.dart';


class MyProgress extends StatelessWidget {
  const MyProgress({Key? key}) : super(key: key);

  static const String _title = '进度条';

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: _title,

      home: Scaffold(appBar: AppBar(
        title:  Text(_title),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),body: MyStatefulWidget(),),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..addListener(() {
      setState(() {});
    });
    controller.repeat(reverse: false);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("当前进度"+(controller.value*100).toInt().toString()),
          CircularProgressIndicator(value:  controller.value,semanticsLabel: 'Linear progress indicator',),
            LinearProgressIndicator(
              value: controller.value,
              semanticsLabel: 'Linear progress indicator',
            ),
          ],
        ),
      ),
    );
  }
}

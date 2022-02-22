import 'package:flutter/material.dart';
import 'package:flutter_demo/constant/constant.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = '网格';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title),leading:  BackButton(onPressed: (){   Navigator.pop(context);},),),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  static const int numItems = 10;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);

  @override
  Widget build(BuildContext context) {
    List<Widget> grids = List.generate(
        0,
        (index) => Container(
              padding: const EdgeInsets.all(8),
              child: const Text("He'd have you all unravel at the"),
              color: Colors.green[100],
            ));
    for (int i = 0; i <= 100; i++) {
      grids.add(Container(
        padding: const EdgeInsets.all(8),
        child: GestureDetector(
          child: Column(
            children: [
              Text("网格" + i.toString()),
              Image.asset(Constant.assetImg + "landscape.png")
            ],
          ),
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return SimpleDialog(
                    title: Text("点击:" + i.toString()),
                  );
                });
          },
        ),
        color: Colors.green[i * 100],
      ));
    }
    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverGrid.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            children: grids,
          ),
        ),
      ],
    );
  }
}

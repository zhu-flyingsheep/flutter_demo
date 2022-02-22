import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/constant/constant.dart';

class PullToRefresh extends StatelessWidget {
  const PullToRefresh({Key? key}) : super(key: key);

  static const String _title = '下拉刷新';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title:  Text(_title),
              leading: BackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
      body: MyStatefulWidget(),
    ));
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<Color> colors = <Color>[
    CupertinoColors.systemYellow,
    CupertinoColors.systemOrange,
    CupertinoColors.systemPink
  ];
  List<Widget> items = <Widget>[
    Container(color: CupertinoColors.systemPink, height: 100.0),
    Container(color: CupertinoColors.systemOrange, height: 100.0),
    Container(color: CupertinoColors.systemYellow, height: 100.0),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: <Widget>[

          CupertinoSliverRefreshControl(
            onRefresh: () async {
              await Future<void>.delayed(
                const Duration(milliseconds: 1000),
              );
              setState(() {
                items.insert(
                  0,
                  Container(color: colors[items.length % 3], height: 100.0),
                );
                items.insert(
                  0,
                  Container(color: colors[items.length % 3], height: 100.0),
                );
              });
            },
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) => items[index],
              childCount: items.length,
            ),
          ),
        ],
      ),
    );
  }
}

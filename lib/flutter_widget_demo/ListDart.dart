import 'package:flutter/material.dart';
import 'package:flutter_demo/constant/constant.dart';

class MyListView extends StatelessWidget {
  const MyListView({Key? key}) : super(key: key);

  static const String _title = '列表';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_title),
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
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
    List<Widget> cards = List.generate(0, (index) => const Text("data"));
    for (int index = 0; index <= 20000; index++) {
      cards.add(Card(
        child: ListTile(
          leading: FlutterLogo(size: 72.0),
          title: Text('列表：' + index.toString()),
          subtitle: Row(
            children: [
              Text("副标题"),
              Column(
                children: [Text(" 另外的内容显示"),Text(" 111"),Text(" 222"),Text(" 333")],
              )
            ],
          ),
          trailing: const Icon(Icons.more_vert),
          isThreeLine: false,
          onTap: (){  showDialog(
              context: context,
              builder: (BuildContext context) {
                return SimpleDialog(
                  title: Text("点击:" + index.toString()),
                );
              });},
        ),
      ));
    }
    return ListView(
      children: cards,
    );
  }
}

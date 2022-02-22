import 'package:flutter/material.dart';
import 'package:flutter_demo/flutter_widget_demo/myProgress.dart';
import 'package:flutter_demo/flutter_widget_demo/picker.dart';
import 'package:flutter_demo/flutter_widget_demo/pullDownRefresh.dart';

import '../constant/constant.dart';
import '../flutter_widget_demo/ListDart.dart';
import '../flutter_widget_demo/gridListDart.dart';
import 'groupPage.dart';

///首页，TAB页面，显示动态和推荐TAB
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: CustomScrollView(
            physics: RangeMaintainingScrollPhysics(),
            shrinkWrap: false,
            slivers: [
              SliverAppBar(
                actions: [
                  IconButton(
                    icon: const Icon(Icons.list),
                    onPressed: null,
                    tooltip: 'Saved Suggestions',
                  ),
                ],
                backgroundColor: Colors.grey,
                leading: Icon(Icons.festival_rounded),
                title: const Text(
                  "控件展示",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    GestureDetector(
                      child: const Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: Text("网格",
                            style: TextStyle(fontSize: 18, letterSpacing: 2)),
                      ),
                      onTap: () {
                        Navigator.of(context).push( MaterialPageRoute(builder: (context) {
                          return MyApp();
                        }));

                      },
                    ),
                    GestureDetector(
                      child: const Padding(
                        padding: EdgeInsets.only( top: 25),
                        child: Text("列表",
                            style: TextStyle(fontSize: 18, letterSpacing: 2)),
                      ),
                      onTap: () {
                        Navigator.of(context).push( MaterialPageRoute(builder: (context) {
                          return MyListView();
                        }));

                      },
                    ),
                    GestureDetector(
                      child: const Padding(
                        padding: EdgeInsets.only( top: 25),
                        child: Text("进度条",
                            style: TextStyle(fontSize: 18, letterSpacing: 2)),
                      ),
                      onTap: () {
                        Navigator.of(context).push( MaterialPageRoute(builder: (context) {
                          return MyProgress();
                        }));

                      },
                    ),
                    GestureDetector(
                      child: const Padding(
                        padding: EdgeInsets.only( top: 25),
                        child: Text("选择器",
                            style: TextStyle(fontSize: 18, letterSpacing: 2)),
                      ),
                      onTap: () {
                        Navigator.of(context).push( MaterialPageRoute(builder: (context) {
                          return picker();
                        }));

                      },
                    ),

                    GestureDetector(
                      child: const Padding(
                        padding: EdgeInsets.only( top: 25),
                        child: Text("下拉头部刷新",
                            style: TextStyle(fontSize: 18, letterSpacing: 2)),
                      ),
                      onTap: () {
                        Navigator.of(context).push( MaterialPageRoute(builder: (context) {
                          return PullToRefresh();
                        }));

                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_demo/util/screen_utils.dart';


///提供链接到一个唯一webview的单例实例，以便您可以从应用程序的任何位置控制webview

///市集 市集使用两个webView代替，因为豆瓣中 这个就是WebView
class ShopPageWidget extends StatelessWidget {
  const ShopPageWidget({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: ScreenUtils.screenW(context) ,
          height: ScreenUtils.screenH(context) ,
          color: Colors.red,
        ),
        Container(
          width: ScreenUtils.screenW(context)-100 ,
          height: ScreenUtils.screenH(context)-100 ,
          color: Colors.green,
        ),
        Container(
          width: ScreenUtils.screenW(context)-200 ,
          height: ScreenUtils.screenH(context)-200 ,
          color: Colors.black,
        ),
        Text(
          'shop_page',
          style: Theme.of(context).textTheme.headline4,
        ),
      ],
    );
  }
}



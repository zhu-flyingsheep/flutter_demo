import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


///https://www.jianshu.com/p/b9d6ec92926f

class MyRouter {
  static const homePage = 'app://';
  static const detailPage = 'app://DetailPage';
  static const playListPage = 'app://VideosPlayPage';
  static const searchPage = 'app://SearchPage';
  static const photoHero = 'app://PhotoHero';
  static const personDetailPage = 'app://PersonDetailPage';

//  Widget _router(String url, dynamic params) {
//    String pageId = _pageIdMap[url];
//    return _getPage(pageId, params);
//  }
//
//  Map<String, dynamic> _pageIdMap = <String, dynamic>{
//    'app/': 'ContainerPageWidget',
//    detailPage: 'DetailPage',
//  };

  Widget _getPage(String url, dynamic params) {

    return const Text("error");
  }

//
//  void push(BuildContext context, String url, dynamic params) {
//    Navigator.push(context, MaterialPageRoute(builder: (context) {
//      return _getPage(url, params);
//    }));
//  }

  MyRouter.pushNoParams(BuildContext context, String url) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, null);
    }));
  }

  MyRouter.push(BuildContext context, String url, dynamic params) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, params);
    }));
  }
}

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/constant.dart';
import '../flutter_widget_demo/CameraExampleHome.dart';
import '../flutter_widget_demo/GeolocatorWidget.dart';
import '../flutter_widget_demo/imagePickerTest.dart';
import '../main.dart';
import '../widget/image/heart_img_widget.dart';

typedef VoidCallback = void Function();

class PersonCenterPage extends StatelessWidget {
  const PersonCenterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: CustomScrollView(
                physics: BouncingScrollPhysics(),
                shrinkWrap: false,
                slivers: <Widget>[
                  SliverAppBar(
                    backgroundColor: Colors.transparent,
                    flexibleSpace: HeartImgWidget(Image.asset(
                        Constant.assetImg + 'bg_person_center_default.webp')),
                    expandedHeight: 200.0,
                  ),
                  SliverToBoxAdapter(
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, top: 15.0, bottom: 20.0, right: 10.0),
                          child: Image.asset(
                            Constant.assetImg + 'ic_notify.png',
                            width: 30.0,
                            height: 30.0,
                          ),
                        ),
                        const Expanded(
                          child: Text(
                            '提醒',
                            style: TextStyle(fontSize: 17.0),
                          ),
                        ),
                        _rightArrow()
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 100.0,
                      alignment: Alignment.center,
                      child: const Text(
                        '暂无新提醒',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  _divider(),
                  _dataSelect(),
                  _divider(),
                  _personItem('ic_me_journal.png', '我的发布'),
                  _personItem('ic_me_follows.png', '我的关注'),
                  _personItem('ic_me_photo_album.png', '相册', onTab: () async {
                    // CameraExampleHome
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return ImagePickText();
                    }));

                  }),
                  _personItem('ic_me_doulist.png', '豆列 / 收藏'),
                  _divider(),
                  _personItem('ic_me_wallet.png', '钱包',
                      onTab: () => {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const SimpleDialog(
                                    title: Text("点击钱包"),
                                  );
                                })
                          }),
                  _divider(),
                  _personItem('ic_me_wallet.png', '定位', onTab: () async {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return GeolocatorWidget();
                    }));

                  }),
                  _divider(),
                  _personItem('ic_me_wallet.png', '相机', onTab: () async {
                    try {
                      WidgetsFlutterBinding.ensureInitialized();
                      cameras = await availableCameras();
                      var camera = CameraApp(
                        camerasPara: cameras,
                      );
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return camera;
                      }));
                    } on CameraException catch (e) {
                      logError(e.code, e.description);
                    }
                  }),
                  _divider(),
                  _personItem('ic_me_wallet.png', '第三方sdk'),
                  _divider(),
                  _personItem('ic_me_wallet.png', '自定义'),
                  _divider(),
                ])),
      ),
    );
  }

  SliverToBoxAdapter _personItem(String imgAsset, String title,
      {VoidCallback? onTab}) {
    return SliverToBoxAdapter(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Image.asset(
                Constant.assetImg + imgAsset,
                width: 30.0,
                height: 30.0,
              ),
            ),
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            _rightArrow()
          ],
        ),
        onTap: onTab,
      ),
    );
  }

  _dataSelect() {
    return UseNetDataWidget();
  }

  SliverToBoxAdapter _divider() {
    return SliverToBoxAdapter(
      child: Container(
        height: 10.0,
        color: const Color.fromARGB(255, 247, 247, 247),
      ),
    );
  }

  _rightArrow() {
    return const Icon(
      Icons.chevron_right,
      color: Color.fromARGB(255, 204, 204, 204),
    );
  }
}

class UseNetDataWidget extends StatefulWidget {
  @override
  _UseNetDataWidgetState createState() => _UseNetDataWidgetState();
}

class _UseNetDataWidgetState extends State<UseNetDataWidget> {
  bool mSelectNetData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Row(
          children: <Widget>[
            const Text(
              '开关展示',
              style: TextStyle(color: Colors.blue, fontSize: 17.0),
            ),
            Expanded(
              child: Container(),
            ),
            CupertinoSwitch(
              value: mSelectNetData,
              onChanged: (bool value) {
                mSelectNetData = value;
                String tmp;
                if (value) {
                  tmp = '描述信息';
                } else {
                  tmp = '描述信息';
                }
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('提示'),
                        content: Text(tmp),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('稍后我自己重启'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('现在重启'),
                            onPressed: () {
                              RestartWidget.restartApp(context);
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );
                    });
                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }
}

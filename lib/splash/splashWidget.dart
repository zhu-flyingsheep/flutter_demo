import 'dart:async';

import 'package:flutter/material.dart';

import '../constant/constant.dart';
import '../container_page.dart';
import '../util/screen_utils.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  var container = const ContainerPage();
  bool showAd = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Offstage(child: container, offstage: showAd),

        Offstage(
          child: Container(
            color: Colors.white,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: const Alignment(0.0, 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: ScreenUtils.screenW(context) / 3,
                        backgroundColor: Colors.white,
                        backgroundImage:
                            const AssetImage(Constant.assetImg + 'home.png'),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text(
                          '即将进入主界面！',
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
                SafeArea(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Align(
                      alignment: Alignment(1.0, 0.0),
                      child: Container(
                        margin: const EdgeInsets.only(right: 30.0, top: 20.0),
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 2.0, bottom: 2.0),
                        child: CountDownWidget(
                          onCountDownFinishCallBack: (bool value) {
                            if (value) {
                              setState(() {
                                showAd = false;
                              });
                            }
                          },
                        ),
                        decoration: const BoxDecoration(
                            color: Color(0xffEDEDED),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            Constant.assetImg + 'ic_launcher.png',
                            width: 50.0,
                            height: 50.0,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              '这是启动界面！',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ))
              ],
            ),
            width: ScreenUtils.screenW(context),
            height: ScreenUtils.screenH(context),
          ),
          offstage: !showAd,
        )
      ],
    );
  }
}

class CountDownWidget extends StatefulWidget {
  final onCountDownFinishCallBack;

  const CountDownWidget({Key? key, @required this.onCountDownFinishCallBack})
      : super(key: key);

  @override
  _CountDownWidgetState createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  var _seconds = 4;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_seconds',
      style: const TextStyle(fontSize: 17.0),
    );
  }

  /// 启动倒计时的计时器。
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
      if (_seconds <= 1) {
        widget.onCountDownFinishCallBack(true);
        _cancelTimer();
        return;
      }
      _seconds--;
    });
  }

  /// 取消倒计时的计时器。
  void _cancelTimer() {
    _timer.cancel();
  }
}

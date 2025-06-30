import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:subpersona/utils/toColor.dart';
import 'package:subpersona/components/button.dart';
import 'package:subpersona/components/top_layout.dart';
import 'package:subpersona/pages/home.dart';
import 'package:subpersona/components/task_btn.dart';
import 'package:subpersona/pages/2nd_section.dart';
import 'dart:async';
import 'package:sensors_plus/sensors_plus.dart';


class FirstSection extends StatefulWidget {
  @override
  _FirstSectionState createState() => _FirstSectionState();
}

class _FirstSectionState extends State<FirstSection> {
  StreamSubscription? _gyroSub;
  double x = 0.0, y = 0.0, z = 0.0;
  bool isListening = false;
  bool _dialogOpen = false;

  void _startGyro() {
    if (isListening) return;
    _gyroSub = gyroscopeEvents.listen((event) {
      setState(() {
        x = event.x;
        y = event.y;
        z = event.z;
      });
      if (event.x.abs() > 3 || event.y.abs() > 3 || event.z.abs() > 3) {
        debugPrint('흔들림 감지됨');
        if(!_dialogOpen){
          _showGyroDialog();
          _dialogOpen = true;
        }
      }
    });

    setState(() {
      isListening = true;
    });
  }


  void _onNextPressed() {
    _gyroSub?.cancel();
  }

  @override
  void dispose() {
    _gyroSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFF18171D),
      navigationBar: CupertinoNavigationBar(),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox.expand(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TopLayout(
                    title: "휴대폰을 흔들어보세요",
                    subtitle: "1단계",
                    imgPath: "assets/Cone.png",
                    padding: 52,
                    titleFont: 35,
                  ),
                  SizedBox(height: 100),

                  TaskBtn(
                    ImgPath: "assets/shake.png",
                    onPressed: _startGyro,
                  ),

                  SizedBox(height: 88),

                  Center(
                    child: AnalyzeButton(
                      nextPage: SecondSection(),
                      label: '다음으로',
                      onPressed: _onNextPressed,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showGyroDialog() {
    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            // 자이로 업데이트될 때마다 setModalState를 호출하도록 타이머 설정
            Timer.periodic(Duration(milliseconds: 100), (timer) {
              if (!_dialogOpen) {
                timer.cancel();
                return;
              }
              setModalState(() {});
            });

            return CupertinoAlertDialog(
              title: Text('흔들림 감지'),
              content: Column(
                children: [
                  SizedBox(height: 12),
                  Text('X: ${x.toStringAsFixed(2)}'),
                  Text('Y: ${y.toStringAsFixed(2)}'),
                  Text('Z: ${z.toStringAsFixed(2)}'),
                ],
              ),
              actions: [
                CupertinoDialogAction(
                  isDestructiveAction: true,
                  child: Text('닫기'),
                  onPressed: () {
                    _dialogOpen = false;
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

}




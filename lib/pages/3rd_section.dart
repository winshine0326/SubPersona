import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:subpersona/utils/toColor.dart';
import 'package:subpersona/components/button.dart';
import 'package:subpersona/components/top_layout.dart';
import 'package:subpersona/pages/result.dart';
import 'package:subpersona/components/task_btn.dart';

class ThirdSection extends StatefulWidget {
  @override
  _ThirdSectionState createState() => _ThirdSectionState();
}

class _ThirdSectionState extends State<ThirdSection> {
  File? _image;

  Future<void> _takePhoto() async {
    // 권한 요청
    final cameraStatus = await Permission.camera.request();
    if (!cameraStatus.isGranted) {
      _showPermissionDeniedDialog();
      return;
    }

    // 카메라 열기
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      print('📸 사진 촬영 완료: ${pickedFile.path}');
    } else {
      print('❌ 사진 촬영 취소됨');
    }
  }

  void _showPermissionDeniedDialog() {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text('카메라 권한이 필요합니다'),
        content: Text('설정 > 카메라 접근을 허용해주세요.'),
        actions: [
          CupertinoDialogAction(
            child: Text('설정 열기'),
            onPressed: () {
              openAppSettings();
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: Text('취소'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
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
                    title: "얼굴 사진을 찍어보세요",
                    subtitle: "3단계",
                    imgPath: "assets/Box.png",
                    padding: 52,
                    titleFont: 35,
                  ),
                  SizedBox(height: 100),

                  TaskBtn(
                    ImgPath: "assets/photo.png",
                    onPressed: _takePhoto,
                  ),

                  SizedBox(height: 12),

                  if (_image != null)
                    Text(
                      "사진이 저장되었습니다!",
                      style: TextStyle(color: Colors.white),
                    ),

                  SizedBox(height: 88),
                  Center(
                    child: AnalyzeButton(
                      nextPage: ResultPage(),
                      label: '다음으로',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

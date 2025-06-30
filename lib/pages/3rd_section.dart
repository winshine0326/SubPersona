import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:subpersona/utils/toColor.dart';
import 'package:subpersona/components/button.dart';
import 'package:subpersona/components/top_layout.dart';
import 'package:subpersona/pages/home.dart';
import 'package:subpersona/components/task_btn.dart';
import 'package:subpersona/pages/result.dart';

class ThirdSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: const Color(0xFF18171D),
        navigationBar: CupertinoNavigationBar(),
        child: SafeArea(
            child:Padding(
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
                          ImgPath:"assets/photo.png"
                      ),
                      SizedBox(height: 88),
                      Center(
                        child: AnalyzeButton(
                          nextPage: ResultPage(),
                          label: '다음으로',
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
        )
    );
  }
}


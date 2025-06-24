import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:subpersona/utils/toColor.dart';
import 'package:subpersona/components/button.dart';
import 'package:subpersona/components/top_layout.dart';
import 'package:subpersona/pages/home.dart';
import 'package:subpersona/components/task_btn.dart';

class FirstSection extends StatelessWidget {
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
                      title: "휴대폰을 흔들어보세요",
                      subtitle: "1단계",
                      imgPath: "assets/Cone.png",
                      padding: 52,
                    ),
                    SizedBox(height: 100),

                    TaskBtn(
                      ImgPath:"assets/shake.png"
                    ),
                    SizedBox(height: 88),
                    Center(
                      child: AnalyzeButton(
                        nextPage: HomePage(),
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


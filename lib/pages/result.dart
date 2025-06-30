import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:subpersona/utils/toColor.dart';
import 'package:subpersona/components/top_layout.dart';
import 'package:subpersona/components/button.dart';
import 'package:subpersona/pages/home.dart';
import 'package:subpersona/pages/actually.dart';


class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFF18171D),
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
                      title: "Result",
                      subtitle: "인간 내면 분석기",
                      imgPath: "assets/Pentagon.png",
                    ),
                    SizedBox(height: 52),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 22),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF2C2C36),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 309,
                            child: Text(
                              '분석결과',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 309,
                                child: Text(
                                  '흔들기 분석 : 당신은 휴대폰을 잘 흔드는 사람입니다.',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              SizedBox(
                                width: 309,
                                child: Text(
                                  '음성 인식 분석 : 당신은 인사성이 밝은 사람입니다.',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              SizedBox(
                                width: 309,
                                child: Text(
                                  '사진 찍기 분석 : 당신은 아름다운 사람입니다.',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 36),
                    Center(
                        child: AnalyzeButton(
                          nextPage: ActuallyPage(),
                          label: '확인',
                        )
                    )
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}


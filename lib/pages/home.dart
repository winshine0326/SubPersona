import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:subpersona/utils/toColor.dart';

import 'package:subpersona/components/button.dart';
import '1st_section.dart';

class HomePage extends StatelessWidget {
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
                  Column(
                    children: [
                      Text(
                        "인간 내면 분석기",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF8C8B91),
                        ),
                      ),
                      SizedBox(height: 12),
                      GradientText(
                        "SubPersona",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.normal,
                        ),
                        colors: [
                          "#3A9FA9".toColor(),
                          "#3985E3".toColor(),
                        ],
                      ),
                      SizedBox(height: 40),
                      Image.asset(
                        "assets/Rock.png",
                        width: 171,
                        height: 166,
                      ),
                    ],
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
                            '당신의 내면을 분석해드립니다',
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
                                '1. 당신의 위치, 움직임, 목소리, 표정을 기반으로 지금 이 순간의 내면 상태를 정밀 분석합니다.',
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
                                '2. 첨단 AI 센서 시스템으로 겉으로 드러나지 않는 진짜 감정을 파악하세요.',
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
                                '3. SubPersona는 보이지 않는 당신을 이해하는, 단 하나의 인공지능 분석기입니다.',
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
                      nextPage: FirstSection(),
                      label: '분석하기',
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


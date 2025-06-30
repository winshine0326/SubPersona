import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subpersona/pages/home.dart';
import 'package:subpersona/components/button.dart';

class ActuallyPage extends StatelessWidget {
  const ActuallyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFF18171D), // 어두운 배경
      navigationBar: const CupertinoNavigationBar(
        middle: Text('분석 결과'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                    const SizedBox(
                      width: 309,
                      child: Text(
                        '사실은',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SizedBox(
                          width: 309,
                          child: Text(
                            '1. 이건 사실 AI 인간 분석이 아닙니다.',
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
                            '2. 그냥 당신의 정보를 수집하는 서비스입니다.',
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
                            '3. 당신의 데이터는 저희가 소중하게 사용하겠습니다.',
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
                            '4. 최근 생성형 AI와 LLM의 발전은 디지털 산업 전반에 새로운 가능성을 열어주었습니다.하지만 동시에, 이러한 흐름에 그저 편승한 사례들 또한 계속적으로 나오고 있습니다. 많은 서비스들이 “AI 분석”, “AI 추천”이라는 이름 아래 실제로는 의미 없는 기능을 덧붙이거나, 사용자 경험과 무관한 AI 요소를 억지로 끼워 넣는 현상이 빈번하게 나타나고 있습니다. ',
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
              const SizedBox(height: 36),
              Center(
                child: AnalyzeButton(
                  nextPage: HomePage(),
                  label: '홈으로',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

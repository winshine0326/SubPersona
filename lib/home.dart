import 'package:flutter/cupertino.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
          child: Center(
            child: Column(
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
                    )
                  ],
                ),
                SizedBox(height: 40),
                Image.asset("assets/Rock.png",width: 171,height: 166,)
              ],
            ),
          ),
      )

    );
  }
}

extension HexColor on String {
  Color toColor() {
    final hex = replaceAll('#', '');
    final buffer = StringBuffer();
    if (hex.length == 6) buffer.write('FF'); // opacity
    buffer.write(hex);
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

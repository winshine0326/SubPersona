// lib/components/analyze_button.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnalyzeButton extends StatelessWidget {
  final Widget nextPage;
  final String label;

  const AnalyzeButton({
    super.key,
    required this.nextPage,
    this.label = '분석하기',
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => nextPage),
        );
      },
      child: Container(
        width: double.infinity,
        height: 74,
        padding: const EdgeInsets.symmetric(horizontal: 104, vertical: 22),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0xFF3182F7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

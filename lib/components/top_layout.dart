import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:subpersona/utils/toColor.dart';

class TopLayout extends StatelessWidget{
  final String subtitle;
  final String title;
  final String imgPath;
  final double padding;

  const TopLayout({
    super.key,
    required this.subtitle,
    required this.title,
    required this.imgPath,
    this.padding = 40,
  });

  @override
  Widget build(BuildContext context){
    return
      Column(
        children: [
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.normal,
              color: Color(0xFF8C8B91),
            ),
          ),
          SizedBox(height: 12),
          GradientText(
            title,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.normal,
            ),
            colors: [
              "#3A9FA9".toColor(),
              "#3985E3".toColor(),
            ],
          ),
          SizedBox(height: padding),
          Image.asset(
            imgPath,
            width: 171,
            height: 166,
          ),
        ],
      );
  }
}
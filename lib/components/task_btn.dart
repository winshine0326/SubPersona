import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskBtn extends StatelessWidget {
  final String ImgPath;
  final VoidCallback? onPressed;

  const TaskBtn({
    super.key,
    required this.ImgPath,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            width: 88,
            height: 88,
            padding: const EdgeInsets.all(16),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: const Color(0xFF2C2C36),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: Center(
              child: SizedBox(
                width: 32,
                height: 32,
                child: Image.asset(ImgPath, fit: BoxFit.contain),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

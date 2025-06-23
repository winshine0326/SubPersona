import 'package:flutter/cupertino.dart';

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFF18171D),
      navigationBar: CupertinoNavigationBar(),
      child: Center(
        child: Text("여기는 두 번째 페이지입니다."),
      ),
    );
  }
}
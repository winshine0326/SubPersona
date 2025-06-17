import 'package:flutter/cupertino.dart';

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("다음 페이지"),
      ),
      child: Center(
        child: Text("여기는 두 번째 페이지입니다."),
      ),
    );
  }
}
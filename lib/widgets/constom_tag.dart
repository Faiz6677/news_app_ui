import 'package:flutter/cupertino.dart';

class CustomTag extends StatelessWidget {
  final Color backGroundColor;
  final List<Widget> children;

  const CustomTag(
      {super.key, required this.backGroundColor, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0), color: backGroundColor),
    );
  }
}


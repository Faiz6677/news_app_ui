import 'package:flutter/cupertino.dart';

class ImageContainer extends StatelessWidget {
  final double height;
  final double width;
  final String imageUrl;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget? child;
  final double bordarRadius;

  const ImageContainer(
      {super.key,
        this.height = 125,
        required this.width,
        required this.imageUrl,
        this.padding,
        this.margin,
        this.bordarRadius = 20,
        this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      child: child,
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(bordarRadius),
        image:
        DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
      ),
    );
  }
}

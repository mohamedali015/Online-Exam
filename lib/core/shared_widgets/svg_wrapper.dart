import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgWrapper extends StatelessWidget {
  const SvgWrapper({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.fit = BoxFit.scaleDown,
    this.color,
  });

  final String path;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;


  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      fit: fit,
      width: width,
      height: height,
      colorFilter:
      color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
    );
  }
}
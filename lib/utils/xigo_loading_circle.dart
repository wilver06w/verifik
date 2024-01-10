import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:verifik/utils/colors.dart';

class XigoLoadingCircle extends StatefulWidget {
  final Color? color;
  final double? height;
  final double? width;
  const XigoLoadingCircle({
    Key? key,
    this.color,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  createState() => _XigoLoadingCircleState();
}

class _XigoLoadingCircleState extends State<XigoLoadingCircle>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();

    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: controller!,
        builder: (_, child) {
          return Transform.rotate(
            angle: controller!.value * 2 * math.pi,
            child: child,
          );
        },
        child: SizedBox(
          height: widget.height ?? 50,
          width: widget.width ?? 50,
          child: SvgPicture.asset('assets/animations/loading/loading.svg',
              colorFilter: const ColorFilter.mode(
                XigoColors.catalinaBlue,
                BlendMode.srcIn,
              )),
        ),
      ),
    );
  }
}

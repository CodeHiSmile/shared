import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final double? height;
  final Color backgroundColor;
  final Color valueColor;
  final double loadingSize;
  final double strokeWidth;

  const LoadingIndicator({
    super.key,
    this.height = 50,
    this.backgroundColor = Colors.white,
    this.valueColor = Colors.blue,
    this.loadingSize = 24,
    this.strokeWidth = 4,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Container(
        alignment: Alignment.center,
        child: SizedBox(
          width: loadingSize,
          height: loadingSize,
          child: CircularProgressIndicator(
            backgroundColor: backgroundColor,
            valueColor: AlwaysStoppedAnimation<Color>(valueColor),
            strokeWidth: strokeWidth,
          ),
        ),
      ),
    );
  }
}

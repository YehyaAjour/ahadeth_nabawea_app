import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextAlign textAlign;
  final Color color;
  final bool underline;
  final FontWeight fontWeight;
  final int maxLines;
  final String fontFamily;
  final double height;

  CustomText(this.text,
      {this.fontSize,
        this.textAlign,
        this.color,
        this.fontWeight,
        this.underline = false,
        this.maxLines,
        this.fontFamily,
        this.height});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? 'استبدل',
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: TextStyle(
        fontWeight: fontWeight ?? FontWeight.bold,
        fontSize: fontSize ?? 22,
        color: color ?? Colors.black,
        fontFamily: fontFamily ?? 'din',
        decoration: underline ? TextDecoration.underline : TextDecoration.none,
        height: height
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BaseLabelTextWidget extends StatelessWidget {
  /// The text to display.
  final String text;

  /// The size of text.
  final double? fontSize;

  /// The color of the text.
  final Color? color;

  /// Font weight of the text.
  final FontWeight? fontWeight;

  /// Alignment of the text within its container.
  final TextAlign? textAlign;

  /// How visual overflow should be handled.
  final TextOverflow? textOverflow;

  /// Creates a text widget with default font size of 14 and normal font weight.
  ///
  /// The [text] parameter is required.
  ///
  /// The [fontSize] parameter sets the size of the text. Default is 14.
  ///
  /// The [color] parameter sets the color of the text. Default is black.
  ///
  /// The [fontWeight] parameter sets the font weight of the text. Default is normal.
  const BaseLabelTextWidget({
    super.key,
    required this.text,
    this.fontSize = 14,
    this.color = Colors.white,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.left,
    this.textOverflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: textOverflow,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}

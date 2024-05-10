import 'package:flutter/material.dart';

class BaseHeadingTextWidget extends StatelessWidget {
  /// The text to display.
  final String text;

  /// The size of text.
  final double? fontSize;

  /// The color of the text.
  final Color? color;

  /// Font weight of the text.
  final FontWeight? fontWeight;

  /// Maximum number of lines to display before truncating the text.
  final int? maxLines;

  /// Alignment of the text within its container.
  final TextAlign? textAlign;

  /// How visual overflow should be handled.
  final TextOverflow? textOverflow;

  /// Creates a text widget with default font size of 30 and bold font weight.
  ///
  /// The [text] parameter is required.
  ///
  /// The [fontSize] parameter sets the size of the text. Default is 30.
  ///
  /// The [color] parameter sets the color of the text. Default is black.
  ///
  /// The [fontWeight] parameter sets the font weight of the text. Default is bold.
  ///
  /// The [maxLines] parameter specifies the maximum number of lines to display before truncating the text. Its default value is 1.
  ///
  /// The [textAlign] parameter specifies the alignment of the text within its container. Its deafault value it left.
  ///
  /// The [textOverflow] parameter specifies how visual overflow should be handled. Takes [TextOverflow.ellipsis] on default.
  const BaseHeadingTextWidget({
    super.key,
    required this.text,
    this.fontSize = 30,
    this.color = Colors.white,
    this.fontWeight = FontWeight.bold,
    this.maxLines = 1,
    this.textAlign = TextAlign.left,
    this.textOverflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
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

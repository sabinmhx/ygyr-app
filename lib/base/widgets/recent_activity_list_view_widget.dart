import 'package:flutter/material.dart';
import 'package:ygyr/base/colors/app_color.dart';
import 'package:ygyr/base/widgets/text/base_label_text_widget.dart';

class RecentActivityListWidget extends StatelessWidget {
  final String imagePath;
  final double? imageHeight;
  final double? imageWidth;
  final String? date;
  final String? title;
  final String? percent;
  const RecentActivityListWidget({
    super.key,
    required this.imagePath,
    this.imageHeight,
    this.imageWidth,
    this.date,
    this.title,
    this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: AppColor.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      surfaceTintColor: AppColor.accentColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Colors.grey[100],
                    ),
                    child: Image.asset(
                      imagePath,
                      width: imageWidth,
                      height: imageHeight,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseLabelTextWidget(text: title ?? ''),
                    BaseLabelTextWidget(text: date ?? '')
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BaseLabelTextWidget(
                text: percent ?? '10%',
                color: AppColor.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

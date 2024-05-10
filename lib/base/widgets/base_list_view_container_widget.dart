import 'package:flutter/material.dart';
import 'package:ygyr/base/widgets/text/base_heading_text_widget.dart';
import 'package:ygyr/base/widgets/text/base_label_text_widget.dart';

class BaseListViewContainerWidget extends StatelessWidget {
  final String imagePath;
  final double? imageHeight;
  final double? imageWidth;
  final bool? isHome;
  const BaseListViewContainerWidget({
    super.key,
    required this.imagePath,
    this.imageHeight,
    this.imageWidth,
    this.isHome,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 45, 45, 45),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
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
                      color: const Color.fromARGB(255, 160, 159, 159),
                    ),
                    child: Image.asset(
                      imagePath,
                      width: imageWidth,
                      height: imageHeight,
                    ),
                  ),
                ),
                (isHome ?? false)
                    ? const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BaseLabelTextWidget(text: 'Silver'),
                          BaseLabelTextWidget(text: '2020')
                        ],
                      )
                    : Container(),
              ],
            ),
            (isHome ?? false)
                ? _homePageListDetail()
                : _warehousePageListDetail()
          ],
        ),
      ),
    );
  }

  Column _warehousePageListDetail() {
    return const Column(
      children: [
        BaseHeadingTextWidget(
          text: 'ClassName',
          fontSize: 20,
        ),
        Row(
          children: [
            BaseLabelTextWidget(text: 'Date'),
            SizedBox(width: 40),
            BaseLabelTextWidget(text: 'Quantity'),
          ],
        ),
        BaseLabelTextWidget(text: 'Data'),
      ],
    );
  }

  Padding _homePageListDetail() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: BaseLabelTextWidget(
        text: '22%',
        color: Colors.green,
      ),
    );
  }
}

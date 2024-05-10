import 'package:flutter/material.dart';
import 'package:ygyr/base/ui_helper/ui_helper.dart';
import 'package:ygyr/base/widgets/base_list_view_container_widget.dart';
import 'package:ygyr/base/widgets/button/base_primary_icon_button_widget.dart';
import 'package:ygyr/base/widgets/text/base_heading_text_widget.dart';
import 'package:ygyr/base/widgets/text/base_label_text_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: UiHelper.getSymmetricPadding(
          horizontal: Spacing.xSmall,
          vertical: Spacing.xSmall,
        ),
        child: Column(
          children: [
            Padding(
              padding: UiHelper.getSymmetricPadding(
                vertical: Spacing.xSmall,
                horizontal: Spacing.xMedium,
              ),
              child: const Align(
                alignment: Alignment.topLeft,
                child: BaseLabelTextWidget(text: 'Dashboard'),
              ),
            ),
            Expanded(
              flex: 2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 180,
                      child: Card(
                        color: const Color.fromARGB(255, 45, 45, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Align(
                                alignment: Alignment.topLeft,
                                child: BaseLabelTextWidget(text: 'Searched'),
                              ),
                              UiHelper.getHorizontalSpacing(
                                  spacing: Spacing.small),
                              const Align(
                                alignment: Alignment.topLeft,
                                child: BaseHeadingTextWidget(text: '24'),
                              ),
                              const SizedBox(height: 15),
                              GestureDetector(
                                onTap: () {},
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Icon(
                                      Icons.arrow_right,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            UiHelper.getVerticalSpacing(spacing: Spacing.medium),
            Padding(
              padding: UiHelper.getSymmetricPadding(
                  horizontal: Spacing.xMedium, vertical: Spacing.xSmall),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BaseLabelTextWidget(text: 'Recent Activity'),
                    BaseIconButtonWidget(
                      icon: Icons.read_more,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return const Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: BaseListViewContainerWidget(
                        isHome: true,
                        imagePath: 'assets/images/logo.png',
                        imageHeight: 50,
                        imageWidth: 50,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

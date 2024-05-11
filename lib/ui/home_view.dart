import 'package:flutter/material.dart';
import 'package:ygyr/base/colors/app_color.dart';
import 'package:ygyr/base/ui_helper/ui_helper.dart';
import 'package:ygyr/base/widgets/button/base_primary_icon_button_widget.dart';
import 'package:ygyr/base/widgets/recent_activity_list_view_widget.dart';
import 'package:ygyr/base/widgets/text/base_heading_text_widget.dart';
import 'package:ygyr/base/widgets/text/base_label_text_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: UiHelper.getSymmetricPadding(
          horizontal: Spacing.xSmall,
          vertical: Spacing.xSmall,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UiHelper.getSymmetricPadding(
                vertical: Spacing.xSmall,
                horizontal: Spacing.xMedium,
              ),
              child: const BaseLabelTextWidget(
                text: 'Leaderboard',
                fontSize: 18,
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
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/images/logo.png',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(Icons.error);
                                  },
                                  colorBlendMode: BlendMode.dstOut,
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                              ),
                            ),
                            if (index == 4)
                              Align(
                                alignment: Alignment.topRight,
                                child: BaseIconButtonWidget(
                                  icon: Icons.forward,
                                  onPressed: () {},
                                ),
                              ),
                            const Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: BaseHeadingTextWidget(
                                  text: '24',
                                  color: AppColor.primaryColor,
                                ),
                              ),
                            ),
                          ],
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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BaseLabelTextWidget(
                    text: 'Recent Activity',
                    fontSize: 18,
                  ),
                  BaseIconButtonWidget(icon: Icons.read_more),
                ],
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
                      child: RecentActivityListWidget(
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

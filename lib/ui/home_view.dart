import 'package:flutter/material.dart';
import 'package:ygyr/base/colors/app_color.dart';
import 'package:ygyr/base/ui_helper/ui_helper.dart';
import 'package:ygyr/base/widgets/button/base_primary_icon_button_widget.dart';
import 'package:ygyr/base/widgets/recent_activity_list_view_widget.dart';
import 'package:ygyr/base/widgets/text/base_heading_text_widget.dart';
import 'package:ygyr/base/widgets/text/base_label_text_widget.dart';
import 'package:ygyr/model/activity_model.dart';
import 'package:ygyr/model/leaderboard_model.dart';
import 'package:ygyr/services/activity_services.dart';
import 'package:ygyr/services/leaderboard_services.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<LeaderboardModel?> _leaderboardFuture;
  // late Future<ActivityModel?> _recentActivityFuture;

  @override
  void initState() {
    super.initState();
    _leaderboardFuture = LeaderboardServices().getLeaderBoard();
    // _recentActivityFuture = ActivityServices().getActivity();
  }

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
              flex: 3,
              child: _buildLeaderboardList(),
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
              child: _buildRecentActivityList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLeaderboardList() {
    return FutureBuilder<LeaderboardModel?>(
      future: _leaderboardFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final leaderboardModel = snapshot.data;
          if (leaderboardModel != null && leaderboardModel.data != null) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: leaderboardModel.data!.length,
              itemBuilder: (context, index) {
                final data = leaderboardModel.data![index];
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
                              child: Image.network(
                                data.url ?? 'assets/images/logo.png',
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.error);
                                },
                                colorBlendMode: BlendMode.dstOut,
                                color: Colors.grey.withOpacity(0.3),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 8.0, bottom: 8.0),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: BaseHeadingTextWidget(
                                text: data.points.toString(),
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
            );
          } else {
            return const Center(child: Text('No leaderboard data available.'));
          }
        }
      },
    );
  }

  Widget _buildRecentActivityList() {
    return FutureBuilder<ActivityModel?>(
      future: ActivityServices().getActivity(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final activityModel = snapshot.data;
          if (activityModel != null && activityModel.data != null) {
            return ListView.builder(
              itemCount: activityModel.data!.length,
              itemBuilder: (context, index) {
                final data = activityModel.data![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RecentActivityListWidget(
                    date: data.date ?? '',
                    title: data.title ?? '',
                    percent: data.percent ?? '',
                    imagePath: 'assets/images/logo.png',
                    imageHeight: 50,
                    imageWidth: 50,
                  ),
                );
              },
            );
          } else {
            return const Center(
                child: Text('No recent activity data available.'));
          }
        }
      },
    );
  }
}

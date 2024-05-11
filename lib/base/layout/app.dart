import 'package:flutter/material.dart';
import 'package:ygyr/base/widgets/button/base_primary_icon_button_widget.dart';
import 'package:ygyr/base/widgets/text/base_heading_text_widget.dart';
import 'package:ygyr/ui/camera_view.dart';
import 'package:ygyr/ui/home_view.dart';
import 'package:ygyr/ui/notification_view.dart';
import 'package:ygyr/ui/warehouse_view.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    CameraView(),
    WarehouseView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        shadowColor: Colors.grey[50],
        title: BaseHeadingTextWidget(
          text: _getCurrentPage(),
        ),
        automaticallyImplyLeading: false,
        actions: [
          BaseIconButtonWidget(
            icon: Icons.notifications,
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const NotificationView(),
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera,
            ),
            label: 'Capture',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warehouse),
            label: 'Browse',
            backgroundColor: Colors.white,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String _getCurrentPage() {
    switch (_selectedIndex) {
      case 0:
        return "Home";
      case 1:
        return "Capture";
      case 2:
        return "Warehouse";
      default:
        return "Home";
    }
  }
}

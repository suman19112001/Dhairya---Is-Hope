import 'package:dhairya/views/home%20screen/screens/home_scrren.dart';
import 'package:dhairya/views/rewards/rewards_screen.dart';
import 'package:dhairya/views/tracking/tracking_screen.dart';
import 'package:dhairya/views/user_profile/user_profile.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';
import '../../health/screen/health_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  List<Widget> screens = const [
    HomeScreen(),
    HealthScrenn(),
    TrackingScreen(),
    RewardScreen(),
    UserProfile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          IndexedStack(
            index: currentIndex,
            children: screens,
          ),
          Align(alignment: Alignment.bottomCenter, child: _buildBottomBar())
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BottomNavigationBar(
            elevation: 20,
            currentIndex: currentIndex,
            backgroundColor: AppColors.green,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            iconSize: 24,
            type: BottomNavigationBarType.fixed,
            selectedIconTheme: const IconThemeData(color: AppColors.snowWhite),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.healing_rounded),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.trending_up_rounded),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.monetization_on_rounded),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '',
              ),
            ],
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}

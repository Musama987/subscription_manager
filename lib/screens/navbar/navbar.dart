import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/app_colors.dart';
import 'home/home.dart';
import 'calender/calender.dart';
import 'analytics/analytics.dart';
import 'setting/setting.dart';
import 'home/widgets/add_subscription.dart';

class PersistentNavbar extends StatefulWidget {
  const PersistentNavbar({Key? key}) : super(key: key);

  @override
  State<PersistentNavbar> createState() => _PersistentNavbarState();
}

class _PersistentNavbarState extends State<PersistentNavbar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const CalendarScreen(),
    const AnalyticsScreen(),
    const SettingScreen(),
  ];

  Widget _buildNavItem(int index, String iconPath, String label) {
    bool isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            colorFilter: ColorFilter.mode(
              isSelected ? AppColors.primaryCyan : Colors.white54,
              BlendMode.srcIn,
            ),
            width: 24,
            height: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? AppColors.primaryCyan : Colors.white54,
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      // IndexedStack preserves the state of all screens so they don't reload when switching tabs.
      body: IndexedStack(index: _currentIndex, children: _screens),
      floatingActionButton: Container(
        height: 64,
        width: 64,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: AppColors.plusButtonGradient,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF0FA6E5).withOpacity(0.3),
              blurRadius: 16,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0,
          shape: const CircleBorder(),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddSubscriptionScreen(),
              ),
            );
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomAppBar(
          color: const Color(
            0xFF131824,
          ), // Match the dark navbar background from design
          shape: const CircularNotchedRectangle(),
          notchMargin: 10.0,
          elevation: 0,
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(0, 'assets/icons/home.svg', "Home"),
                _buildNavItem(1, 'assets/icons/calender.svg', "Calendar"),
                const SizedBox(width: 48), // Space for floating button
                _buildNavItem(2, 'assets/icons/analytics.svg', "Analytics"),
                _buildNavItem(3, 'assets/icons/setting.svg', "Settings"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

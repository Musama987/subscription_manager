import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import 'home/home.dart';

class PersistentNavbar extends StatefulWidget {
  const PersistentNavbar({Key? key}) : super(key: key);

  @override
  State<PersistentNavbar> createState() => _PersistentNavbarState();
}

class _PersistentNavbarState extends State<PersistentNavbar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const Scaffold(body: Center(child: Text('Calendar Screen', style: TextStyle(color: Colors.white)))),
    const Scaffold(body: Center(child: Text('Analytics Screen', style: TextStyle(color: Colors.white)))),
    const Scaffold(body: Center(child: Text('Settings Screen', style: TextStyle(color: Colors.white)))),
  ];

  Widget _buildNavItem(int index, IconData icon, String label) {
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
          Icon(
            icon,
            color: isSelected ? AppColors.primaryCyan : Colors.white54,
            size: 24,
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
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      floatingActionButton: Container(
        height: 64,
        width: 64,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryCyan.withOpacity(0.3),
              blurRadius: 16,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: FloatingActionButton(
          backgroundColor: AppColors.primaryCyan,
          elevation: 0,
          shape: const CircleBorder(),
          onPressed: () {
            // TODO: Add new subscription action
          },
          child: const Icon(Icons.add, color: AppColors.scaffoldBackground, size: 32),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomAppBar(
          color: const Color(0xFF131824), // Match the dark navbar background from design
          shape: const CircularNotchedRectangle(),
          notchMargin: 10.0,
          elevation: 0,
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(0, Icons.home_filled, "Home"),
                _buildNavItem(1, Icons.calendar_today, "Calendar"),
                const SizedBox(width: 48), // Space for floating button
                _buildNavItem(2, Icons.analytics_outlined, "Analytics"),
                _buildNavItem(3, Icons.settings_outlined, "Settings"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

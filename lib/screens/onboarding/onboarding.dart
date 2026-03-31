import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/app_colors.dart';
import '../auth/login/login.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  final List<Map<String, dynamic>> _pages = [
    {
      "iconWidget": const Icon(
        Icons.workspace_premium,
        size: 100,
        color: Color(0xFFFFD54F),
      ),
      "title": "Take Control of your\nSubscriptions",
      "subtitle": "Easily track, manage, renew or cancel\nsubscriptions before they expire."
    },
    {
      "iconWidget": const Icon(
        Icons.location_on,
        size: 100,
        color: Color(0xFFFFD54F),
      ),
      "title": "All Subscriptions in\nOne Place",
      "subtitle": "Add Netflix, Spotify, Gym memberships, SaaS tools\nand more."
    },
    {
      "iconWidget": const Icon(
        Icons.notifications_active,
        size: 100,
        color: Color(0xFFFFD54F),
      ),
      "title": "Never Miss a Renewal",
      "subtitle": "Get reminders before subscriptions renew so\nyou avoid unwanted charges."
    },
    {
      "iconWidget": Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              color: Color(0xFFFFD54F),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(Icons.currency_pound, color: AppColors.scaffoldBackground, size: 50),
            ),
          ),
          const Positioned(
            bottom: -10,
            right: -25,
            child: Icon(Icons.trending_up, color: Color(0xFFFFD54F), size: 60),
          )
        ],
      ),
      "title": "See Where Your Money\nGoes",
      "subtitle": "Understand your monthly and yearly\nspending with smart analytics."
    },
  ];

  void _finishOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenOnboarding', true);
    
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  void _nextPage() {
    if (_currentPageIndex < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _finishOnboarding();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: _currentPageIndex > 0
            ? IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              )
            : const SizedBox.shrink(),
        actions: [
          TextButton(
            onPressed: _finishOnboarding,
            child: Text(
              "Skip",
              style: TextStyle(
                color: AppColors.primaryCyan.withOpacity(0.7),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPageIndex = index;
                  });
                },
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return _buildPageContent(_pages[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: _pages.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: AppColors.primaryCyan,
                  dotColor: AppColors.primaryCyan.withOpacity(0.3),
                  dotHeight: 8,
                  dotWidth: 8,
                  expansionFactor: 3,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0).copyWith(bottom: 32.0),
              child: InkWell(
                onTap: _nextPage,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  decoration: BoxDecoration(
                    gradient: AppColors.plusButtonGradient,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF0FA6E5).withOpacity(0.3),
                        blurRadius: 20,
                        spreadRadius: 2,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      _currentPageIndex == _pages.length - 1 ? "Get Started" : "Next",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageContent(Map<String, dynamic> page) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 240,
            height: 240,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.surfaceBackground.withOpacity(0.4),
            ),
            child: Center(
              child: page["iconWidget"] as Widget,
            ),
          ),
          const SizedBox(height: 56),
          Text(
            page["title"] as String,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 26,
              fontWeight: FontWeight.w700,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            page["subtitle"] as String,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 15,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

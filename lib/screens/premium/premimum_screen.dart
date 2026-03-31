import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({Key? key}) : super(key: key);

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  bool _isYearlySelected = true;

  Widget _buildPricingCard({
    required String title,
    required String price,
    required String subtitle,
    required bool isSelected,
    String? badgeText,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10), // Space for badge
              padding: EdgeInsets.all(
                isSelected ? 2 : 1,
              ), // Gradient border width
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: isSelected
                    ? const LinearGradient(
                        colors: [Color(0xFFFF9966), Color(0xFFFF5E62)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : null,
                color: isSelected ? null : Colors.white.withOpacity(0.05),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      price,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (badgeText != null)
              Positioned(
                top: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFF9966), Color(0xFFFF5E62)],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    badgeText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(
                0xFF1CB57B,
              ).withOpacity(0.1), // Subtle cyan tint
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: const Color(0xFF1CB57B), size: 22),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          const Icon(Icons.check, color: Color(0xFF1CB57B), size: 20),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 24),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Premium",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        titleSpacing: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 12,
            bottom: 20,
          ),
          child: Column(
            children: [
              // Glowing Crown Icon
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF9966), Color(0xFFFF5E62)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFFF5E62).withOpacity(0.4),
                      blurRadius: 20,
                      spreadRadius: 2,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.workspace_premium_outlined,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              const SizedBox(height: 16),

              // Headings
              const Text(
                "Upgrade to Premium",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Unlock the full power of Sub Tracker",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 20),

              // Pricing Toggle Cards
              Row(
                children: [
                  _buildPricingCard(
                    title: "Monthly",
                    price: "\$4.99",
                    subtitle: "Per Month",
                    isSelected: !_isYearlySelected,
                    onTap: () {
                      setState(() {
                        _isYearlySelected = false;
                      });
                    },
                  ),
                  const SizedBox(width: 16),
                  _buildPricingCard(
                    title: "Yearly",
                    price: "\$2.99",
                    subtitle: "Per Month",
                    badgeText: "Save 40%",
                    isSelected: _isYearlySelected,
                    onTap: () {
                      setState(() {
                        _isYearlySelected = true;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Feature List
              _buildFeatureItem(
                icon: Icons.do_not_disturb_alt,
                title: "Smart Detection",
                subtitle: "Auto-detect subscriptions from bank receipts",
              ),
              _buildFeatureItem(
                icon: Icons.all_inclusive,
                title: "Smart Alerts",
                subtitle: "Advanced reminders at 7, 3 days and same day",
              ),
              _buildFeatureItem(
                icon: Icons.savings_outlined,
                title: "AI Insights",
                subtitle: "AI analyzes and suggests unused services",
              ),
              _buildFeatureItem(
                icon: Icons.stacked_line_chart,
                title: "Shared Tracker",
                subtitle: "Track family or team subscriptions",
              ),
              _buildFeatureItem(
                icon: Icons.inventory_2_outlined,
                title: "Price Alerts",
                subtitle: "Detect when subscription prices increase",
              ),
              _buildFeatureItem(
                icon: Icons.rocket_launch_outlined,
                title: "Budget Limits",
                subtitle: "Set monthly spending limits",
              ),
              // Using favorite boundaries as requested by the original screenshot
              _buildFeatureItem(
                icon: Icons.favorite_border,
                title: "Multi-Device",
                subtitle: "Sync across all your devices",
              ),
              _buildFeatureItem(
                icon: Icons.favorite_border,
                title: "Export Reports",
                subtitle: "Download reports in PDF or Excel",
              ),
              _buildFeatureItem(
                icon: Icons.favorite_border,
                title: "Cancel Guide",
                subtitle: "Step-by-step cancellation instructions",
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 8,
            bottom: 12,
          ),
          child: SizedBox(
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryCyan,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
              onPressed: () {},
              child: const Text(
                "Upgrade to Premium",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

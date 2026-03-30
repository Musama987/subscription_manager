import 'package:flutter/material.dart';
import '../../../../utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Widget _buildSubscriptionItem({
    required String name,
    required String price,
    required String cycle,
    required String renews,
    required IconData iconData,
    required Color iconColor,
    bool renewsAlert = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceBackground.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: Icon(iconData, color: iconColor, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  renews,
                  style: TextStyle(
                    color: renewsAlert ? Colors.orange : Colors.white54,
                    fontSize: 12,
                    fontWeight: renewsAlert ? FontWeight.w500 : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                cycle,
                style: const TextStyle(color: Colors.white54, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Good Morning 👋",
                        style: TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Hello, Amir",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.surfaceBackground.withOpacity(0.5),
                    ),
                    child: Stack(
                      children: [
                        const Icon(
                          Icons.notifications_outlined,
                          color: Colors.white,
                          size: 24,
                        ),
                        Positioned(
                          right: 2,
                          top: 2,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Total Monthly Spend Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF814DF2), Color(0xFF6B3CE1)], // Purple gradient
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Monthly Spend",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "\$ 133.95",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6.0, left: 4.0),
                          child: Text(
                            "/ month",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.trending_up, color: Colors.white, size: 14),
                              SizedBox(width: 4),
                              Text(
                                "\$ 179.52/year",
                                style: TextStyle(color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            "8 Active",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Active Subscriptions Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Active Subscriptions",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: const [
                      Text(
                        "See All",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_forward, color: Colors.blue, size: 16),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // List Items (Hardcoded matching the image for now)
              _buildSubscriptionItem(
                name: "Spotify",
                price: "\$ 9.99",
                cycle: "Monthly",
                renews: "Renews in 2 days",
                iconData: Icons.music_note,
                iconColor: Colors.green,
                renewsAlert: true,
              ),
              _buildSubscriptionItem(
                name: "Netflix",
                price: "\$ 15.99",
                cycle: "Monthly",
                renews: "Renews in 8 days",
                iconData: Icons.movie_outlined,
                iconColor: Colors.deepPurple,
              ),
              _buildSubscriptionItem(
                name: "iCloud+",
                price: "\$ 2.99",
                cycle: "Monthly",
                renews: "Renews in 15 days",
                iconData: Icons.cloud,
                iconColor: Colors.blue,
              ),
              _buildSubscriptionItem(
                name: "Gym Membership",
                price: "\$ 49.99",
                cycle: "Monthly",
                renews: "Renews in 22 days",
                iconData: Icons.fitness_center,
                iconColor: Colors.orange,
              ),
              _buildSubscriptionItem(
                name: "ChatGPT Plus",
                price: "\$ 54.99",
                cycle: "Monthly",
                renews: "Renews in 5 days",
                iconData: Icons.smart_toy,
                iconColor: Colors.teal,
              ),
              _buildSubscriptionItem(
                name: "YouTube Premium",
                price: "\$ 13.99",
                cycle: "Monthly",
                renews: "Renews in 26 days",
                iconData: Icons.play_arrow,
                iconColor: Colors.red,
              ),
              _buildSubscriptionItem(
                name: "Amazon Prime",
                price: "\$ 140.99",
                cycle: "Yearly",
                renews: "Renews in 97 days",
                iconData: Icons.shopping_cart,
                iconColor: Colors.blueAccent,
              ),
              
              const SizedBox(height: 60), // Extra padding for the bottom nav bar overlap
            ],
          ),
        ),
      ),
    );
  }
}

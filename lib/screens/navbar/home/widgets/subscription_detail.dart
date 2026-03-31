import 'package:flutter/material.dart';
import '../../../../utils/app_colors.dart';

class SubscriptionDetailScreen extends StatelessWidget {
  final String name;
  final String price;
  final String cycle;
  final String renews;
  final IconData iconData;
  final Color iconColor;
  final bool renewsAlert;

  const SubscriptionDetailScreen({
    Key? key,
    required this.name,
    required this.price,
    required this.cycle,
    required this.renews,
    required this.iconData,
    required this.iconColor,
    this.renewsAlert = false,
  }) : super(key: key);

  Widget _buildDetailRow(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: valueColor ?? Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.white.withOpacity(0.05),
      height: 1,
      thickness: 1,
    );
  }

  Widget _buildActionButton(String label, IconData icon, Color color) {
    return Container(
      width: 76,
      height: 86,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Keep only numbers to extract days e.g. "Renews in 2 days" -> "2 days"
    String daysLeft = renews.replaceAll("Renews in ", "");

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
          "Subscription Details",
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
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              // App Icon
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: iconColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(iconData, color: Colors.white, size: 36),
                ),
              ),
              const SizedBox(height: 16),
              // App Name
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              // Active Status
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Active",
                  style: TextStyle(
                    color: Color(
                      0xFF4CAF50,
                    ), // Standard material green for better visibility
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Details Card
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.white.withOpacity(0.05)),
                ),
                child: Column(
                  children: [
                    _buildDetailRow("Price", price),
                    _buildDivider(),
                    _buildDetailRow("Billing Cycle", cycle),
                    _buildDivider(),
                    _buildDetailRow(
                      "Next Renewal",
                      "2026-03-12",
                    ), // Static matching screenshot
                    _buildDivider(),
                    _buildDetailRow(
                      "Days Until Renewal",
                      daysLeft,
                      valueColor: AppColors.primaryCyan,
                    ),
                    _buildDivider(),
                    _buildDetailRow(
                      "Category",
                      "Music",
                    ), // Default music matching screenshot
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Action Buttons Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildActionButton(
                    "Edit",
                    Icons.edit_square,
                    AppColors.primaryCyan,
                  ),
                  _buildActionButton("Pause", Icons.pause, Colors.orange),
                  _buildActionButton(
                    "Cancel",
                    Icons.cancel_outlined,
                    Colors.redAccent,
                  ),
                  _buildActionButton(
                    "Delete",
                    Icons.delete_outline,
                    Colors.red,
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../utils/app_colors.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  Widget _buildMonthHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withOpacity(0.05)),
              color: AppColors.cardBackground,
            ),
            child: const Icon(
              Icons.chevron_left,
              color: Colors.white,
              size: 20,
            ),
          ),
          const Text(
            "March 2026",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withOpacity(0.05)),
              color: AppColors.cardBackground,
            ),
            child: const Icon(
              Icons.chevron_right,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeekdays() {
    const days = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: days
            .map(
              (day) => SizedBox(
                width: 32,
                child: Center(
                  child: Text(
                    day,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildCalendarGrid() {
    // Simulated simple 31 days logic
    int highlightedDay = 9;
    List<int> paymentDays = [11, 14, 17, 19, 21, 24, 28, 31];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 31, // March has 31 days
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          mainAxisSpacing: 6,
          crossAxisSpacing: 6,
          childAspectRatio: 1.1, // Adjusted to be more vertically compact
        ),
        itemBuilder: (context, index) {
          int day = index + 1;
          bool isHighlighted = day == highlightedDay;
          bool hasPayment = paymentDays.contains(day);

          return Container(
            decoration: BoxDecoration(
              color: isHighlighted
                  ? const Color(0xFF1E3C3E)
                  : Colors.transparent, // Teal shadow backing
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  day.toString(),
                  style: TextStyle(
                    color: isHighlighted ? Colors.white : Colors.white70,
                    fontWeight: isHighlighted
                        ? FontWeight.bold
                        : FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                if (hasPayment)
                  Container(
                    margin: const EdgeInsets.only(top: 2),
                    width: 4,
                    height: 4,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryCyan,
                      shape: BoxShape.circle,
                    ),
                  )
                else
                  const SizedBox(height: 6), // Match spacing of the dot
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPaymentItem({
    required IconData iconData,
    required Color iconColor,
    required String name,
    required String date,
    required String price,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surfaceBackground.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              shape: BoxShape.circle,
            ),
            child: Icon(iconData, color: iconColor, size: 22),
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
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  date,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            price,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 16,
            bottom: 80,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Calendar",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              // Calendar View
              _buildMonthHeader(),
              _buildWeekdays(),
              _buildCalendarGrid(),

              const SizedBox(height: 20),

              const Text(
                "Upcoming Payments",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              // Upcoming Payments List
              _buildPaymentItem(
                name: "Spotify",
                date: "March 11",
                price: "\$9.99",
                iconData: Icons.music_note,
                iconColor: Colors.green,
              ),
              _buildPaymentItem(
                name: "ChatGPT Plus",
                date: "March 14",
                price: "\$20.99",
                iconData: Icons.smart_toy,
                iconColor: Colors.teal,
              ),
              _buildPaymentItem(
                name: "Netflix",
                date: "March 17",
                price: "\$15.99",
                iconData: Icons.movie_outlined,
                iconColor: Colors.deepPurple,
              ),
              _buildPaymentItem(
                name: "YouTube Premium",
                date: "March 19",
                price: "\$13.99",
                iconData: Icons.play_arrow,
                iconColor: Colors.red,
              ),
              _buildPaymentItem(
                name: "Adobe CC",
                date: "March 21",
                price: "\$54.99",
                iconData: Icons.color_lens_outlined,
                iconColor: Colors.orange,
              ),
              _buildPaymentItem(
                name: "iCloud+",
                date: "March 24",
                price: "\$2.99",
                iconData: Icons.cloud,
                iconColor: Colors.blue,
              ),
              _buildPaymentItem(
                name: "Gym Pro",
                date: "March 31",
                price: "\$29.99",
                iconData: Icons.fitness_center,
                iconColor: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

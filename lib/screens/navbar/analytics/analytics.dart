import 'package:flutter/material.dart';
import '../../../../utils/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  Widget _buildSummaryCard(String title, String amount, {Color? amountColor}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.05)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 13,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            Text(
              amount,
              style: TextStyle(
                color: amountColor ?? Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInsightCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(
          0xFF163436,
        ), // Dark greenish teal background matching reference
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.scaffoldBackground.withOpacity(0.8),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.show_chart,
              color: AppColors.primaryCyan,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Spending Insight",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "You spend \$2154 on 8 subscription yearly. Software is your biggest category.",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpendingGraph() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Spending graph",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 180, // Keeping it vertically compact
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceEvenly,
                maxY: 200,
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 22,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        const style = TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 10,
                        );
                        final months = [
                          'Jan',
                          'Feb',
                          'Mar',
                          'Apr',
                          'May',
                          'Jun',
                          'Jul',
                          'Aug',
                          'Sep',
                          'Oct',
                          'Nov',
                          'Dec',
                        ];
                        if (value >= 0 && value < 12) {
                          return SideTitleWidget(
                            meta: meta,
                            child: Text(months[value.toInt()], style: style),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      interval: 50,
                      getTitlesWidget: (value, meta) {
                        if (value == 0 ||
                            value == 50 ||
                            value == 100 ||
                            value == 150 ||
                            value == 200) {
                          return SideTitleWidget(
                            meta: meta,
                            child: Text(
                              '\$${value.toInt()}',
                              style: const TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                gridData: FlGridData(show: false),
                borderData: FlBorderData(show: false),
                barGroups: List.generate(12, (index) {
                  double amount = 0;
                  if (index == 0) amount = 205; // Jan
                  if (index == 1) amount = 175; // Feb
                  if (index == 2) amount = 160; // Mar
                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: amount,
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF6B3CE1),
                            Color(0xFF814DF2),
                          ], // Purple/blue
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                        width: 14,
                        borderRadius: BorderRadius.circular(
                          2,
                        ), // Very slightly rounded tops
                        backDrawRodData: BackgroundBarChartRodData(
                          show: true,
                          toY: 200,
                          color:
                              Colors.transparent, // Keeps the spacing correct
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildByCategory() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "By Category",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              SizedBox(
                height: 120, // Vertically compact pie chart
                width: 120,
                child: PieChart(
                  PieChartData(
                    sectionsSpace: 4,
                    centerSpaceRadius: 32, // Creates doughnut shape
                    startDegreeOffset: -90,
                    sections: [
                      PieChartSectionData(
                        value: 45,
                        color: const Color(0xFF6B3CE1), // Software
                        title: '',
                        radius: 24,
                      ),
                      PieChartSectionData(
                        value: 30,
                        color: Colors.pinkAccent, // Entertainment
                        title: '',
                        radius: 24,
                      ),
                      PieChartSectionData(
                        value: 25,
                        color: Colors.orange, // Health
                        title: '',
                        radius: 24,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildLegendRow(
                      const Color(0xFF6B3CE1),
                      "Software",
                      "\$77.98/mo",
                    ),
                    const SizedBox(height: 14),
                    _buildLegendRow(
                      Colors.pinkAccent,
                      "Entertainment",
                      "\$51.55/mo",
                    ),
                    const SizedBox(height: 14),
                    _buildLegendRow(Colors.orange, "Health", "\$49.99/mo"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLegendRow(Color color, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
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
          onPressed: () => Navigator.maybePop(context),
        ),
        title: const Text(
          "Analytics",
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
            top: 4,
            bottom: 80,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _buildSummaryCard("Subscribed", "\$ 134"),
                  const SizedBox(width: 16),
                  _buildSummaryCard(
                    "Upcoming subscriptions",
                    "\$ 1607",
                    amountColor: AppColors.primaryCyan,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildInsightCard(),
              const SizedBox(height: 20),
              _buildSpendingGraph(),
              const SizedBox(height: 20),
              _buildByCategory(),
            ],
          ),
        ),
      ),
    );
  }
}

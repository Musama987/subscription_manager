import 'package:flutter/material.dart';
import '../../../../../utils/app_colors.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({Key? key}) : super(key: key);

  Widget _buildHeaderCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      decoration: BoxDecoration(
        color: const Color(0xFF163436), // Matches screenshot dark green card
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.scaffoldBackground.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.help_outline, color: AppColors.textSecondary, size: 24),
          ),
          const SizedBox(height: 16),
          const Text(
            "How can we help?",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Find answers to common questions below",
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 24),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Help Center",
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
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              _buildHeaderCard(),
              const SizedBox(height: 24),
              const FAQItem(
                question: "How are renewal reminders calculated?",
                answer: "The app checks your next billing date and shows alerts in the Notifications tab when a renewal is 7, 3, or 1 day away.",
                initiallyExpanded: true,
              ),
              const FAQItem(
                question: "Can I pause a subscription?",
                answer: "Yes, you can pause a subscription from the subscription details screen. Paused subscriptions will not affect your monthly total or trigger renewal reminders until unpaused.",
              ),
              const FAQItem(
                question: "How is my monthly total calculated?",
                answer: "The monthly total takes all your active subscriptions and normalizes them into a 30-day billing cycle so you know exactly what is coming out of your pocket every month.",
              ),
              const FAQItem(
                question: "Can I change the currency?",
                answer: "Yes, you can change your default currency from the Settings screen under the Profile section. This will convert your existing records.",
              ),
              const FAQItem(
                question: "How do I delete a subscription?",
                answer: "To delete a subscription, tap on it from the home page to view its details, then tap the red 'Delete' button at the bottom of the screen.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;
  final bool initiallyExpanded;

  const FAQItem({
    Key? key,
    required this.question,
    required this.answer,
    this.initiallyExpanded = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Theme(
        // Remove the default ExpansionTile dividers
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: initiallyExpanded,
          iconColor: Colors.white,
          collapsedIconColor: Colors.white,
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          title: Text(
            question,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  answer,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../utils/app_colors.dart';

class AddSubscriptionScreen extends StatefulWidget {
  const AddSubscriptionScreen({Key? key}) : super(key: key);

  @override
  State<AddSubscriptionScreen> createState() => _AddSubscriptionScreenState();
}

class _AddSubscriptionScreenState extends State<AddSubscriptionScreen> {
  String _selectedCycle = "Weekly";
  String _selectedReminder = "2 Day";
  String _selectedCategory = "Music";

  final List<String> _billingCycles = ["Weekly", "Monthly", "Yearly"];
  final List<String> _reminderOptions = [
    "1 Day",
    "2 Day",
    "3 Day",
    "5 Day",
    "7 Day",
    "14 Day",
    "30 Day",
    "Custom",
  ];

  final List<Map<String, dynamic>> _categories = [
    {
      "name": "Entertainment",
      "icon": Icons.movie_creation,
      "color": Colors.redAccent,
    },
    {"name": "Music", "icon": Icons.music_note, "color": Colors.pinkAccent},
    {"name": "Software", "icon": Icons.computer, "color": Colors.blueAccent},
    {
      "name": "Health",
      "icon": Icons.monitor_heart,
      "color": Colors.orangeAccent,
    },
    {"name": "Finance", "icon": Icons.show_chart, "color": Colors.green},
    {"name": "Cloud", "icon": Icons.cloud, "color": Colors.white},
    {"name": "News", "icon": Icons.article, "color": Colors.blue},
    {"name": "Other", "icon": Icons.grid_view, "color": Colors.orange},
  ];

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 16.0),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildTextField(
    String hint, {
    int maxLines = 1,
    IconData? suffixIcon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: TextField(
        maxLines: maxLines,
        style: const TextStyle(color: Colors.white, fontSize: 16),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 16,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: maxLines > 1 ? 12 : 10,
          ),
          suffixIcon: suffixIcon != null
              ? Icon(suffixIcon, color: AppColors.textSecondary)
              : null,
        ),
      ),
    );
  }

  Widget _buildSelectionOptionsRow(
    List<String> options,
    String selected,
    Function(String) onSelect,
  ) {
    return Container(
      height: 44,
      child: Row(
        children: options.map((option) {
          bool isSelected = selected == option;
          return Expanded(
            child: GestureDetector(
              onTap: () => onSelect(option),
              child: Container(
                margin: EdgeInsets.only(
                  right: option != options.last ? 8.0 : 0,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primaryCyan
                      : AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(12),
                  border: isSelected
                      ? null
                      : Border.all(color: Colors.white.withOpacity(0.05)),
                ),
                alignment: Alignment.center,
                child: Text(
                  option,
                  style: TextStyle(
                    color: isSelected
                        ? AppColors.scaffoldBackground
                        : AppColors.textSecondary,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildReminderGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 2.2,
      ),
      itemCount: _reminderOptions.length,
      itemBuilder: (context, index) {
        String option = _reminderOptions[index];
        bool isSelected = _selectedReminder == option;
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedReminder = option;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primaryCyan
                  : AppColors.cardBackground,
              borderRadius: BorderRadius.circular(12),
              border: isSelected
                  ? null
                  : Border.all(color: Colors.white.withOpacity(0.05)),
            ),
            alignment: Alignment.center,
            child: Text(
              option,
              style: TextStyle(
                color: isSelected
                    ? AppColors.scaffoldBackground
                    : AppColors.textSecondary,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                fontSize: 13,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCategoryGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1,
      ),
      itemCount: _categories.length,
      itemBuilder: (context, index) {
        var category = _categories[index];
        bool isSelected = _selectedCategory == category['name'];
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedCategory = category['name'];
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isSelected
                    ? AppColors.primaryCyan
                    : Colors.white.withOpacity(0.05),
                width: isSelected ? 2 : 1,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(category['icon'], color: category['color'], size: 28),
                const SizedBox(height: 6),
                Text(
                  category['name'],
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 10,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        );
      },
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
          "Add Subscription",
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
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabel("Service Name"),
              _buildTextField("e.g. Netflix, Spotify..."),

              _buildLabel("Price"),
              _buildTextField("\$0.00"),

              _buildLabel("Billing Cycle"),
              _buildSelectionOptionsRow(
                _billingCycles,
                _selectedCycle,
                (val) => setState(() => _selectedCycle = val),
              ),

              _buildLabel("Remind Me Before"),
              _buildReminderGrid(),

              _buildLabel("Category"),
              _buildCategoryGrid(),

              _buildLabel("Next Billing Date"),
              _buildTextField(
                "dd/mm/yyyy",
                suffixIcon: Icons.calendar_today_outlined,
              ),

              _buildLabel("Notes (Optional)"),
              _buildTextField(
                "Any notes about this subscription...",
                maxLines: 5,
              ),

              const SizedBox(height: 24),

              Container(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: AppColors.plusButtonGradient,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Save subscription logic here
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Add Subscription",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

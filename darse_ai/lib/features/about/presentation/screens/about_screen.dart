import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_styles.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Darse AI"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🧠 HEADER
            Text(
              "Darse AI",
              style: AppStyles.heading,
            ),

            const SizedBox(height: 10),

            Text(
              "An AI-powered learning assistant for chat, summaries, and intelligent quiz generation.",
              style: AppStyles.body,
            ),

            const SizedBox(height: 30),

            // ⚡ FEATURES SECTION
            Text(
              "Features",
              style: AppStyles.title,
            ),

            const SizedBox(height: 10),

            _featureItem("AI Chat Assistant"),
            _featureItem("Text Summarization Engine"),
            _featureItem("Smart Quiz Generator"),
            _featureItem("Modular AI Architecture"),

            const SizedBox(height: 30),

            // 🔧 VERSION
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Version", style: TextStyle(color: Colors.white70)),
                  Text("1.0.0", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),

            const Spacer(),

            // ⚡ FOOTER
            Center(
              child: Text(
                "Built with Flutter + AI Engine",
                style: AppStyles.muted,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _featureItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: AppColors.primary, size: 18),
          const SizedBox(width: 10),
          Text(text, style: AppStyles.body),
        ],
      ),
    );
  }
}
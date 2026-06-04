import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppStyles {
  // 🧠 Main AI Heading (App Titles / Hero text)
  static const TextStyle heading = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.text,
    letterSpacing: -0.5,
  );

  // ✨ Section Titles (Chat, Summary, Quiz headers)
  static const TextStyle title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
  );

  // 💬 Normal body text (messages, content)
  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.text,
    height: 1.4,
  );

  // 🧊 Secondary / muted text
  static const TextStyle muted = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.mutedText,
  );

  // ⚡ Small labels (buttons, chips, tabs)
  static const TextStyle label = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.mutedText,
  );

  // 🤖 AI message text (slightly softer feel)
  static const TextStyle aiMessage = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    height: 1.5,
  );

  // 👤 User message text
  static const TextStyle userMessage = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.text,
  );
}
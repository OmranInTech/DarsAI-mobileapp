import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_styles.dart';

class SummarizerScreen extends StatefulWidget {
  const SummarizerScreen({super.key});

  @override
  State<SummarizerScreen> createState() => _SummarizerScreenState();
}

class _SummarizerScreenState extends State<SummarizerScreen> {
  final TextEditingController controller = TextEditingController();
  String result = "";
  bool loading = false;

  void generateSummary() async {
    final text = controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      loading = true;
      result = "";
    });

    // fake delay (AI will connect later)
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      result =
          "This is a demo summary. Later we will connect real AI engine to compress your text intelligently.";
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Summarizer"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // 📝 INPUT BOX
            TextField(
              controller: controller,
              maxLines: 6,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Paste your text here...",
                hintStyle: const TextStyle(color: Colors.white38),
                filled: true,
                fillColor: AppColors.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // ⚡ BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: loading ? null : generateSummary,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),
                child: loading
                    ? const CircularProgressIndicator()
                    : const Text("Generate Summary"),
              ),
            ),

            const SizedBox(height: 20),

            // 📄 OUTPUT
            if (result.isNotEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.aiBubble,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.border),
                ),
                child: Text(
                  result,
                  style: AppStyles.body,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
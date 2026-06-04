import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_styles.dart';

class QuizViewScreen extends StatefulWidget {
  const QuizViewScreen({super.key});

  @override
  State<QuizViewScreen> createState() => _QuizViewScreenState();
}

class _QuizViewScreenState extends State<QuizViewScreen> {
  final TextEditingController controller = TextEditingController();

  bool loading = false;

  List<Map<String, dynamic>> quiz = [];

  int currentIndex = 0;
  int score = 0;
  bool finished = false;

  void generateQuiz() async {
    final topic = controller.text.trim();
    if (topic.isEmpty) return;

    setState(() {
      loading = true;
      quiz = [];
      currentIndex = 0;
      score = 0;
      finished = false;
    });

    // fake AI quiz (we connect real AI later)
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      quiz = [
        {
          "question": "What is Flutter?",
          "options": ["Language", "Framework", "Database", "OS"],
          "answer": 1
        },
        {
          "question": "Dart is used for?",
          "options": ["AI only", "Frontend apps", "Databases", "Games only"],
          "answer": 1
        },
        {
          "question": "Widget in Flutter is?",
          "options": ["UI block", "Server", "API", "Database"],
          "answer": 0
        }
      ];

      loading = false;
    });
  }

  void selectAnswer(int index) {
    if (finished) return;

    if (quiz[currentIndex]["answer"] == index) {
      score++;
    }

    if (currentIndex < quiz.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      setState(() {
        finished = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AI Quiz Engine"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // 🧠 INPUT
            TextField(
              controller: controller,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Enter topic (e.g. Flutter, AI, Math)",
                hintStyle: const TextStyle(color: Colors.white38),
                filled: true,
                fillColor: AppColors.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: loading ? null : generateQuiz,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),
                child: loading
                    ? const CircularProgressIndicator()
                    : const Text("Generate Quiz"),
              ),
            ),

            const SizedBox(height: 20),

            // 📊 QUIZ AREA
            if (quiz.isNotEmpty && !finished)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Q${currentIndex + 1}: ${quiz[currentIndex]["question"]}",
                      style: AppStyles.title,
                    ),

                    const SizedBox(height: 20),

                    ...List.generate(
                      quiz[currentIndex]["options"].length,
                      (i) => GestureDetector(
                        onTap: () => selectAnswer(i),
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.aiBubble,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColors.border),
                          ),
                          child: Text(
                            quiz[currentIndex]["options"][i],
                            style: AppStyles.body,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            // 🏁 RESULT
            if (finished)
              Column(
                children: [
                  const SizedBox(height: 30),
                  Text(
                    "Quiz Completed!",
                    style: AppStyles.heading,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Score: $score / ${quiz.length}",
                    style: AppStyles.title,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'core/constants/app_colors.dart';
import 'features/tutor_chat/presentation/screens/tutor_chat_screen.dart';

void main() {
  runApp(const DarseAIApp());
}

class DarseAIApp extends StatelessWidget {
  const DarseAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Darse AI',

      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.background,
        primaryColor: AppColors.primary,
        useMaterial3: true,
      ),

      home: const RootShell(),
    );
  }
}

class RootShell extends StatefulWidget {
  const RootShell({super.key});

  @override
  State<RootShell> createState() => _RootShellState();
}

class _RootShellState extends State<RootShell> {
  int index = 0;

  final List<Widget> pages = const [
    TutorChatScreen(),
    Center(child: Text("Summary AI")),
    Center(child: Text("Quiz AI")),
    Center(child: Text("About Darse AI")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: pages[index],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),

        backgroundColor: const Color(0xFF0E0E10),
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.white54,

        type: BottomNavigationBarType.fixed,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.summarize),
            label: "Summary",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: "Quiz",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: "About",
          ),
        ],
      ),
    );
  }
}
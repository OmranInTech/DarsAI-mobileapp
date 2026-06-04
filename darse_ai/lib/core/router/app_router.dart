import 'package:flutter/material.dart';

// Screens (we will build real ones later)
import '../../features/tutor_chat/presentation/screens/tutor_chat_screen.dart';

class AppRouter {
  static const String chat = '/';
  static const String summary = '/summary';
  static const String quiz = '/quiz';
  static const String about = '/about';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case chat:
        return MaterialPageRoute(
          builder: (_) => const TutorChatScreen(),
        );

      case summary:
        return MaterialPageRoute(
          builder: (_) => const PlaceholderScreen(title: "Summary AI"),
        );

      case quiz:
        return MaterialPageRoute(
          builder: (_) => const PlaceholderScreen(title: "Quiz AI"),
        );

      case about:
        return MaterialPageRoute(
          builder: (_) => const PlaceholderScreen(title: "About Darse AI"),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("Route not found"),
            ),
          ),
        );
    }
  }
}

class PlaceholderScreen extends StatelessWidget {
  final String title;

  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
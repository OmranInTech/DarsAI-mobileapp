# 🧠 Darse AI – Flutter AI Learning Assistant

Darse AI is a **modular AI-powered mobile learning assistant** built with Flutter and designed to provide intelligent chat, summarization, and quiz generation capabilities using local or cloud AI models (Ollama / OpenAI).

---

## 🚀 Features

### 💬 AI Chat Assistant
- Conversational AI interface
- Context-aware messaging system
- Ready for Ollama / OpenAI integration

### 🧠 Text Summarization
- Paste long text and generate concise summaries
- Adjustable AI depth control (future upgrade)
- Clean UI for document ingestion

### 🎓 Smart Quiz Generator
- AI-generated multiple choice questions
- Score tracking system
- Interactive learning experience

### ℹ️ About System
- App information
- Feature overview
- Version tracking

---

## 🏗 Project Architecture
```text
lib/
├── main.dart
├── core/
│   ├── network/
│   │   └── ai_api_client.dart
│   ├── constants/
│   │   ├── app_colors.dart
│   │   └── app_styles.dart
│   └── services/
│       └── ai_service.dart
│
└── features/
    ├── tutor_chat/
    │   └── presentation/
    │       └── screens/
    │           └── tutor_chat_screen.dart
    │
    ├── text_synthesis/
    │   └── presentation/
    │       └── screens/
    │           └── summarizer_screen.dart
    │
    ├── smart_assessment/
    │   └── presentation/
    │       └── screens/
    │           └── quiz_view_screen.dart
    │
    └── about/
        └── presentation/
            └── screens/
                └── about_screen.dart
```
---

## ⚙️ Tech Stack

- Flutter (UI Framework)
- Dart (Programming Language)
- Ollama (Local AI Engine)
- HTTP API (AI communication layer)
- LLM Models (qwen3 / llama3 / mistral)

---

## 🤖 AI Backend Options

### Local AI (Recommended)
ollama run qwen3:1.7b

Base API:
http://localhost:11434/api

### Cloud AI (Production)
OpenAI GPT API

---

## 📦 Installation

-[git clone https://github.com/yourusername/darse_ai.git](https://github.com/OmranInTech/DarsAI-mobileapp.git)
-cd darse_ai
-flutter pub get
-flutter run

---

## 🔮 Future Improvements

- Streaming AI responses
- Chat memory system
- Premium UI animations
- PDF summarization
- Cloud sync
- Adaptive learning engine

---

## 👨‍💻 Developer
Built with Flutter + AI

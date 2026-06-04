# Dars AI — Intelligent Study Copilot

A high-performance, cross-platform mobile application built with Flutter to accelerate student comprehension and retention. **Dars AI** interfaces with large language models to provide low-latency chat assistance, context-aware document summarization, and automated interactive quiz generation.

## 🛠️ Technical Stack Specifications

*   **Runtime Framework:** Flutter SDK `^3.x` / Dart SDK `^3.x`
*   **Operating System Dev Environment:** Fedora Linux (Workstation Edition)
*   **Target Architectures:** Native Android (API 21+) & iOS (13.0+)
*   **Design Framework:** Deep Focus Dark System (Dominant Dark Carbon background with Electric Neon Emerald accent indicators)
*   **State Architecture:** Stateful UI Lifecycle Controllers decoupled from underlying network streams

---

## 📐 Architecture Design Matrix

The codebase utilizes a **Feature-First Layered Architecture**. By grouping modules by business utility (Chat, Synthesis, Assessment), features remain self-contained, highly scalable, and easy to modify without causing system-wide regressions.

[ FRONTEND VIEWPORTS ]
       (Tutor Chat, Summarizer, Quiz Engine)
                        │
                        ▼
          [ PRESENTATION LAYER (UI) ]
   Auto-scrolling views, Form Fields, Flip Gestures
                        │
   Dispatches Payloads  │  Injects Validated State
   (Text Buffers/Keys)  │  (AI Responses, Question Arrays)
                        ▼
         [ CORE INFRASTRUCTURE LAYER ]
   Secure API Clients ──► Network Network Protocols (HTTP/REST)

   *   **Presentation Layer:** Receptive user interfaces optimized for text readability and high responsiveness during complex streaming state changes.
*   **Core Infrastructure Layer:** Handles backend network protocols, authentication tokens, automated error recovery, and timeout parameters.

---

## 🗂️ Production File Directory Topology

```text
lib/
├── main.dart                           # App initialization, routing, and global theme setups
├── core/                               # App-wide global cross-cutting assets
│   ├── network/
│   │   └── ai_api_client.dart          # Low-level REST/HTTP networking engine with timeout policies
│   └── constants/
│       ├── app_colors.dart             # Deep Focus Design System (Carbon `#121214` / Neon Emerald `#00E676`)
│       └── app_styles.dart             # Clean typography rules matching heavy text layouts
│
└── features/                           # Independent runtime functional sectors
    ├── tutor_chat/                     # Feature A: Continuous Context AI Tutor
    │   └── presentation/
    │       ├── screens/
    │       │   └── tutor_chat_screen.dart # Conversational UI view with automated scrolling hooks
    │       └── widgets/
    │           └── typing_indicator.dart # Active AI inference thinking animation bubble
    │
    ├── text_synthesis/                 # Feature B: Data Compression & Ingestion Hub
    │   └── presentation/
    │       ├── screens/
    │       │   └── summarizer_screen.dart # Ingestion workspace and dynamic layout console
    │       └── widgets/
    │           └── density_slider.dart # Controls summary depth thresholds (Short vs Deep)
    │
    └── smart_assessment/               # Feature C: AI-Generated Interactive Testing
        ├── domain/
        │   └── quiz_model.dart         # Enforces strict data structures for Question / Options validation
        └── presentation/
            ├── screens/
            │   └── quiz_view_screen.dart # Active multiple-choice evaluation dashboard
            └── widgets/
                └── flashcard_widget.dart # 3D Flip Card animation handling spatial gestures

                
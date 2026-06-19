# Rick and Morty Explorer 🛸

A Flutter app for browsing characters from the Rick and Morty universe, built with a clean, layered architecture and the BLoC/Cubit pattern for state management.

## ✨ Features

- 🧪 Browse all Rick and Morty characters in a responsive grid view
- 🖼️ Smooth network image loading with progress indicators and graceful error handling (broken/missing images won't crash the UI)
- 🏗️ Clean separation of concerns: **API layer → Repository → Cubit → UI**
- 🔄 Type-safe state management using `flutter_bloc` Cubit with Dart 3 sealed classes
- 🧭 Centralized named-route navigation via `AppRouter`

## 🚧 Coming Soon

- 🔍 Search characters by name
- ✨ Animated text effects for character names and details
- 📴 Offline support — local caching so the app keeps working without an internet connection

## 🛠️ Tech Stack

- **Flutter** & **Dart**
- **flutter_bloc** (Cubit) for state management
- **Dio** for HTTP networking
- [Rick and Morty API](https://rickandmortyapi.com/) as the data source

## 🏗️ Architecture

```
lib/
├── business_logic/
│   └── cubit/
│       ├── characters_cubit.dart
│       └── characters_state.dart
├── constants/
│   ├── my_colors.dart
│   └── strings.dart
├── data/
│   ├── api/
│   │   └── characters_api.dart
│   ├── models/
│   │   └── character.dart
│   └── repository/
│       └── characters_repository.dart
├── presentation/
│   ├── screens/
│   │   ├── characters_screen.dart
│   │   └── characters_details.dart
│   └── widgets/
│       └── cahracter_item.dart
├── app_router.dart
└── main.dart
```

**Data flow:**
`CharactersApi` (Dio HTTP calls) → `CharactersRepository` (JSON → `Character` model mapping) → `CharactersCubit` (state management) → UI (`CharactersScreen`, `CahracterItem`)

## 🚀 Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed
- An editor such as VS Code or Android Studio

### Installation
```bash
git clone https://github.com/moalaa125/rickandmorty.git
cd rickandmorty
flutter pub get
flutter run
```

## 🌐 API Reference

This app consumes the free, public [Rick and Morty API](https://rickandmortyapi.com/documentation):

```
GET https://rickandmortyapi.com/api/character
```

No API key required.

## 🗺️ Roadmap

- [ ] Search bar with live filtering of characters by name
- [ ] Animated text widgets for character names/status on detail screen
- [ ] Offline-first caching (e.g. Hive/SharedPreferences or local DB) with a fallback UI when there's no connection
- [ ] Complete the `CharactersDetails` screen (currently a placeholder)

## 👤 Author

**Mohamed Alaa**
- GitHub: [@moalaa125](https://github.com/moalaa125)
- LinkedIn: [Mohamed Alaa](https://linkedin.com/in/mohamed-alaa-839738308)
- Portfolio: [moalaa1.netlify.app](https://moalaa1.netlify.app)

## 📄 License

This project was built for educational/portfolio purposes.
# AntApp — Antalya Tourist Transfers

A premium tourist transportation booking platform for the Turkish Riviera.

## Quick Start

```bash
# 1. Install Flutter SDK: https://docs.flutter.dev/get-started/install/windows/mobile
# 2. Ensure flutter is on your PATH, then:

flutter pub get
flutter run -d chrome      # Web
flutter run -d windows     # Desktop
flutter run                # Connected device / emulator
```

## Project Structure

```
lib/
├── main.dart                              # App entry point
├── theme/
│   └── app_theme.dart                     # Sunset color palette & theme
├── screens/
│   ├── booking_screen.dart                # Main booking form
│   └── vehicle_selection_screen.dart      # Vehicle picker list
└── widgets/
    └── ai_concierge_widget.dart           # AI chat FAB + bottom sheet
```

## Design Notes

- **Color palette**: Warm sunset oranges, golden yellows, twilight blues
- **All data is hardcoded** — no state management, no API calls
- **Navigation**: BookingScreen → VehicleSelectionScreen (slide transition)
- **AI Concierge**: Floating action button opens a mock chat bottom sheet

# pay_taps

# 💱 Currency Converter App

A cross-platform **Flutter app** that converts currencies and shows historical exchange rates using the [Fixer API](https://fixer.io). Built with Clean Architecture and BLoC state management.

---

## 📱 Features

- 🔁 Convert any currency to another using live exchange rates.
- 📊 View historical conversion data for the last 4 days.
- 💡 Modern UI with error handling and loading indicators.
- 🧱 Clean Architecture (Domain ➜ Data ➜ Presentation).
- 📦 BLoC for business logic separation.
- 🌐 Supports mobile and web.

---

## 🔧 Tech Stack

| Layer           | Tools Used                         |
|----------------|-------------------------------------|
| **Architecture** | Clean Architecture, SOLID          |
| **State Mgmt**  | flutter_bloc                        |
| **Networking**  | Dio, Fixer API                      |
| **UI**          | Flutter Material Design             |
| **Data Format** | JSON, Fixer API response parsing    |

---

## 📂 Folder Structure

lib/
├── data/
│ ├── datasources/
│ ├── models/
│ └── repositories/
├── domain/
│ ├── entities/
│ ├── repositories/
│ └── usecases/
├── presentation/
│ ├── bloc/
│ ├── screens/

│ └── widgets/
└── main.dart
screens
![Simulator Screenshot - iPhone 15 - 2025-05-24 at 15 00 52](https://github.com/user-attachments/assets/4f6d420f-6fc4-4a5d-8a5a-3f6eb87f6c61)
![Simulator Screenshot - iPhone 15 - 2025-05-24 at 15 00 52](https://github.com/user-attachments/assets/bea04ebe-7dd2-4c47-a62c-869ca251db7c)


![Simulator Screenshot - iPhone 15 - 2025-05-24 at 13 59 14](https://github.com/user-attachments/assets/573d76e5-a6d3-4e48-a3eb-ddc8c1109958)


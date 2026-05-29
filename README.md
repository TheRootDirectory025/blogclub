# Blog Club - Modern Blog Exploration App 🚀

A sleek, high-performance Flutter application for exploring latest news, articles, and stories. Built with a focus on modern UI/UX principles, clean architecture, and optimized rendering.

## ✨ Features

- **Modern Onboarding:** A smooth, interactive introduction to the app's core value.
- **Dynamic Story System:** Instagram-style stories with gradient borders for new updates and dotted borders for viewed content.
- **Featured Categories:** Interactive carousel slider for exploring different blog niches.
- **Article Feed:** A clean, optimized list of latest news with engagement metrics (likes, reading time).
- **Smooth Navigation:** Custom-built bottom navigation bar with a floating action button effect.
- **Theming:** Centralized typography and color palette using Material 3 standards.

## 🛠️ Tech Stack & Optimization

- **Framework:** Flutter (Latest Stable)
- **State Management:** Preserving state across tabs using `IndexedStack`.
- **UI Components:**
  - `CarouselSlider` for featured content.
  - `DottedBorder` for story status visualization.
  - `SmoothPageIndicator` for onboarding flow.
- **Performance:** 
  - Optimized `ListView` rendering with `shrinkWrap` and `ClampingScrollPhysics`.
  - Proper asset management with generated classes for fonts and images.
  - Adaptive layouts for different screen sizes.

## 📸 Screenshots

| Splash & Onboarding | Authentication | Home Screen |
|:---:|:---:|:---:|
| ![Splash](screenshots/onboarding.png) | ![Auth](screenshots/auth.png) | ![Home](screenshots/home.png) |

*(Note: Replace placeholders with actual screenshots from your emulator)*

## 🚀 Getting Started

1. **Clone the repo:**
   ```bash
   git clone https://github.com/YOUR_USERNAME/blogclub.git
   ```
2. **Install dependencies:**
   ```bash
   flutter pub get
   ```
3. **Run the app:**
   ```bash
   flutter run
   ```

## 📝 License
This project is for educational purposes as part of a modern Flutter development portfolio.

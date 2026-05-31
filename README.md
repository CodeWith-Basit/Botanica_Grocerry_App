# 🌿 Botanica - Modern Grocery & Greens E-Commerce App

Botanica is a premium, minimalist, and user-friendly E-Commerce mobile application built using Flutter and Dart. Designed specifically for fresh organic produce, winter greens, and grocery shopping, the app focuses on providing a seamless, visually aesthetic user experience with dynamic content handling.

---

## ✨ Features

* **Dynamic Product Cart & Detail Navigation:** Clickable product cards that dynamically pass individual product data (images, titles, prices, weights, ratings, and descriptions) to a dedicated detail screen using advanced constructor-based routing.
* **Stateful Quantity Tracker:** A custom-styled, minimalist capsule-shaped counter allowing users to increment and decrement product quantities smoothly with instant UI updates (`setState`).
* **Premium UI/UX Aesthetics:** * Dynamic gradient banner overlays (e.g., "Seasonal Peak - Winter Greens") with custom leaf-green soft drop shadows.
    * Modern "Add to Cart" CTA buttons with custom `LinearGradient` styling and touch ripple effects using `InkWell`.
    * Horizontal `ListView.builder` grids for smooth "Similar Products" discovery panels.
* **Clean Architecture:** Highly reusable custom widgets, clean layout spacing, and proper responsive constraints using standard Flutter layout structures (`Stack`, `Row`, `Column`, `ClipRRect`).

---

## 🛠️ Tech Stack & Concepts Used

* **Framework:** Flutter (Latest Version)
* **Language:** Dart
* **State Management:** Local State Management (`StatefulWidget` & `setState`)
* **Layout & Styling:** Custom `BoxDecoration`, `LinearGradient`, Unified `BoxShadow` with precise offsetting, and positional layouts (`Stack`, `Positioned`).

---

## 🚀 Getting Started

To get a local copy up and running, follow these simple steps:

1. **Clone the repository:**
   ```bash
   git clone [https://github.com/your-username/Botanica.git](https://github.com/your-username/Botanica.git)

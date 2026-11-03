# 🛒 Easy Shop E-Commerce Ecosystem

A production-ready e-commerce solution built with **Flutter**, featuring two separate applications: a **Customer Mobile App** and a **Merchant/Admin Dashboard App**. 

The system leverages **Clean Architecture**, **Cubit** state management with **Freezed**, **Dio** RESTful APIs, **Bingo** local caching, and **OpenStreetMap** for live delivery tracking.

---

## 📱 Apps Included

| App Name | Role | Core Tech Stack |
| :--- | :--- | :--- |
| **`esay_shop`** | Customer-facing mobile application for browsing products, managing cart/favorites, checking out, and tracking orders. | Flutter, Cubit, Freezed, Dio, Bingo, OpenStreetMap (`flutter_map`) |
| **`esay_shop_admin`** | Admin and Merchant management dashboard for product & category management, order processing, and stock management. | Flutter, Cubit, Freezed, Dio, Bingo |

---

## 🏗️ Architecture & Engineering Patterns

Both applications follow **Clean Architecture** principles to guarantee strict separation of concerns, testability, and scalability:

* **Presentation Layer:** Handled using `StatelessWidget` composition paired with **Cubit** for UI state management. Immutable states are strictly generated via **Freezed**.
* **Domain Layer:** Enforces core business logic, entities, and repository interfaces.
* **Data Layer:** Handles network calls using **Dio** with custom interceptors, data mapping (DTOs), and offline/local persistence using **Bingo** storage.

```text
easy_shop_workspace/
├── esay_shop/               # Customer Mobile Application
│   ├── lib/
│   │   ├── core/           # Network (Dio), Logic (ApiResult), Shared Components
│   │   └── feature/        # Auth, Home, Cart, Product Details, Orders, Payment
│   └── pubspec.yaml
│
└── esay_shop_admin/         # Merchant/Admin Application
    ├── lib/
    │   ├── core/           # Common utilities & API client
    │   └── feature/        # Auth, Products/Categories (Upsert), Orders Management
    └── pubspec.yaml

# Flutter Clean Architecture with MVVM

An example Flutter project demonstrating **Clean Architecture** with **MVVM (Model-View-ViewModel)** pattern using **Provider** and **get_it** for dependency injection.

This project is based on the article *Flutter Clean Architecture with MVVM* by Mohit Kokane. :contentReference[oaicite:1]{index=1}

---

## 🚀 Overview

This project illustrates how to structure a Flutter app using:

- **Separation of concerns**  
- **Domain-driven design**
- **Testable and scalable architecture**
- **MVVM pattern**
- **Dependency Injection with get_it**
- **State management with Provider**

---

## 📁 Folder Structure

lib/
├─ main.dart
├─ core/
│ ├─ error/ // custom failures/exceptions
│ └─ usecase/ // (optional) use cases
├─ di/
│ └─ injection.dart // get_it registrations
├─ data/
│ ├─ models/
│ │ └─ product_model.dart
│ ├─ sources/
│ │ ├─ product_remote_data_source.dart
│ │ └─ product_local_data_source.dart
│ └─ repositories/
│ └─ product_repository_impl.dart
├─ domain/
│ ├─ entities/
│ │ └─ product.dart
│ └─ repositories/
│ └─ product_repository.dart
├─ presentation/
│ ├─ viewmodels/
│ │ └─ product_list_viewmodel.dart
│ └─ views/
│ ├─ product_list_page.dart
│ └─ widgets/
│ └─ product_tile.dart
└─ utils/
└─ constants.dart

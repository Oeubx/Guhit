# Guhit (Art Commissions & Community Platform)

**Guhit** (meaning *"draw"* or *"line"* in Tagalog) is a mobile-first social marketplace and portfolio platform built using Flutter and integrated with Firebase. It connects digital artists with art commissioners and buyers, allowing artists to showcase their artwork, manage custom commission orders, and chat in real-time with clients.

---

## 🚀 Key Features

### 🎨 1. Community & Portfolio
* **Art Feed**: Users can upload and share their artwork posts with descriptions.
* **Likes & Comments**: Interactive community feed allowing comments and likes on community posts.
* **Featured Portfolio**: Artists can toggle an `include_inPortfolio` flag on their posts to display selected artworks on their public profiles.

### 💼 2. E-Commerce & Commission Management
* **Become an Artist**: A dedicated onboarding page for general users to register as creators.
* **Commission Listings**: Artists can publish custom commission offerings with:
  * Description & background showcase image.
  * Price ranges.
  * Custom terms and conditions (T&C).
* **Order Flow**: A structured transaction pipeline featuring:
  * Order creation from buyer POV.
  * WIP (Work In Progress) status tracking.
  * Approval and payment indicators (`for_approval`, `is_paid`).
  * Order cancellations (supported on both artist and buyer sides).
  * Completion marks (`is_completed`).

### 💬 3. Communication & Notifications
* **In-App Messaging**: Real-time chat system matching commissioners and artists.
* **Activity Notifications**: Alert triggers for order changes, comments, and messages.

---

## 🛠 Tech Stack & Dependencies

* **Frontend**: [Flutter SDK](https://flutter.dev) (Dart) - Configured for Stable releases.
* **State Management**: `Provider` & FlutterFlow State Management (`FFAppState`).
* **Navigation**: `GoRouter` for deep-linked declarative routing.
* **Database & Auth**: [Firebase](https://firebase.google.com) suite:
  * **Firebase Authentication**: Email/Password, Google Sign-In, Apple Sign-In.
  * **Cloud Firestore**: Real-time document database.
  * **Firebase Storage**: Secure file upload for user avatars, posts, and artwork submissions.
  * **Firebase Performance**: Built-in monitoring for app speed.

---

## 📁 Repository Structure

Below are the primary directories and their responsibilities:

```text
Guhit/
├── android/                   # Native Android wrapper and config
├── ios/                       # Native iOS wrapper and config
├── assets/                    # Project assets (fonts, images, PDFs)
├── firebase/                  # Firestore security rules and Indexes
│   ├── firestore.rules        # Database security parameters
│   └── firestore.indexes.json # Database queries indexes config
├── lib/
│   ├── auth/                  # Firebase authentication managers
│   ├── backend/               # Firestore database schemas and API config
│   │   └── schema/            # DB Model Records (users, posts, orders)
│   ├── community/             # UI widgets to view/create community posts
│   ├── e_commerce/            # Seller/Buyer order details and management
│   ├── nav_bar_pages/         # Main bottom-nav destinations (Chat, Comms, Home)
│   ├── settings/              # Settings, terms, and onboarding portals
│   ├── main.dart              # App initialization entry point
│   └── index.dart             # Route exports
└── pubspec.yaml               # Flutter package configuration & dependencies
```

---

## 🗄 Firestore Database Schema

The app utilizes the following Cloud Firestore collections:

| Collection Name | Purpose | Key Fields |
|---|---|---|
| `users` | Stores accounts for both Buyers and Artists | `email`, `display_name`, `photo_url`, `artist` (bool), `bio`, `users_imFollowing`, `users_FollowingMe` |
| `communityPosts` | Public posts shared on the home feed | `poster` (ref), `image` (url), `description`, `likes` (list of refs), `include_inPortfolio` (bool) |
| `communityPostComments` | Comments under artwork posts | `user` (ref), `post` (ref), `comment_text`, `created_time` |
| `commissionPost` | Offerings created by artists | `user_DocRef` (ref), `commission_desc`, `bg_img`, `price_range`, `comms_toc`, `is_open` (bool) |
| `ordersComms` | Active commission requests / order state | `comms_creator` (ref), `comms_commissioner` (ref), `comms_title`, `comms_price`, `is_WIP` (bool), `is_completed` (bool) |
| `chats` | Chat session instances | `users` (list of refs), `last_message`, `last_message_time` |
| `chatMessages` | Sub-collection or matching records of messages | `user` (ref), `text`, `image` (url), `timestamp` |

---

## ⚙ Setup & Local Running

Because this repository is public-ready, production API keys have been replaced with placeholders. Follow these steps to set up and run the project:

### 1. Prerequisites
* Install [Flutter SDK](https://docs.flutter.dev/get-started/install) (matches version `3.0.0` to `< 4.0.0`).
* Set up a [Firebase Project](https://console.firebase.google.com/).

### 2. Configure Firebase Settings
Restore your project-specific Firebase credentials in the following configuration files:

* **Web Setup**: Modify [firebase_config.dart](file:///c:/BiboyStuffs/Guhit/lib/backend/firebase/firebase_config.dart) and replace `YOUR_WEB_API_KEY`, `YOUR_PROJECT_ID`, etc., with your Web App config credentials.
* **Android Setup**: Replace the placeholder keys in [google-services.json](file:///c:/BiboyStuffs/Guhit/android/app/google-services.json) with your Android App credentials downloaded from Firebase Console.
* **iOS Setup**: Replace the placeholder credentials in [GoogleService-Info.plist](file:///c:/BiboyStuffs/Guhit/ios/Runner/GoogleService-Info.plist) with your iOS App plist credentials downloaded from Firebase Console.

### 3. Install Dependencies
Run the following command in the root folder of the project to fetch all required Dart packages:
```bash
flutter pub get
```

### 4. Build and Run
Connect a physical device or launch a simulator, and run:
```bash
flutter run
```

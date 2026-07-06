# Guhit (Art Commissions & Community Platform) - Version 2 (AI Vision)

**Guhit** (meaning *"draw"* or *"line"* in Tagalog) is a mobile-first social marketplace and portfolio platform built using Flutter, Firebase, and Supabase. It connects digital artists with art commissioners and buyers, allowing artists to showcase their artwork, manage custom commission orders, and chat in real-time with clients.

### 👁️ What's New in Version 2: Computer Vision Auto-Tagging
Version 2 introduces an advanced **Computer Vision** pipeline powered by Google's **Gemini 2.5 Flash** multimodal model. The app automatically scans uploaded artwork images and categorizes them with relevant tags to enhance searchability and platform trend analysis.

---

## 🚀 Key Features

### 👁️ 1. Computer Vision & Auto-Tagging (New)
* **AI Image Analyzer**: When creating a post, the app converts the uploaded image into a Base64 string and runs a multimodal vision request via the `UploadTagsGenerationCall` API.
* **Auto-Category Detection**: The vision model automatically tags the artwork with tags such as:
  * *Medium/Style*: Anime Style, Realism, Cartoon, Abstract, Minimalist, Monochrome.
  * *Subject*: Character, Landscape, Still Life, Portrait, Fantasy, Sci-fi, Full body, Close up.
* **Consent & Privacy Modal**: Users are prompted with a transparency warning dialog (`c_warning_widget.dart`) clarifying that:
  * The image is processed solely for platform statistics and trend analysis.
  * The actual artwork **will not** be used to train generative AI models.

### 🎨 2. Community & Portfolio
* **Art Feed**: Users can browse and upload artwork posts with auto-generated tags and custom descriptions.
* **Likes & Comments**: Interactive community feed allowing comments and likes on community posts.
* **Featured Portfolio**: Artists can toggle an `include_inPortfolio` flag on their posts to display selected artworks on their public profiles.

### 💼 3. E-Commerce & Commission Management
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

### 💬 4. Communication & Notifications
* **In-App Messaging**: Real-time chat system matching commissioners and artists.
* **Activity Notifications**: Alert triggers for order changes, comments, and messages.

---

## 🛠 Tech Stack & Dependencies

* **Frontend**: [Flutter SDK](https://flutter.dev) (Dart) - Configured for Stable releases.
* **State Management**: `Provider` & FlutterFlow State Management (`FFAppState`).
* **Navigation**: `GoRouter` for deep-linked declarative routing.
* **AI & Computer Vision**: **Gemini 2.5 Flash API** (`generativelanguage.googleapis.com`).
* **Backend Database & Auth**: Dual-backend support:
  * **Firebase**: Authentication, Cloud Firestore (comments, posts, chat), and Storage.
  * **Supabase**: Supabase client (`SupaFlow`) for database and table models (ratings, commission status).

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
│   ├── auth/                  # Firebase & Supabase authentication managers
│   ├── backend/               # DB Model schemas, Supabase config, and API requests
│   │   ├── api_requests/      # API definitions (Gemini Vision Tagger)
│   │   ├── supabase/          # Supabase Client database and storage hooks
│   │   └── schema/            # DB Model Records (users, posts, orders)
│   ├── community/             # UI widgets to view/create community posts
│   ├── content_module/        # Content warnings and AI upload workflow
│   ├── e_commerce/            # Seller/Buyer order details and management
│   ├── nav_bar_pages/         # Main bottom-nav destinations (Chat, Comms, Home)
│   ├── settings/              # Settings, terms, and onboarding portals
│   ├── main.dart              # App initialization entry point
│   └── index.dart             # Route exports
└── pubspec.yaml               # Flutter package configuration & dependencies
```

---

## 🗄 Database Schema

The app utilizes the following primary database structures:

| Entity Name | Storage | Purpose | Key Fields |
|---|---|---|---|
| `users` | Firestore | Stores accounts for both Buyers and Artists | `email`, `display_name`, `photo_url`, `artist` (bool), `bio` |
| `communityPosts` | Firestore | Public posts shared on the home feed | `poster` (ref), `image` (url), `description`, `likes` (list of refs), `include_inPortfolio` (bool) |
| `commissionPost` | Firestore | Offerings created by artists | `user_DocRef` (ref), `commission_desc`, `bg_img`, `price_range`, `comms_toc`, `is_open` (bool) |
| `ordersComms` | Firestore | Active commission requests / order state | `comms_creator` (ref), `comms_commissioner` (ref), `comms_title`, `comms_price`, `is_WIP` (bool), `is_completed` (bool) |
| `chats` / `messages` | Firestore | Real-time chat messaging channels | `users`, `last_message`, `text`, `image`, `timestamp` |
| `commissionRating` | Supabase | Stores buyer feedback ratings for commissions | `commissionRating` (double), `user_id`, `review_text` |

---

## ⚙ Setup & Local Running

Because this repository is public-ready, production API keys have been replaced with placeholders. Follow these steps to set up and run the project:

### 1. Prerequisites
* Install [Flutter SDK](https://docs.flutter.dev/get-started/install) (matches version `3.0.0` to `< 4.0.0`).
* Set up a [Firebase Project](https://console.firebase.google.com/).
* Set up a [Supabase Project](https://supabase.com/).
* Generate a [Gemini API Key](https://aistudio.google.com/).

### 2. Configure Service Credentials
Restore your project-specific credentials in the following configuration files:

* **Gemini Vision Setup**: Modify [api_calls.dart](file:///c:/BiboyStuffs/Guhit/lib/backend/api_requests/api_calls.dart) and replace `YOUR_GEMINI_API_KEY` with your actual Gemini API key.
* **Supabase Setup**: Modify [supabase.dart](file:///c:/BiboyStuffs/Guhit/lib/backend/supabase/supabase.dart) and replace `YOUR_SUPABASE_PROJECT_ID` and `YOUR_SUPABASE_ANON_KEY` with your project's endpoint and anon key.
* **Firebase Web Setup**: Modify [firebase_config.dart](file:///c:/BiboyStuffs/Guhit/lib/backend/firebase/firebase_config.dart) and replace web configuration credentials.
* **Firebase Android Setup**: Replace placeholder values in [google-services.json](file:///c:/BiboyStuffs/Guhit/android/app/google-services.json) with your downloaded config.
* **Firebase iOS Setup**: Replace placeholder values in [GoogleService-Info.plist](file:///c:/BiboyStuffs/Guhit/ios/Runner/GoogleService-Info.plist) with your downloaded config.

### 3. Install Dependencies & Run
```bash
flutter pub get
flutter run
```

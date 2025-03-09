Flutter Booking App
Overview
This project is a feature-rich Flutter app prototype designed for managing event bookings. The app provides user authentication, event listing, an organizer section, and an onboarding experience.

Features
Login & Signup: User authentication using Firebase.
OTP Verification: Secure login and registration with OTP-based verification.
Onboarding Screen: Guides users through the app features on first launch.
Home Page: Displays a list of events available for booking.
Event Details: Provides detailed information about each event with booking options.
Organizer Section: Displays event organizers and their hosted events.
Eevents:in Home,and saved events screen and seell events screen
State Management: Implemented using Cubit to ensure smooth UI interactions.
Architecture
The project follows Clean Architecture, ensuring a modular, scalable, and maintainable codebase.

Folder Structure
bash
Copy
Edit
📦 booking_app/
 ┣ 📂 core/             # Shared resources (constants, utils, theme, etc.)
 ┣ 📂 features/         # Contains app features
 ┃ ┣ 📂 login/          # Login, Register, OTP
 ┃ ┃ ┣ 📂 domain/      # Entities & repository interfaces
 ┃ ┃ ┣ 📂 data/        # Models, repository implementation, API handling
 ┃ ┃ ┣ 📂 presentation/ # UI screens, controllers (Cubit)
 ┃ ┣ 📂 home/          # Home & Event listing
 ┃ ┣ 📂 event_details/ # Detailed event information
 ┃ ┣ 📂 organizer/     # Organizer listing and details
 ┃ ┣ 📂 onboarding/    # Onboarding screen
 ┣ 📂 main.dart        # Entry point of the app
Technologies Used
Flutter: Frontend UI framework.
Firebase Authentication: User login and registration.
Cubit (Bloc): State management.
Hive: Local storage for caching events and user data.
Dio: Networking package for API calls.
Clean Architecture: Layered architecture for better scalability.
Future Enhancements
Personalized Event Recommendations: Using AI-based suggestions.

Deployment Steps
Ensure all dependencies are installed:
flutter pub get
flutter run
Build APK for deployment:
flutter build apk

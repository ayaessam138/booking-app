import 'package:bookingapp/core/helpers/functions.dart';
import 'package:bookingapp/core/routing/app_routes.dart';
import 'package:bookingapp/feature/bottom_nav_bar/persentation/screens/bottom_nav_bar_screen.dart';
import 'package:bookingapp/feature/events/persentation/screens/event_details.dart';
import 'package:bookingapp/feature/events/persentation/screens/events_screen.dart';
import 'package:bookingapp/feature/login/persentation/screens/login_screen.dart';
import 'package:bookingapp/feature/onboading/persentations/screens/on_borading_screen.dart';
import 'package:bookingapp/feature/organizer/persenation/screens/organizer_screen.dart';
import 'package:bookingapp/feature/otp/persentation/screens/otp_screen.dart';
import 'package:bookingapp/feature/register/persentation/screens/register_screen.dart';
import 'package:bookingapp/feature/splash/persentation/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppHeleperFunctions.getinialRoutes(),
    routes: [
      GoRoute(
        name: AppRoutes.splashScreen,
        path: AppRoutes.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: AppRoutes.onBoradingScreen,
        path: AppRoutes.onBoradingScreen,
        builder: (context, state) => const OnBoradingScreen(),
      ),
      GoRoute(
        name: AppRoutes.loginScreen,
        path: AppRoutes.loginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: AppRoutes.registerScreen,
        path: AppRoutes.registerScreen,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        name: AppRoutes.eventsScreen,
        path: AppRoutes.eventsScreen,
        builder: (context, state) => const EventsScreen(),
      ),
      GoRoute(
        name: AppRoutes.eventsDeatilsScreen,
        path:  '${AppRoutes.eventsDeatilsScreen}/:id',
        builder: (context, state) => EventDetails(id: state.pathParameters["id"]??'',),
      ),  GoRoute(
        name: AppRoutes.organizerScreen,
        path:  '${AppRoutes.organizerScreen}/:id',
        builder: (context, state) => OrganizerScreen(id: state.pathParameters["id"]??'',),
      ),
      GoRoute(
        name: AppRoutes.otpScrren,
        path: AppRoutes.otpScrren,
        builder: (context, state) => OtpScreen(),
      ),  GoRoute(
        name: AppRoutes.bottomNavBarScreen,
        path: AppRoutes.bottomNavBarScreen,
        builder: (context, state) => BottomNavBarScreen(),
      ),
    ],
  );
}

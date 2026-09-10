import 'package:go_router/go_router.dart';
import 'package:movie_rental_mhsp/core/features/login/ui/login_page.dart';
import 'package:movie_rental_mhsp/core/features/movies/ui/movies_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/Movies-page',
      builder: (context, state) => const MoviesPage(),
    ),
  ],
);
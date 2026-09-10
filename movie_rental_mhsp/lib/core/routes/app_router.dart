import 'package:go_router/go_router.dart';
import 'package:movie_rental_mhsp/core/features/login/ui/login_page.dart';
import 'package:movie_rental_mhsp/core/features/movies/ui/movies_page.dart';
import 'package:movie_rental_mhsp/core/features/movies/ui/ui_components/movie_unit_display.dart'; //STUB

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const CustomMovieUnitDisplay(informationDisplay: "MOVIE TEST STUB"),
    ),
    GoRoute(
      path: '/Movies-page',
      builder: (context, state) => const MoviesPage(),
    ),
  ],
);
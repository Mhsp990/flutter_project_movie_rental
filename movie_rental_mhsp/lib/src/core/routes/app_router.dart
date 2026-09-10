import 'package:go_router/go_router.dart';
import 'package:movie_rental_mhsp/src/core/features/login/ui/login_page.dart';
import 'package:movie_rental_mhsp/src/core/features/movies/movies_page.dart';
import 'package:movie_rental_mhsp/src/shared/proto/login_package.pb.dart';
//import 'package:movie_rental_mhsp/src/core/features/movies/ui_components/movie_unit_display.dart'; //STUB

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      //builder: (context, state) => const CustomMovieUnitDisplay(informationDisplay: "MOVIE TEST STUB"),
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/Movies-page',
      builder: (context, state) {
        final extraUser = GoRouterState.of(context).extra! as User;

        return MoviesPage(extraUser);
      } ,
    ),
  ],
);
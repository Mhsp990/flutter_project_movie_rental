import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_rental_mhsp/src/core/di/injection.dart';
import 'package:movie_rental_mhsp/src/core/features/movies/controllers/movies_controller.dart';
import 'package:movie_rental_mhsp/src/core/features/movies/ui/movie_rental_page.dart';
import 'package:movie_rental_mhsp/src/core/features/movies/ui/movies_list_page.dart';
import 'package:movie_rental_mhsp/src/shared/proto/login_package.pb.dart';

class MoviesPage extends StatelessWidget {
  final User user;
  const new(this.user, {super.key});

  static final MoviesController moviesController = getIt<MoviesController>();


  @override
  Widget build(BuildContext context) {


    User user = GoRouterState.of(context).extra! as User;

    moviesController.initUser(user);



    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 94, 72, 189),
          //title: const Text('Movies'),
          bottom: const TabBar(
            labelColor: Colors.white,

            tabs: <Widget>[
              Tab(//icon: Icon(Icons.grid_4x4), 
              text: "Available Movies",),

              Tab(//icon: Icon(Icons.list), 
              text: "Movies rental"),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            MoviesListPage(),
            MovieRentalPage()
            //Forms2Page(),
          ],
        ),
      ),
    );
  }
}

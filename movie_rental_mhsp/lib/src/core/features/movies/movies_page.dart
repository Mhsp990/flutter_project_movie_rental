import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_rental_mhsp/src/core/di/injection.dart';
import 'package:movie_rental_mhsp/src/core/features/movies/controllers/movies_controller.dart';
import 'package:movie_rental_mhsp/src/core/features/movies/ui/movies_list_page.dart';
import 'package:movie_rental_mhsp/src/shared/proto/login_package.pb.dart';

class MoviesPage extends StatelessWidget {
  final User user;
  const new(this.user, {super.key});

  static final MoviesController moviesController = getIt<MoviesController>();


  @override
  Widget build(BuildContext context) {


    User user = GoRouterState.of(context).extra! as User;



    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Forms Application'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.grid_4x4), text: "GridView"),
              Tab(icon: Icon(Icons.list), text: "ListView"),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            MoviesListPage(),
            MoviesListPage()
            //Forms2Page(),
          ],
        ),
      ),
    );
  }
}

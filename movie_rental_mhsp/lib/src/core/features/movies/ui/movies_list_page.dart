import 'package:flutter/material.dart';
import 'package:movie_rental_mhsp/src/core/di/injection.dart';
import 'package:movie_rental_mhsp/src/core/features/movies/controllers/movies_controller.dart';
import 'package:movie_rental_mhsp/src/core/features/movies/ui/ui_components/movie_grid_builder.dart';
import 'package:signals/signals_flutter.dart';

class MoviesListPage extends StatelessWidget {
  const new({super.key});

  static final _controller = getIt<MoviesController>();

    @override
  Widget build(BuildContext context) {


    _controller.getMoviesList();


    return Scaffold(
      appBar: AppBar(
        title: const Text('Forms'),
        backgroundColor: Colors.purple[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: SignalBuilder(
                  builder: (context) { 
                    _controller.movies.length;
                    return GridBuilder(
                    onTap: (movie) {
                      // _controllerUser.text = user.name;
                      // _controllerEmail.text = user.email;
                      // _controllerAdress.text = user.adress;
                    },
                    movies: _controller.movies,
                  );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
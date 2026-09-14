import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_rental_mhsp/src/core/di/injection.dart';
import 'package:movie_rental_mhsp/src/core/features/movies/controllers/movies_controller.dart';
import 'package:movie_rental_mhsp/src/core/features/movies/controllers/rental_movies_controller.dart';
import 'package:movie_rental_mhsp/src/core/features/movies/ui/ui_components/movie_grid_builder.dart';
import 'package:signals/signals_flutter.dart';

class MovieRentalPage extends StatelessWidget {
  const new({super.key});
  
  static final _moviesController = getIt<MoviesController>();
  static final _controller = getIt<RentalController>();

     @override
  Widget build(BuildContext context) {


    _controller.getMoviesByUser(_controller.user!.id);


    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 8, 71),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 15,),
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
                      _moviesController.enableOrDisableRental(false);
                      context.push('/Movies-rental-info', extra: movie); 
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
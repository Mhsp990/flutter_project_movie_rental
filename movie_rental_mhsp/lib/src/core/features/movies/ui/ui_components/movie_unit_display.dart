import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_rental_mhsp/src/shared/proto/login_package.pb.dart';


//const double CONTAINER_HEIGHT = 300.0;
//const double CONTAINER_WIDTH = 200.0;

class CustomMovieUnitDisplay extends StatelessWidget {
  

  final Movie movie;

  const new({super.key, required this.movie});


  @override
  Widget build(BuildContext context) {
    return Container(
      //width: CONTAINER_WIDTH,
      //height: CONTAINER_HEIGHT,
      decoration: BoxDecoration(
        border : Border.all(), borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment:  MainAxisAlignment.spaceAround,
        children: [
          
          Image.memory(Uint8List.fromList(movie.cover)),

          Text(
            movie.value.toString(),
          ),
        ],

      ),


    );
  }
}
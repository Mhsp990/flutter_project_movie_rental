import 'package:flutter/material.dart';


const double CONTAINER_HEIGHT = 300.0;
const double CONTAINER_WIDTH = 200.0;

class CustomMovieUnitDisplay extends StatelessWidget {
  

  final String informationDisplay; //
  //final Image movieImage;

  const new({super.key, required this.informationDisplay});


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
          Image(
          image : AssetImage('assets/image.png'), //TODO : Mudar para lidar com image memory
          //width: CONTAINER_WIDTH - 20,
          //height: CONTAINER_HEIGHT - 30,
          ),

          Text(
            informationDisplay,
            
          ),
        ],

      ),


    );
  }
}
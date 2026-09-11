import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:movie_rental_mhsp/src/shared/proto/login_package.pb.dart';

class MoveInfoPage extends StatelessWidget {
    const MoveInfoPage({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
  padding: const EdgeInsets.all(16),
  child: Row(
    children: [
      Column(
        children: [
          Image.memory(Uint8List.fromList(movie.cover)),
          Align(child: Text(('R\$ ' + movie.value.toStringAsFixed(2)), 
                  style: TextStyle(fontSize: 14, color: Colors.white),), 
                  alignment: AlignmentGeometry.center,),
        ],
      ),
      const SizedBox(width: 16),
      Column(
        children: [
          Align(child: Text(movie.title, 
                  style: TextStyle(fontSize: 20, color: Colors.white),), 
                  alignment: AlignmentGeometry.center,),

          Align(child: Text(movie.sinopse, 
                  style: TextStyle(fontSize: 20, color: Colors.white),), 
                  alignment: AlignmentGeometry.center,),


          Row(
            children: [
              Column( // Mostra o ano
                children: [
                  Align(child: Text('Year', 
                      style: TextStyle(fontSize: 10, color: Colors.white),), 
                      alignment: AlignmentGeometry.center,),
                  
                  Align(child: Text(movie.year, 
                    style: TextStyle(fontSize: 9, color: Colors.white),), 
                    alignment: AlignmentGeometry.center,),
                ],
              ),

              Column( // Mostra o DIRETOR
                children: [
                  Align(child: Text('Director', 
                      style: TextStyle(fontSize: 10, color: Colors.white),), 
                      alignment: AlignmentGeometry.center,),
                  
                  Align(child: Text(movie.director, 
                    style: TextStyle(fontSize: 9, color: Colors.white),), 
                    alignment: AlignmentGeometry.center,),
                ],
              ),    
            ],
          ),

          Row(
            children: [
            OutlinedButton(
                onPressed: () => {},
                child: const Text('Cancel'),
                  ),

            OutlinedButton(
                    backgroundColor: const Color.fromARGB(255, 182, 165, 185),
                    onPressed: () => {},
                    child: const Text('Clear'),
                  ),
            ],
          )
          

        ],
      ),
    ],
  ),
);
  }
}
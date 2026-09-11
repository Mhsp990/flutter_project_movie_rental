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
    return Scaffold(
      body: Container(
        color : const Color.fromARGB(255, 129, 72, 72),
        padding: const EdgeInsets.all(16),
        child: Row(
      children: [
        Column(
          children: [
            Expanded(child: Image.memory(Uint8List.fromList(movie.cover),)),
            Align(child: Text(('R\$ ' + movie.value.toStringAsFixed(2)), 
                    style: TextStyle(fontSize: 14, color: Colors.white),), 
                    alignment: AlignmentGeometry.center,),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            children: [
              Align(child: Text(movie.title, 
                      style: TextStyle(fontSize: 20, color: Colors.white),), 
                      alignment: AlignmentGeometry.center,),
                
              Align(child: Text(movie.sinopse, softWrap: true,
                      style: TextStyle(fontSize: 20, color: Colors.white, ),), 
                      alignment: AlignmentGeometry.center,)
                      
                      ,
                Spacer(),   
                
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      Column( // Mostra o ano
                        children: [
                          Align(child: Text('Year', 
                              style: TextStyle(fontSize: 10, color: Colors.white),), 
                              alignment: AlignmentGeometry.center,),
                          SizedBox(height: 5,),
                          Align(child: Text(movie.year, 
                            style: TextStyle(fontSize: 9, color: Colors.white),), 
                            alignment: AlignmentGeometry.center,),
                          SizedBox(height: 5,),
                        ],
                      ),
                    SizedBox(width: 16,),
                      Column( // Mostra o DIRETOR
                        children: [
                          Align(child: Text('Director', 
                              style: TextStyle(fontSize: 10, color: Colors.white),), 
                              alignment: AlignmentGeometry.center,),
                          SizedBox(height: 5,),
                          Align(child: Text(movie.director, 
                            style: TextStyle(fontSize: 9, color: Colors.white),), 
                            alignment: AlignmentGeometry.center,),
                          SizedBox(height: 5,),
                        ],
                      ),    
                    ],
                  ),
                ],
              ),
                
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                OutlinedButton(
                    onPressed: () => {},
                    child: const Text('Cancel'),
                      ),
                const SizedBox(width: 16),
                OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 182, 165, 185),
                        ), 
                        onPressed: () => {},
                        child: const Text('Rental'),
                      ),
                ],
              )
              
                
            ],
          ),
        ),
      ],
        ),
      ),
    );
  }
}
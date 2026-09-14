import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_rental_mhsp/src/core/di/injection.dart';
import 'package:movie_rental_mhsp/src/core/features/movies/controllers/movies_controller.dart';
import 'package:movie_rental_mhsp/src/core/features/movies/controllers/rental_movies_controller.dart';
//import 'package:movie_rental_mhsp/src/core/network/server_address.dart';
import 'package:movie_rental_mhsp/src/shared/proto/login_package.pb.dart';

class MoveInfoPage extends StatelessWidget {
    const MoveInfoPage({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final moviesController = getIt<MoviesController>();
    final rentalController = getIt<RentalController>();
    

    final String buttonText;

    if (moviesController.isRental == true){
      buttonText = "Rental";
    }
    else
    {
      buttonText = "Watch";
    }
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies List', style: TextStyle(
          color: Color.fromARGB(255, 202, 201, 198),

        ),
        ),
        backgroundColor: const Color.fromARGB(255, 87, 60, 161),
        
      ),


      body: Container(
        color : const Color.fromARGB(255, 73, 13, 83),
        padding: const EdgeInsets.all(50),
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
                    onPressed: () => {
                      context.pop()
                    },
                    child: const Text('Cancel'),
                      ),
                const SizedBox(width: 16),
                OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 182, 165, 185),
                        ), 
                        onPressed: () async {
                          if (moviesController.isRental){
                            print("Botao de alugar filme pressionado.");
                            bool? success = await rentalController.rentMovie(rentalController.user!.id, movie.id);
                            
                            if (success){
                              context.pop();
                            }
                            else{
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Ação proibida!"),
                                    content: const Text("Não é possível alugar um filme que você já possui"),
                                    actions: [
                                      TextButton(
                                        child: const Text("OK"),
                                        onPressed: () {
                                          Navigator.of(context).pop(); // Closes the dialog
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );

                            }
                          }else{ // Se não for tela de alugar, é a tela de assistir e devolver.
                            print("Botao de ASSISTIR e DEVOLVER filme pressionado");
                            bool result = await rentalController.watchMovieAndReturn(rentalController.user!.id, movie.id);
                            context.pop();
                          }                          
                        },
                        child: Text(buttonText),
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
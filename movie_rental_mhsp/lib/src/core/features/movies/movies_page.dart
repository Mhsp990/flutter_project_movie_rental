import 'package:flutter/material.dart';
import 'package:movie_rental_mhsp/src/shared/proto/login_package.pb.dart';

class MoviesPage extends StatelessWidget {
  final User user;
  const new(this.user, {super.key});

@override
 Widget build(BuildContext context) {
    return 
     Scaffold(
        body : Stack(
          children: [
            Opacity(
              opacity: 0.2,
              child : Image(
                image: AssetImage('assets/image.png'),
                repeat : ImageRepeat.repeat,
                width: double.maxFinite,
                height: double.maxFinite,
                ),

            ),

            Center(
              child: Container(
                height: 300,
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius:  BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 110, 52, 96)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    
                
                    Align(child: Text("Entrar", style: TextStyle(fontSize: 20, color: Colors.white),), alignment: AlignmentGeometry.topStart,),
                    Align(child: Text("Esqueceu a senha", style: TextStyle(fontSize: 12, color: Colors.white),), alignment: AlignmentGeometry.topEnd,),
                
                    Row(
                      children: 
                      [
                        Text("Entrar"),
                      ],
                    ),
                  ],
                ),
                  ),
              ),
            ),
          ],
        )
    );
  }
}
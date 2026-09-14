import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
//import 'package:go_router/go_router.dart';
import 'package:movie_rental_mhsp/src/core/di/injection.dart';
import 'package:movie_rental_mhsp/src/core/features/login/controllers/login_controller.dart';
import 'package:movie_rental_mhsp/src/shared/proto/login_package.pb.dart';

class LoginPage extends StatelessWidget {

  LoginPage({super.key});


  final _controllerLoginText = TextEditingController(text : '');
  final _controllerPasswordText = TextEditingController(text : '');

  final controllerLogin = getIt<LoginController>();

   var textLogin = 'MyLogin';
   var textPassword = 'MyPassword';


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
                
                    TextField(
                      controller:  _controllerLoginText,
                      decoration:  InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Login", style: TextStyle(color: Colors.white),),
                      ),
                    ),
                
                    TextField(
                      controller:  _controllerPasswordText,
                      decoration:  InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Password", style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    Align(child: Text("Esqueceu a senha", style: TextStyle(fontSize: 12, color: Colors.white),), alignment: AlignmentGeometry.topEnd,),
                
                    Row(
                      children: 
                      [
                        ElevatedButton(
                        onPressed: () async
                        {
                          print("BOTAO PRESSIONADO");
                          User? user = await controllerLogin.executeLogin(_controllerLoginText.text, _controllerPasswordText.text);
                          
                          if (user != null){
                            context.go('/Movies-page', extra: user);
                          }
                          else{
                            //TODO
                            print("Não foi possível realizar o login");
                            showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Erro ao tentar logar"),
                                      content: const Text("O login ou senha podem estar incorretos."),
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
                          
                        }, 
                        child: Text("Entrar"),
                        ),
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
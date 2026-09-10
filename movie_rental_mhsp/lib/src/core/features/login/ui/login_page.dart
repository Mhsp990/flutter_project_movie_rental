import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const new({super.key});


  final _controllerLogin = TextEditingController(text : '');
  final _controllerPassword = TextEditingController(text : '');

  var textLogin = 'MyLogin';
  var textPassword = 'MyPassword';


  @override
 Widget build(BuildContext context) {
    return 
     Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          title : Text('Entrar')
        ),

        body : Stack(
          children: [
            Opacity(
              opacity: 0.3,
              child : Image(
                image: AssetImage('assets/image.png'),
                repeat : ImageRepeat.repeat,
                width: double.maxFinite,
                height: double.maxFinite,
                ),

            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child : Column(
              children: [
                //Center(child : Text("Formulário")),
            
                TextField(
                  controller:  _controllerLogin,
                  decoration:  InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Login"),
                  ),
                ),
            
                TextField(
                  controller:  _controllerPassword,
                  decoration:  InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Password'),
                  ),
                ),
            
                Row(
                  children: 
                  [
                    ElevatedButton(
                    onPressed: (){}, 
                    child: Text("Entrar"),
                    ),
                  ],
                ),
              ],
            ),
              ),
          ],
        )
    );
  }
}
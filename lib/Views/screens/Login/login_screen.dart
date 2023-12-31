import 'package:flutter/material.dart';

import 'package:gestionresidencial/Views/Components/mybutton_component.dart';
import 'package:gestionresidencial/Views/Components/mybutton2_component.dart';
import 'package:gestionresidencial/Views/Components/mytextfield_component.dart';
import 'package:gestionresidencial/Views/Components/squaretile_component.dart';
import 'package:gestionresidencial/Views/Widgets/hiddenDrawer/hiddenDrawer.dart';
import 'package:gestionresidencial/Views/screens/Login/register_screen.dart';

import 'package:gestionresidencial/localstore/sharepreference.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  static const String nombre = 'login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  final prefs = PrefernciaUsuario();

  // text editing controllers
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn(BuildContext context) {
    prefs.usuario = usernameController.text;
    prefs.contrasena = passwordController.text;
    Navigator.of(context).pushNamed(HiddenDrawer.nombre);
  }

  void registerNow(BuildContext context) {
    Navigator.of(context).pushNamed(RegisterPage.nombre);
  }

  @override
  Widget build(BuildContext context) {
    prefs.ultimapagina = LoginPage.nombre;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 0),
          
                // logo
                const CircleAvatar(
                  radius: 100.0,
                  backgroundColor: Colors.grey,
                  backgroundImage: AssetImage('images/edificio.jpg'),
                ),
          
                const SizedBox(height: 20),
          
                // welcome back
                Text(
                  'Welcome!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
          
                const SizedBox(height: 25),
          
                // username textfield
                MyTextField(
                  controller: usernameController,
                  //hintText: 'Username',
                  obscureText: false,
                  maxLines: 1,
                  labelText: "Username",
                  validator: (value){
                    if (value == null||value.isEmpty) {
                      return("El campo esta vacio");
                    }
                    return null;
                  },
                ),
          
                const SizedBox(height: 10),
          
                // password textfield
                MyTextField(
                  controller: passwordController,
                  //hintText: 'Password',
                  obscureText: true,
                  maxLines: 1,
                  labelText: "Password",
                  validator: (value){
                    if (value == null||value.isEmpty) {
                      return("El campo esta vacio");
                    }
                    return null;
                  },
                ),
          
                const SizedBox(height: 10),
          
                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
          
                const SizedBox(height: 15),
          
                // sign in button
                MyButton(
                  title: 'Sign In',
                  onTap: () {
                    if (_formkey.currentState!.validate()){
                      signUserIn(context);
                    }
                    
                  },
                ),
          
                const SizedBox(height: 20),
          
                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
          
                const SizedBox(height: 20),
          
                // google + apple sign in buttons
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google button
                    SquareTile(imagePath: 'assets/images/google.png'),
          
                    SizedBox(width: 25),
          
                    // apple button
                    SquareTile(imagePath: 'assets/images/apple.png')
                  ],
                ),
          
                const SizedBox(height: 20),
          
                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    MyButton2(
                      title: 'Register',
                      onTap: () {
                        registerNow(context);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tienda_ropa/registro.dart';
import 'package:tienda_ropa/inicio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:local_auth/local_auth.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:flutter/material.dart';

//Instanciar para autenticación google
final GoogleSignIn googleSignIn = GoogleSignIn();
final FirebaseAuth auth = FirebaseAuth.instance;

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUp();
}

class _SingUp extends State<SingUp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final Size screenSize =
        MediaQuery.of(context).size; //Obtener el tamaño de la pantalla
    // screenSize.width el ancho de la pantalla del cel
    // screenSize.height el ancho de la pantalla del cel

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        color: Colors.white,
        margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
        // color: Colors.white,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
              margin: const EdgeInsets.only(top: 40),
              child: Image.asset("images/LogoLG.png", height: 150)),
          // ignore: avoid_unnecessary_containers
          /*Container(
            child: const Text(
              'Looks Good',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),*/
          const SizedBox(
            height: 20,
          ),

          Container(
            alignment: Alignment
                .topLeft, //poner el contenido del container a la izquierda
            child: const Text(
              'Iniciar Sesión',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(
            height: 15,
          ),
          Container(
            alignment: Alignment.topLeft,
            child: const Text(
              "Hola! Que bueno verte de nuevo",
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: 'Correo electrónico',
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: passController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        labelText: 'Contraseña',
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
          Container(
              // decoration: BoxDecoration(color: Colors.pink),
              height: 50,
              width: screenSize.width - 40,
              margin: const EdgeInsets.only(
                  top: 30, left: 20, right: 20, bottom: 25),
              child: FilledButton(
                  style: FilledButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 141, 26, 74),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () async {
                    try {
                      Map<String, dynamic> userData = await getUserData(
                          emailController.text, passController.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Inicio()),
                      );
                    } catch (e) {
                      print('Error al obtener los datos del usuario: $e');
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Usuario o Contraseña erronea'),
                            content:
                                Text('Ingresa nuevamente tus credenciales.'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Aceptar'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: const Text("Iniciar Sesión"))),
          Container(
            margin: const EdgeInsets.all(20),
            child: const Text(
              "O usa alguno de tus perfiles sociales",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Container(
              // decoration: BoxDecoration(color: Colors.pink),
              height: 50,
              width: screenSize.width - 40,
              margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                          width: 2.0, color: Color.fromARGB(255, 141, 26, 74)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () async {
                    print('Credenciales botón');
                    signOutGoogle();
                    final UserCredential? userCredential = await googleAuth();
                    print(userCredential);
                    if (userCredential != null) {
                      // El usuario inició sesión con éxito
                      print(
                          'El usuario ${userCredential.user!.displayName} inició sesión con éxito');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Inicio()),
                      );
                    } else {
                      // Hubo un error al iniciar sesión
                      print('Error al iniciar sesión con Google');
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Ocurrió un error'),
                            content: Text('Por favor intenta nuevamente.'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Aceptar'),
                                onPressed: () {
                                  // Aquí puedes tomar alguna acción según lo que haya seleccionado el usuario
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween, //Pone espacios entre los widgets de la fila para llenarla

                      children: [
                        Image.asset("images/google.png"),
                        const Text(
                          'Gmail',
                          style: TextStyle(
                              color: Color.fromARGB(255, 141, 26, 74)),
                        ),
                        Container()
                      ]))),

          Container(
            height: 50,
            width: screenSize.width - 40,
            //color: Colors.blue,
            //alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                      width: 2.0, color: Color.fromARGB(255, 141, 26, 74)),
                ),
              ),
              onPressed: () async {
                bool isAuthenticated = await _authenticate();
                if (isAuthenticated) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Inicio()),
                  );
                }
              },
              child: Text(
                'Iniciar sesión con huella dactilar',
                style: TextStyle(color: Color.fromARGB(255, 141, 26, 74)),
              ),
            ),
          ),

          Container(
            margin:
                const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("¿Aún no tienes cuenta?"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Registro()),
                      );
                    },
                    child: const Text(
                      "Regístrate",
                      style: TextStyle(color: Color.fromARGB(255, 141, 26, 74)),
                    ))
              ],
            ),
          ),
        ]),
      ),
    ));
  }
}

//Cerrar sesión con google
void signOutGoogle() async {
  await googleSignIn.signOut();
  print("Sesión de Google cerrada");
}

//*************************Inciar Sesión con google
Future<UserCredential?> googleAuth() async {
  // Inicia sesión con Google
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;
  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );
  // Autentica con Firebase
  final UserCredential userCredential =
      await auth.signInWithCredential(credential);
  final User? user = userCredential.user;
  // Retorna las credenciales del usuario
  return userCredential;
}

//***********************Iniciar Sesión API
Future<Map<String, dynamic>> getUserData(String email, String password) async {
  var url =
      "https://tienda-ropa-27af7-default-rtdb.firebaseio.com/usuarios.json?orderBy=\"correo\"&equalTo=\"${email}\"";
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var respJs = json.decode(response.body);
    var passResp = respJs.values.first['pass'];
    var tipoResp = respJs.values.first['tipo'];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('tipoUsuario', tipoResp);
    if (password != passResp) {
      throw Exception('Usuario o contraseña incorrectos');
    } else {
      return json.decode(response.body);
    }
  } else {
    throw Exception('Usuario o contraseña incorrectos');
  }
}

//Iniciar sesión con huella
Future<bool> _checkBiometrics() async {
  final LocalAuthentication localAuth = LocalAuthentication();
  bool canCheckBiometrics;
  try {
    canCheckBiometrics = await localAuth.canCheckBiometrics;
  } catch (e) {
    print(e);
    return false;
  }
  return canCheckBiometrics;
}

Future<bool> _authenticate() async {
  final LocalAuthentication localAuth = LocalAuthentication();
  bool authenticated = false;
  try {
    authenticated = await localAuth.authenticate(
      localizedReason: 'Escanea tu huella dactilar para iniciar sesión',
    );
  } catch (e) {
    print(e);
  }
  return authenticated;
}

/*Para acceder a la variable tipoUsuario
SharedPreferences prefs = await SharedPreferences.getInstance();
String tipoAlmacenado = prefs.getString('tipoUsuario');
//SQL LITE*/

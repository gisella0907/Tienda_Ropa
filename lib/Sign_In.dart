
import 'package:flutter/material.dart';

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUp();
}

class _SingUp extends State<SingUp> {
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
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                  margin: const EdgeInsets.all(20),
                  child: Image.asset("images/image1.png")),
              Container(
                child: Text(
                  'Looks Good',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  'Iniciar Sesión',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "Hola! Que bueno verte de nuevo",
                textAlign: TextAlign.left,
              ),
              Text(
                "Correo",
                textAlign: TextAlign.left,
              ),
              Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
                  child: const TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'ejemplo@email.com',
                      // labelText: 'Nama Lengkap',
                      // labelStyle: TextStyle(color: Colors.grey)
                    ),
                  )),
              Text(
                "Contraseña",
                textAlign: TextAlign.left,
              ),
              Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
                  child: TextField(
                    obscureText: passwordVisible,
                    decoration: InputDecoration(
                        hintText: "Contraseña",
                        suffixIcon: IconButton(
                            icon: passwordVisible
                                ? const Icon(
                                    Icons.visibility,
                                    color: Colors.black,
                                  )
                                : const Icon(
                                    Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            })),
                  )),
              Container(
                  // decoration: BoxDecoration(color: Colors.pink),

                  height: 50,
                  width: screenSize.width - 40,
                  margin: const EdgeInsets.only(
                      top: 45, left: 20, right: 20, bottom: 25),
                  child: FilledButton(
                      style: FilledButton.styleFrom(
                          backgroundColor: Color.fromRGBO(140, 24, 68, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {},
                      child: const Text("Sign In"))),
              Container(
                margin: const EdgeInsets.all(20),
                child: Row(children: [
                  Expanded(
                      child: Divider(
                    // indent: 10.0,
                    endIndent:
                        5.0, //separacion entre el final del divider y el elemento que le sigue
                    thickness: 3,
                  )),
                  Text(
                    "O usa alguno de tus perfiles sociales",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Expanded(
                      child: Divider(
                    indent:
                        5.0, //separacion del inicio del divider con el elemento anterior
                    // endIndent: 20.0,
                    thickness: 3, //grosor del Divider
                  )),
                ]),
              ),
              Container(
                  // decoration: BoxDecoration(color: Colors.pink),
                  height: 50,
                  width: screenSize.width - 40,
                  margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                              width: 2.0,
                              color: Color.fromRGBO(140, 24, 68, 1)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {},
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween, //Pone espacios entre los widgets de la fila para llenarla

                          children: [
                            Image.asset("images/google.png"),
                            const Text(
                              'Gmail',
                              style: TextStyle(
                                  color: Color.fromRGBO(140, 24, 68, 1)),
                            ),
                            Container()
                          ]))),
              Container(
                margin: const EdgeInsets.only(
                    left: 20, right: 20, top: 30, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("¿Olvidaste la contraseña?"),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Registrarse",
                          style:
                              TextStyle(color: Color.fromRGBO(140, 24, 68, 1)),
                        ))
                  ],
                ),
              )
            ]),
          )),
    ));
  }
}

/*
Container(
                  margin: const EdgeInsets.all(20),
                  child: const TextField(
                    decoration: InputDecoration(
                      // labelText: "Nama Lengkap",
                      hintText: "Nama Lengkap",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Colors.grey), //<-- SEE HERE
                      ),
                    ),
                  ))
*/

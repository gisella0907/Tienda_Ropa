import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tienda_ropa/iniciar_sesion.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

const List<String> list = <String>[
  'Hombre',
  'Mujer',
  'Prefiero no decirlo',
  'Otro'
];

String dropdownValue = list.first;

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  TextEditingController dateinput = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  final TextEditingController fechaNacController = TextEditingController();
  final TextEditingController sexoController = TextEditingController();
  final TextEditingController emailRController = TextEditingController();
  final TextEditingController passRController = TextEditingController();
  final TextEditingController idController = TextEditingController();

  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  // bool isChecked = false;

  bool isChecked = false;
  void _toggleCheckbox() {
    setState(() {
      isChecked = !isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white, toolbarHeight: 30, elevation: 0),
      body: SingleChildScrollView(
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            alignment: Alignment
                .topLeft, //poner el contenido del container a la izquierda
            child: const Text(
              '     Registrarse',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 0.5, bottom: 20),
          ),
          Container(
              margin: const EdgeInsets.only(left: 30, right: 30, top: 15),
              child: Column(
                children: [
                  Container(
                      child: Column(
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.account_circle_outlined),
                          SizedBox(
                              width:
                                  10), //separacion entre los elementos de row
                          Text(
                            "Nombres",
                            style: TextStyle(
                                color: Color.fromARGB(255, 141, 26, 74)),
                          )
                        ],
                      ),
                      TextField(
                        controller: nombreController,
                        decoration: InputDecoration(hintText: 'ejemplo'),
                        //  obscureText: false,
                      )
                    ],
                  )),
                  Container(
                      child: Column(
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.account_circle_outlined),
                          SizedBox(
                              width:
                                  10), //separacion entre los elementos de row
                          Text(
                            "Número de Identificación",
                            style: TextStyle(
                                color: Color.fromARGB(255, 141, 26, 74)),
                          )
                        ],
                      ),
                      TextField(
                        controller: idController,
                        decoration: InputDecoration(hintText: '1012332456'),
                        //  obscureText: false,
                      )
                    ],
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      child: Column(
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.date_range),
                          SizedBox(
                              width:
                                  10), //separacion entre los elementos de row
                          Text(
                            "Fecha de Nacimiento",
                            style: TextStyle(
                                color: Color.fromARGB(255, 141, 26, 74)),
                          )
                        ],
                      ),
                      TextField(
                        controller:
                            dateinput, //editing controller of this TextField
                        decoration: const InputDecoration(
                            //icon of text field
                            hintText: "Enter Date" //label text of field
                            ),
                        readOnly:
                            true, //set it true, so that user will not able to edit text
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(
                                  2000), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            print(
                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(
                                formattedDate); //formatted date output using intl package =>  2021-03-16
                            //you can implement different kind of Date Format here according to your requirement

                            setState(() {
                              dateinput.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                      )
                    ],
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  // ignore: avoid_unnecessary_containers
                  Container(
                      child: Column(
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.transgender),
                          SizedBox(
                              width:
                                  10), //separacion entre los elementos de row
                          Text(
                            "Sexo",
                            style: TextStyle(
                                color: Color.fromARGB(255, 141, 26, 74)),
                          )
                        ],
                      ),
                      const DropdownButtonExample(),
                    ],
                  )),
                  const SizedBox(height: 20),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      child: Column(
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.email),
                          SizedBox(
                              width:
                                  10), //separacion entre los elementos de row
                          Text(
                            "Correo electrónico",
                            style: TextStyle(
                                color: Color.fromARGB(255, 141, 26, 74)),
                          )
                        ],
                      ),
                      TextField(
                        controller: emailRController,
                        decoration:
                            InputDecoration(hintText: 'ejemplo@email.com'),
                        //  obscureText: false,
                      )
                    ],
                  )),
                  Container(
                      child: Column(
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.key),
                          SizedBox(
                              width:
                                  10), //separacion entre los elementos de row
                          Text(
                            "Contraseña",
                            style: TextStyle(
                                color: Color.fromARGB(255, 141, 26, 74)),
                          )
                        ],
                      ),
                      TextField(
                        controller: passRController,
                        obscureText: passwordVisible,
                        decoration: InputDecoration(
                            hintText: "Password",
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
                      )
                    ],
                  )),
                  const SizedBox(height: 20),
                  Container(
                    child: Row(children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          _toggleCheckbox();
                        },
                        activeColor: const Color.fromARGB(255, 141, 26, 74),
                      ),
                      Expanded(
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Estoy de acuerdo con los ",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 187, 177, 176),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "Términos de servicio y Políticas de Privacidad",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 141, 26, 74),
                                  fontSize: 16,
                                  // decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
                  ),

                  Container(
                    height: 50,
                    width: screenSize.width - 40,
                    margin: const EdgeInsets.only(top: 45, left: 20, right: 20),
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(
                            140, 24, 68, 1), // Cambiar el color de fondo aquí
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () async {
                        try {
                          print(dropdownValue);
                          Map<String, dynamic> userData = await getUserRegistro(
                              nombreController.text,
                              dateinput.text,
                              dropdownValue,
                              idController.text,
                              emailRController.text,
                              passRController.text);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SingUp()),
                          );
                        } catch (e) {
                          print('Error al crear el usuario: $e');
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Error al crear el usuario: '),
                                content: Text('$e'),
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
                      child: const Text("Continuar "),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(
                        left: 20, right: 20, top: 30, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("¿Ya tienes una cuenta?"),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SingUp()),
                              );
                            },
                            child: const Text(
                              "Iniciar Sesión",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 141, 26, 74)),
                            ))
                      ],
                    ),
                  )
                ],
              )),
        ])),
      ),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  //dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double
          .infinity, // Agrega esta línea para hacer que el contenedor ocupe todo el ancho de pantalla.
      child: DropdownButton<String>(
        isExpanded: true, // Establece esta propiedad en true
        value: dropdownValue,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Color.fromARGB(255, 141, 26, 74)),
        underline: Container(
          height: 1,
          color: Colors.grey,
        ),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

//***********************Registro API
Future<Map<String, dynamic>> getUserRegistro(String nombre, String fechaNac,
    String sexo, String documentoId, String email, String password) async {
  // Formateador para la fecha de entrada
  var formatoEntrada = DateFormat('yyyy-MM-dd');
  // Formateador para la fecha de salida
  var formatoSalida = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
  // Parsear la fecha de entrada
  var fechaEntrada = formatoEntrada.parse(fechaNac);
  // Formatear la fecha de salida
  var fechaSalida = formatoSalida.format(fechaEntrada);
  //Validar que el usuario no exista
  var url =
      "https://tienda-ropa-27af7-default-rtdb.firebaseio.com/usuarios.json?orderBy=\"correo\"&equalTo=\"${email}\"";
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var respJs = json.decode(response.body);
    if (respJs is Map && respJs.isEmpty) {
      //Crear usuario
      var urlRegistro = Uri.parse(
          'https://tienda-ropa-27af7-default-rtdb.firebaseio.com/usuarios.json');
      final respRegistro = await http.post(urlRegistro,
          body: json.encode({
            "correo": email,
            "documentoId": documentoId,
            "fechaNacimiento": fechaSalida,
            "nombres": nombre,
            "pass": password,
            "sexo": sexo,
            "tipo": "cliente"
          }),
          headers: {'Content-Type': 'application/json'});
      if (respRegistro.statusCode == 200) {
        return json.decode(respRegistro.body);
      } else {
        throw Exception('Ha ocurrido un error, por favor intente de nuevo');
      }
    } else {
      var respJs = json.decode(response.body);
      var emailResp = respJs.values.first['correo'];
      var IdResp = respJs.values.first['documentoId'];
      /*SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('tipoUsuario', tipoResp);*/
      if (email == emailResp || documentoId == IdResp) {
        throw Exception('El usuario ha sido registrado antes');
      } else {
        return json.decode(respJs.body);
      }
    }
  } else {
    throw Exception('Ha ocurrido un error, por favor intente de nuevo');
  }
}

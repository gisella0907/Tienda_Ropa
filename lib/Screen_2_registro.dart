import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const List<String> list = <String>[
  'Hombre',
  'Mujer',
  'Prefiero no decirlo',
  'Otro'
];

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  TextEditingController dateinput = TextEditingController();
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
        title: const Text(
          "Registrarse",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                                color: Color.fromRGBO(140, 24, 68, 1)),
                          )
                        ],
                      ),
                      const TextField(
                        decoration: InputDecoration(hintText: 'ejemplo'),
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
                                color: Color.fromRGBO(140, 24, 68, 1)),
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
                                color: Color.fromRGBO(140, 24, 68, 1)),
                          )
                        ],
                      ),
                      const DropdownButtonExample(),
                    ],
                  )),
                  const SizedBox(height: 20),
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
                                color: Color.fromRGBO(140, 24, 68, 1)),
                          )
                        ],
                      ),
                      TextField(
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
                                color: Color.fromRGBO(140, 24, 68, 1)),
                          )
                        ],
                      ),
                      const TextField(
                        decoration:
                            InputDecoration(hintText: 'ejemplo@email.com'),
                        //  obscureText: false,
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
                        activeColor: const Color.fromRGBO(140, 24, 68, 1),
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
                                  color: Color.fromRGBO(140, 24, 68, 1),
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
                      onPressed: () {},
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
                            onPressed: () {},
                            child: const Text(
                              "Iniciar Sesión",
                              style: TextStyle(
                                  color: Color.fromRGBO(140, 24, 68, 1)),
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
  String dropdownValue = list.first;

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
        style: const TextStyle(color: Color.fromRGBO(140, 24, 68, 1)),
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
/*
ElevatedButton(
  onPressed: () {},
  style: ElevatedButton.styleFrom(
    primary: Colors.black, // Background color
    onPrimary: Colors.amber, // Text Color (Foreground color)
  ),
  child: const Text(
    'Elevated Button',
    style: TextStyle(fontSize: 40),
  ),
)
*/
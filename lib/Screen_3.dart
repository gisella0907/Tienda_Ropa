//mateapp
import 'package:flutter/material.dart';

class DraweApp extends StatefulWidget {
  const DraweApp({super.key});

  @override
  State<DraweApp> createState() => _DraweAppState();
}

class _DraweAppState extends State<DraweApp> {
  var _isSelected = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            children: [
              Container(
                height: screenSize.height / 3, //TAMAÑO DRAWERHEADER
                child: DrawerHeader(
                  decoration: const BoxDecoration(),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: IconButton(
                            onPressed: () => {Navigator.of(context).pop()},
                            icon: const Icon(
                              Icons.cancel_outlined,
                              color: Color.fromRGBO(251, 102, 102, 1),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: const Image(
                            image: AssetImage('images/profile.png'),
                            height: 120,
                            width: 120,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: const Text(
                            "johanna@company.com",
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      ]),
                ),
              ),
              Expanded(
                  child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.home,
                      color: _isSelected[0]
                          ? Color.fromRGBO(251, 102, 102, 1)
                          : Colors.grey,
                    ),
                    title: const Text('Inicio'),
                    // tileColor: Colors.amber,
                    tileColor:
                        _isSelected[0] ? Color.fromARGB(26, 244, 4, 4) : null,
                    onTap: () {
                      setState(() => _isSelected[0] = !_isSelected[0]);
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.library_books_rounded,
                      color: _isSelected[1]
                          ? Color.fromRGBO(251, 102, 102, 1)
                          : Colors.grey,
                    ),
                    title: const Text('Productos'),
                    tileColor:
                        _isSelected[1] ? Color.fromARGB(26, 244, 4, 4) : null,
                    onTap: () {
                      setState(() => _isSelected[1] = !_isSelected[1]);
                    },
                  ),
                  ListTile(
                    title: const Text('Perfil'),
                    leading: Icon(
                      Icons.switch_account_rounded,
                      color: _isSelected[2]
                          ? Color.fromRGBO(251, 102, 102, 1)
                          : Colors.grey,
                    ),
                    onTap: () {
                      setState(() => _isSelected[2] = !_isSelected[2]);
                    },
                    tileColor:
                        _isSelected[2] ? Color.fromARGB(26, 244, 4, 4) : null,
                  ),
                  Spacer(),
                  ListTile(
                    leading: Icon(
                      Icons.settings,
                      color: _isSelected[3]
                          ? Color.fromRGBO(251, 102, 102, 1)
                          : Colors.grey,
                    ),
                    title: const Text('Administrar'),
                    onTap: () {
                      setState(() => _isSelected[3] = !_isSelected[3]);
                    },
                    tileColor:
                        _isSelected[3] ? Color.fromARGB(26, 244, 4, 4) : null,
                  ),
                ],
              )),
            ],
          ),
        ));
  }
}

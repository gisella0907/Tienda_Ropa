//mateapp
import 'package:flutter/material.dart';

class DraweApp extends StatefulWidget {
  const DraweApp({super.key});

  @override
  State<DraweApp> createState() => _DraweAppState();
}

class _DraweAppState extends State<DraweApp> {
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
                            onPressed: () => {},
                            icon: const Icon(Icons.cancel_outlined),
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
                child: ListView(
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.home,
                        color: Colors.grey,
                      ),
                      title: const Text('Inicio'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.library_books_rounded,
                        color: Colors.grey,
                      ),
                      title: const Text('Productos'),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const Text('Perfil'),
                      leading: const Icon(
                        Icons.switch_account_rounded,
                        color: Colors.grey,
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.settings,
                        color: Colors.grey,
                      ),
                      title: const Text('Administrar'),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

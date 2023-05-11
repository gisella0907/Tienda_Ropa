import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
//import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Uint8List? exportedImage;

  SignatureController controller = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
    exportBackgroundColor: Color.fromARGB(255, 161, 149, 154),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Finalizar Compra"),
        backgroundColor: Color.fromARGB(255, 141, 26, 74),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text:
                        ("Para continuar con la compra, por favor ingrese su firma:\n"),
                    style: TextStyle(color: Colors.black, fontSize: 13),
                  ),
                ],
              ),
            ),
            Signature(
              controller: controller,
              height: 250,
              width: MediaQuery.of(context).size.width / 1.05,
              backgroundColor: Colors.lightBlue[100]!,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () async {
                        exportedImage = await controller.toPngBytes();

                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 141, 26, 74), // background
                        onPrimary: Colors.white, // foreground
                      ),
                      child: const Text(
                        "Guardar Firma",
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        controller.clear();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 141, 26, 74), // background
                        onPrimary: Colors.white, // foreground
                      ),
                      child: const Text(
                        "Limpiar firma",
                      ),
                    )),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            if (exportedImage != null)
              Image.memory(
                exportedImage!,
                width: 300,
                height: 250,
              ),
            if (exportedImage != null)
              ElevatedButton(
                onPressed: () {
                  exportedImage = null;
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 141, 26, 74), // background
                  onPrimary: Colors.white, // foreground
                ),
                child: const Text("Exportar"),
              ),
          ],
        ),
      ),
    );
  }
}

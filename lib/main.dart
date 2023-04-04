import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyWidget();
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final TextEditingController _altura = TextEditingController();
  final TextEditingController _peso = TextEditingController();
  String res = "";

  calcularIMC() {
    double peso, altura;
    peso = double.parse(_peso.text);
    altura = double.parse(_altura.text) / 100;

    double imc = peso / (altura * altura);
    setState(() {
      res = imc.toStringAsPrecision(4);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("IMC")),
      body: Column(
        children: [
          TextFormField(
              controller: _altura,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text("Altura"),
              )),
          TextFormField(
              controller: _peso,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text("Peso"),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: ElevatedButton(
                onPressed: calcularIMC, child: const Text("Calcular")),
          ),
          Text(res)
        ],
      ),
    );
  }
}

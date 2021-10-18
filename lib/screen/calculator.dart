import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';

final txtEntrada = TextEditingController();
final txtResultado = TextEditingController();

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  void initState() {
    txtEntrada.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    txtEntrada.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calculator",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
        ),
        backgroundColor: Colors.amber[700],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
            child: TextField(
              textInputAction: TextInputAction.none,
              keyboardType: TextInputType.none,
              decoration: const InputDecoration.collapsed(
                  hintText: "0",
                  hintStyle: TextStyle(
                    fontSize: 40,
                    fontFamily: 'RobotoMono',
                  )),
              style: const TextStyle(
                fontSize: 40,
                fontFamily: 'RobotoMono',
              ),
              textAlign: TextAlign.right,
              controller: txtEntrada,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "Resultado",
                ),
                textInputAction: TextInputAction.none,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right,
                controller: txtResultado,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
            child: GridView.count(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20),
              crossAxisCount: 4,
              children: [
                btnAC("AC", const Color(0xFFF5F7F9)),
                boton("%", const Color(0xFFF5F7F9)),
                boton("/", const Color(0xFFF5F7F9)),
                btnBorrar(const Color(0xFFF5F7F9)),
                //
                boton("7", Colors.white),
                boton("8", Colors.white),
                boton("9", Colors.white),
                boton("*", const Color(0xFFF5F7F9)),
                //
                boton("4", Colors.white),
                boton("5", Colors.white),
                boton("6", Colors.white),
                boton("-", const Color(0xFFF5F7F9)),
                //
                boton("1", Colors.white),
                boton("2", Colors.white),
                boton("3", Colors.white),
                boton("+", const Color(0xFFF5F7F9)),
                //
                Container(),
                boton("0", Colors.white),
                boton(".", Colors.white),
                btnIgual(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget boton(btnText, Color btnColor) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(btnColor),
          shape:
              MaterialStateProperty.all<OutlinedBorder>(const CircleBorder()),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.all(18)),
          shadowColor: MaterialStateProperty.all<Color>(Colors.black),
        ),
        child: Text(
          btnText,
          style: const TextStyle(
              fontSize: 28, color: Colors.black, fontFamily: "RobotoMono"),
        ),
        onPressed: () {
          setState(() {
            txtEntrada.text = txtEntrada.text + btnText;
          });
        },
      ),
    );
  }

  Widget btnAC(btnText, Color btnColor) {
    return Container(
        padding: const EdgeInsets.only(top: 10),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(btnColor),
            shape:
                MaterialStateProperty.all<OutlinedBorder>(const CircleBorder()),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.all(18)),
            shadowColor: MaterialStateProperty.all<Color>(Colors.black),
          ),
          child: Text(
            btnText,
            style: const TextStyle(
                color: Colors.black, fontSize: 28, fontFamily: "RobotoMono"),
          ),
          onPressed: () {
            setState(() {
              txtEntrada.text = "";
              txtResultado.text = "";
            });
          },
        ));
  }

  Widget btnBorrar(Color btnColor) {
    return Container(
        padding: const EdgeInsets.only(top: 10),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(btnColor),
            shape:
                MaterialStateProperty.all<OutlinedBorder>(const CircleBorder()),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.all(18)),
            shadowColor: MaterialStateProperty.all<Color>(Colors.black),
          ),
          child: const Icon(
            Icons.backspace,
            size: 35,
            color: Colors.blueGrey,
          ),
          onPressed: () {
            setState(() {
              txtEntrada.text = (txtEntrada.text.isNotEmpty)
                  ? (txtEntrada.text.substring(0, txtEntrada.text.length - 1))
                  : "";
            });
          },
        ));
  }

  Widget btnIgual() {
    return Container(
        padding: const EdgeInsets.only(top: 10),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),
            shape:
                MaterialStateProperty.all<OutlinedBorder>(const CircleBorder()),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.all(18)),
            shadowColor: MaterialStateProperty.all<Color>(Colors.black),
          ),
          child: const Text(
            "=",
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
          onPressed: () {
            Parser p = new Parser();
            ContextModel ctxtm = new ContextModel();
            Expression exp = p.parse(txtEntrada.text);

            setState(() {
              txtResultado.text =
                  exp.evaluate(EvaluationType.REAL, ctxtm).toString();
            });
          },
        ));
  }
}

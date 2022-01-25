import 'package:calculator_flutter/screen/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Calculator2 extends StatelessWidget {
  Calculator2({Key? key}) : super(key: key);

  final Controller c = Get.put(Controller());

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
            child: Container(
                color: Colors.white,
                child: Obx(() => Text("${c.count}",
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontSize: 42, fontWeight: FontWeight.bold)))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
            child: Container(
                color: Colors.white,
                child: Obx(() => Text("${c.resultado}",
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontSize: 42, fontWeight: FontWeight.bold)))),
          ),
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
            c.boton(btnText);
          }),
    );
  }

  Widget btnAC(btnText, Color btnColor) {
    return Container(
        padding: const EdgeInsets.only(top: 10),
        child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(btnColor),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                  const CircleBorder()),
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
              c.btnAC();
            }));
  }

  Widget btnBorrar(Color btnColor) {
    return Container(
        padding: const EdgeInsets.only(top: 10),
        child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(btnColor),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                  const CircleBorder()),
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
              c.btnBorrar();
            }));
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
            c.btnIgual();
          },
        ));
  }
}

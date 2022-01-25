import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class Controller extends GetxController {
  RxString count = "0".obs;
  RxString resultado = "Resultado".obs;

  void boton(btnText) {
    count.value = count.value + btnText;
  }

  void btnAC() {
    count.value = "0";
    resultado.value = "Resultado";
  }

  void btnBorrar() {
    count.value = (count.value.isNotEmpty)
        ? (count.substring(0, count.value.length - 1))
        : "";
  }

  void btnIgual() {
    Parser p = new Parser();
    ContextModel ctxtm = new ContextModel();
    Expression exp = p.parse(count.value);

    resultado.value = exp.evaluate(EvaluationType.REAL, ctxtm).toString();
  }
}

import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

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
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 20, right: 10),
              child: Text(
                "0",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 60),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, right: 10),
              child: Text(
                "Result",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

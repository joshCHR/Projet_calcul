import 'package:flutter/material.dart';

class Calcul extends StatefulWidget {
  const Calcul({Key? key}) : super(key: key);

  @override
  State<Calcul> createState() => _CalculState();
}

class _CalculState extends State<Calcul> {
  TextEditingController txtNbr1 = TextEditingController();
  TextEditingController txtNbr2 = TextEditingController();
  TextEditingController txtReponse = TextEditingController();

  String operation = "+";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculatrice"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: txtNbr1,
              decoration: InputDecoration(
                  hintText: "Nombre 1", labelText: "Entrez le premier nombre"),
              // onChanged: (text) {
              //   setState(() {
              //     n1 = double.parse(text);
              //   });
              // },
            ),
            TextField(
              controller: txtNbr2,
              decoration: InputDecoration(
                  hintText: "Nombre 2", labelText: "Entrez le premier nombre"),
              // onChanged: (text) {
              //   setState(() {
              //     n2 = double.parse(text);
              //   });
              // },
            ),
            DropdownButton(
              value: operation,
              onChanged: (value) {
                setState(() {
                  operation = value.toString();
                });
              },
              items: [
                DropdownMenuItem(value: "+", child: Text("+")),
                DropdownMenuItem(value: "-", child: Text("-")),
                DropdownMenuItem(value: "*", child: Text("*")),
                DropdownMenuItem(value: "/", child: Text("/")),
              ],
            ),
            ElevatedButton(
              onPressed: (() {
                calculer();
              }),
              child: Text(
                "CALCULER",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Reponse = " + txtReponse.text,
              style: TextStyle(fontSize: 40, color: Colors.green),
            )
          ],
        ),
      ),
    );
  }

  //String
  calculer() {
    double n1 = double.parse(txtNbr1.text);
    double n2 = double.parse(txtNbr2.text);
    double resultat = 0;
    switch (operation) {
      case "+":
        resultat = n1 + n2;
        break;
      case "-":
        resultat = n1 - n2;
        break;
      case "*":
        resultat = n1 * n2;
        break;
      case "/":
        resultat = n1 / n2;
        break;
    }
    setState(() {
      txtReponse.text = "$resultat";
    });
    //return resultat.toString();
  }
}

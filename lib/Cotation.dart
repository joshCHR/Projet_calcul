import 'package:flutter/material.dart';

class Cotation extends StatefulWidget {
  @override
  State<Cotation> createState() => _CotationState();
}

class _CotationState extends State<Cotation> {
  @override
  TextEditingController txtNoms = TextEditingController();
  TextEditingController txtClasse = TextEditingController();
  TextEditingController txtPtMath = TextEditingController();
  TextEditingController txtPtFrancais = TextEditingController();
  TextEditingController txtPtAnglais = TextEditingController();
  TextEditingController txtPtAlgo = TextEditingController();
  TextEditingController txtResultat = TextEditingController();
  TextEditingController txtMention = TextEditingController();
  TextEditingController txtMessage = TextEditingController();

  calculer() {
    String nom = txtNoms.text;
    String classe = txtClasse.text;
    double ptMath = double.parse(txtPtMath.text);
    double ptFrancais = double.parse(txtPtMath.text);
    double ptAnglais = double.parse(txtPtMath.text);
    double ptAlgo = double.parse(txtPtMath.text);
    String mension = "";
    String message = "";

    double result = ((ptMath + ptFrancais + ptAnglais + ptAlgo) / 200) * 100;

    if (result > 10 && result < 50) {
      mension = "A";
    } else if (result >= 50 && result < 70) {
      mension = "S";
    } else if (result >= 70 && result < 80) {
      mension = "D";
    } else if (result >= 80 && result < 100) {
      mension = "GD";
    } else {
      mension = "NAFF";
    }

    setState(() {
      txtResultat.text = "$result";
      txtMention.text = "" + mension + " ";
    });
    txtMessage.text = "Bonjour  " +
        txtNoms.text +
        "  Vous avez eu " +
        txtResultat.text +
        " en " +
        txtClasse.text +
        "  et votre mension est " +
        txtMention.text +
        " ";
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "COTATION",
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        children: [
          Row(
            children: [
              Text("   Nom   :"),
              Container(
                  height: 60,
                  width: 350,
                  child: TextField(
                    controller: txtNoms,
                    decoration:
                        InputDecoration(labelText: "  Entrez votre nom"),
                  )),
            ],
          ),
          Row(
            children: [
              Text("   Classe :"),
              Container(
                  height: 60,
                  width: 350,
                  child: TextField(
                    controller: txtClasse,
                    decoration:
                        InputDecoration(labelText: "  Entrez votre classe"),
                  )),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text("     MATH /50"),
          Container(
              //height: 60,
              //width: 50,
              child: TextField(
            controller: txtPtMath,
            decoration: InputDecoration(labelText: ""),
          )),
          SizedBox(
            height: 10,
          ),
          Text("     FRANCAIS /60"),
          Container(
              //height: 60,
              //width: 50,
              child: TextField(
            controller: txtPtFrancais,
            decoration: InputDecoration(labelText: ""),
          )),
          SizedBox(
            height: 10,
          ),
          Text("     ANGLAIS /40"),
          Container(
              //height: 60,
              //width: 50,
              child: TextField(
            controller: txtPtAnglais,
            decoration: InputDecoration(labelText: ""),
          )),
          SizedBox(
            height: 10,
          ),
          Text("     ALGORITHMIQUE /50"),
          Container(
              //height: 60,
              //width: 50,
              child: TextField(
            controller: txtPtAlgo,
            decoration: InputDecoration(labelText: ""),
          )),
          SizedBox(
            height: 10,
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
            "" + txtMessage.text + " ",
            style: TextStyle(color: Colors.green, fontSize: 20),
          ),
        ],
      ),
    );
  }
}

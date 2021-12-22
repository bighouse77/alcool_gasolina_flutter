// ignore_for_file: file_names, prefer_const_constructors, deprecated_member_use, unused_field, prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _contollerAlcool = TextEditingController();
  TextEditingController _contollerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular() {
    // tryParse = converte string para double, caso não covnerta, ele retorna nulo!
    double? precoAlcool = double.tryParse(_contollerAlcool.text);
    double? precoGasolina = double.tryParse(_contollerGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoResultado =
            "Número inválido, digite números maiores que zeros e utilizando (.)";
      });
    } else {
      /*
        - Se o preço do álcool dividido pelo preço da gasolina for >= a 0.7, é 
        melhor abastecer com gasolina. Caso contrário, é recomendável utilizar o
        álcool.
      */
      var calculo = precoAlcool / precoGasolina;
      if (calculo >= 0.7) {
        setState(() {
          _textoResultado = "Melhor abastecer com gasolina!";
        });
      } else {
        setState(() {
          _textoResultado = "Melhor abastecer com álcool!";
        });
      }

      _limparCampos();
    }
  }

  void _limparCampos() {
    _contollerGasolina.text = "";
    _contollerAlcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
      ),
      body: Container(
        // scroll !!!!
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            // responsavel por deixar o botão "esticado" pegando a area toda
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Image.asset("images/logo.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "Saiba qual a melhor opção para abastecimento do seu carro",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Preço Álcool, ex: 1.59",
                ),
                style: TextStyle(fontSize: 18),
                keyboardType: TextInputType.number,
                controller: _contollerAlcool,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Preço Gasolina, ex: 3.15",
                ),
                style: TextStyle(fontSize: 18),
                keyboardType: TextInputType.number,
                controller: _contollerGasolina,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: RaisedButton(
                    padding: EdgeInsets.all(15),
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text(
                      "Calcular",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: _calcular),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  _textoResultado,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: file_names, prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables, prefer_final_fields, avoid_print
import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  const CampoTexto({Key? key}) : super(key: key);

  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  //variável que ira controlar, capturar o que for escrito
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de dados"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(32),
            // textArea == TextField
            child: TextField(
              decoration: InputDecoration(
                labelText: "Digite o valor",
              ),
              keyboardType: TextInputType.number,
              // limitar o tamanho máximo de caracter a ser digitado
              //maxLength: 2,
              //maxLengthEnforced: true,
              /*style: TextStyle(
                fontSize: 25,
                color: Colors.green
              ),*/
              // para senhas!
              //obscureText: true
              /* 
              onChanged: (String texto) {
                print("valor digitado: " + texto);
              },
              */
              onSubmitted: (String texto) {
                print("valor digitado:" + texto);
              },
              //criando o controller
              controller: _textEditingController,
            ),
          ),
          RaisedButton(
            child: Text("Salvar"),
            color: Colors.lightGreen,
            onPressed: () {
              print("valor digitado:" + _textEditingController.text);
            },
          )
        ],
      ),
    );
  }
}

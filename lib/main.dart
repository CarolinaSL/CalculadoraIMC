import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Home(), // tela inicial 
  )); // repassamos um widget
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC" ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[ // adiciona botoes e acoes na appbarra
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: (){}
            ) 
        ],
      ),
      backgroundColor: Colors.deepPurple[100] ,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(Icons.person, size: 120.0, color: Colors.deepPurple),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.deepPurple),
              labelText: "Peso (Kg)"
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.deepPurple, fontSize: 25.0),
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.deepPurple),
              labelText: "Altura (cm)"
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.deepPurple, fontSize: 25.0),
          )
        ],
      ),
    );
  }
}
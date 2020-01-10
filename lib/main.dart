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

  // controladores para captar dados do formulario
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String _info = " Informe seus dados!";
  // validacao
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetFields(){
    
      weightController.text = "";
      heightController.text = "";
    setState(() {
      _info = "Informe seus dados!";
      _formKey = GlobalKey<FormState>();
    });
    
  }
  void _calculate(){
    setState(() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text)/100;
    double imc = weight / (height * height);
    if(imc < 18.6) _info = "IMC = (${imc.toStringAsPrecision(3)} Abaixo do peso!";
    else if(imc>= 18.6 && imc < 24.9) _info = "IMC = ${imc.toStringAsPrecision(3)} Peso Ideal!";
    else if(imc >= 24.9 && imc < 29.9) _info = "IMC = ${imc.toStringAsPrecision(3)} Levemente Acima do peso!";
    else if(imc >= 29.9 && imc < 34.9) _info = " IMC = ${imc.toStringAsPrecision(3)} Obesidade Grau I";
    else if(imc >= 34.9 && imc < 39.9) _info = "IMC = ${imc.toStringAsPrecision(3)} Obesidade Grau II";
    else if(imc >= 39.9) _info = "IMC = ${imc.toStringAsPrecision(3)} Obesidade Grau III";

    });
  }
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
            onPressed: (){
              _resetFields();
            }
            ) 
        ],
      ),
      backgroundColor: Colors.deepPurple[100] ,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.person, size: 120.0, color: Colors.deepPurple),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.deepPurple),
                  labelText: "Peso (Kg)"
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.deepPurple, fontSize: 25.0),
                controller: weightController,
                validator: (value){
                  if(value.isEmpty) return "Insira seu peso!"; 
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.deepPurple),
                  labelText: "Altura (cm)"
                  ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.deepPurple, fontSize: 25.0),
                controller: heightController,
                validator: (value){
                  if(value.isEmpty) {return "Insira sua altura!";}
                },
              ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: (){
                    if(_formKey.currentState.validate()){
                      _calculate();
                    }
                  },
                  child: Text(
                    "Calcular IMC",
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  ),
                  color : Colors.deepPurple,
                )  ,
              ),
            ),
            Text(
              _info,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.deepPurple, fontSize: 25.0,
              ),
            )
        ],
      ),
        ),
      )
    );
  }
}
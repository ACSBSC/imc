import 'IMCModelo.dart';
import 'ResultadoIMC.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PantallaIMCStateful extends StatefulWidget {
  @override
  _PantallaIMCState createState() => _PantallaIMCState();
}

class _PantallaIMCState extends State<PantallaIMCStateful> {
  double _alturaUsuario = 100.0;
  double _pesoUsuario = 40.0;
  double _imc = 0;

  IMCModelo _IMCModelo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 200,
                width: 200,
                child: SvgPicture.asset("assets/images/joke.svg", fit: BoxFit.contain,),
              ),
              SizedBox(
                height: 8,
              ),
              Text("IMC", style: TextStyle(color: Colors.lightGreen, fontSize: 34, fontWeight: FontWeight.w700),),
              Text("Nos preocupa tu salud", style: TextStyle(color: Colors.lightBlue, fontSize: 15, fontWeight: FontWeight.w400),),
              SizedBox(
                height: 32,
              ),

    Text("Altura (cm)", style: TextStyle(color: Colors.lightBlue, fontSize: 24, fontWeight: FontWeight.w400),),

    Container(
    padding: EdgeInsets.only(left: 16, right: 16),
    child: Slider(
    min: 80.0,
    max: 250.0,
    onChanged: (height){
    setState(() {
    _alturaUsuario = height;
    });
    },
    value: _alturaUsuario,
    divisions: 100,
    activeColor: Colors.lime,
    label: "$_alturaUsuario",
    ),
    ),

    Text("$_alturaUsuario cm", style: TextStyle(color: Colors.lightGreen, fontSize: 18, fontWeight: FontWeight.w900),),

    SizedBox(height: 24,),

    Text("Peso (kg)", style: TextStyle(color: Colors.lightBlue, fontSize: 24, fontWeight: FontWeight.w400),),

    Container(
    padding: EdgeInsets.only(left: 16, right: 16),
    child: Slider(
    min: 30.0,
    max: 120.0,
    onChanged: (height){
    setState(() {
    _pesoUsuario = height;
    });
    },
    value: _pesoUsuario,
    divisions: 100,
    activeColor: Colors.lime,
    label: "$_pesoUsuario",
    ),
    ),

    Text("$_pesoUsuario kg", style: TextStyle(color: Colors.lightGreen, fontSize: 18, fontWeight: FontWeight.w900),),

    SizedBox(height: 16,),

    Container(
    child: FlatButton.icon(
    onPressed: (){
    setState(() {
      _imc = _pesoUsuario / ((_alturaUsuario / 100) * (_alturaUsuario / 100));

      if (_imc >= 18.5 && _imc <= 25) {
        _IMCModelo = IMCModelo(
            imc: _imc, esNormal: true, resultado: "Está en buena forma");
      } else if (_imc < 18.5) {
        _IMCModelo = IMCModelo(
            imc: _imc, esNormal: false, resultado: "Esta bajo de peso");
      } else if (_imc > 25 && _imc <= 30) {
        _IMCModelo = IMCModelo(
            imc: _imc, esNormal: false, resultado: "Tiene Sobrepeso");
      } else {
        _IMCModelo = IMCModelo(imc: _imc,
            esNormal: false,
            resultado: "Tiene algún tipo de problema de peso");
      }
    });

//INCLUYE_EL_CALCULO DEL IMC

    Navigator.push(context, MaterialPageRoute(
    builder: (context) => ResultadoIMC(imcModelo: _IMCModelo,)
    ));
    },
    icon: Icon(Icons.favorite, color: Colors.white,),
    label: Text("Mide tu IMC"),
    textColor: Colors.white,
    color: Colors.lime,

    ),
    width: double.infinity,
    padding: EdgeInsets.only(left: 16, right: 16),
    )

    ],
    ),
    ),
    ),
    );
    }
  }
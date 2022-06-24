// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

import 'my-home-page-controller.dart';
import 'realme.dart';
import 'sing-up.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controllerHome = MyHomePageController();
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height_var = MediaQuery.of(context).size.height;
    double width_var = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 24, 24, 24),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: ListView(
            children: [
              Container(
                height: height_var / 5,
                margin: EdgeInsets.only(top: height_var / 50),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.purple,
                    width: 6,
                  ),
                ),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/celular.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextFormField(
                    controller: _controllerHome.controllerEmail,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Email'),
                    validator: Validatorless.multiple([
                      Validatorless.required('E-mail Obrigatório'),
                      Validatorless.email('E-mail Inválido')
                    ]),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(top: height_var / 60),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    controller: _controllerHome.controllerNome,
                    validator: Validatorless.required('Senha Obrigatória'),
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: 'Senha'),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: height_var / 30),
                height: 50,
                width: width_var,
                child: RaisedButton(
                  color: Colors.purple,
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  ),
                  onPressed: () {
                    var formValid = _formKey.currentState?.validate() ?? false;
                    if (formValid) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Realme(),
                        ),
                      );
                    } else {
                      print('Email invalido');
                    }
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: height_var / 70),
                height: 50,
                width: width_var,
                child: RaisedButton(
                    color: Colors.purple,
                    child: Text(
                      'Cadastro',
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SingUp(),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:atividade_fb/screens/realme-page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

import '../controllers/my-home-page-service.dart';
import '../controllers/my-sing-up-page-controller.dart';

class SingIn extends StatefulWidget {
  SingIn({Key? key}) : super(key: key);

  @override
  State<SingIn> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  final _controllerHome = MyHomePageController();

  @override
  void initState() {
    print('iniciei my home page');
    super.initState();
  }

  //Método disparado ao sair do widget
  @override
  void dispose() {
    print('fechei a home page');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height_var = MediaQuery.of(context).size.height;
    double width_var = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 24, 24, 24),
      body: Form(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: SizedBox(
            height: height_var,
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
                  height: 20,
                ),
                Center(
                  child: Text(
                    'Cadastro',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 70,
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
                      controller: _controllerHome.controllerNome,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Nome'),
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
                      controller: _controllerHome.controllerModelo,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Modelo'),
                    ),
                  ),
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
                      controller: _controllerHome.controllerAno,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: 'Ano'),
                    ),
                  ),
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
                      controller: _controllerHome.controllerUrl,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: 'Url da imagem'),
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
                        'Cadastrar-se',
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),
                      onPressed: () {
                        _controllerHome.createCelular();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Realme(),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

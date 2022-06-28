// ignore_for_file: deprecated_member_use, prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import '../controllers/my-home-page-service.dart';
import '../controllers/my-sing-up-page-controller.dart';
import 'realme-page.dart';
import 'sing-up-page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  Future login() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _senhaController.text.trim(),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height_var = MediaQuery.of(context).size.height;
    double width_var = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 24, 24, 24),
      body: Form(
        key: formKey,
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
                    controller: _emailController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Email'),
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required('E-mail Obrigatório'),
                        Validatorless.email('E-mail Inválido')
                      ],
                    ),
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
                    controller: _senhaController,
                    validator: Validatorless.required('Senha Obrigatória'),
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: 'Senha'),
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
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
                      login();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Realme(),
                        ),
                      );
                    },
                  ),
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

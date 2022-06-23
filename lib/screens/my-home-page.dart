import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

import 'my-home-page-controller.dart';
import 'realme.dart';

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
          child: SizedBox(
            height: height_var,
            child: Column(
              children: [
                Container(
                  height: height_var / 6.5,
                  margin: EdgeInsets.only(top: height_var / 10),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      'assets/images/celular.png',
                    ),
                  ),
                ),
                Container(
                  height: height_var / 100,
                  child: FittedBox(
                    child: Text(
                      'Login',
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextFormField(
                      controller: _emailEC,
                      decoration: InputDecoration(labelText: 'Email'),
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
                      validator: Validatorless.required('Senha Obrigatória'),
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Senha'),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: height_var / 30),
                  height: 50,
                  width: width_var,
                  child: RaisedButton(
                    color: Color.fromARGB(255, 255, 29, 97),
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    ),
                    onPressed: () {
                      var formValid =
                          _formKey.currentState?.validate() ?? false;
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}



// TextFormField(
//               controller: _controllerHome.controllerEmail,
//             ),
//             TextFormField(
//               controller: _controllerHome.controllerNome,
//             ),
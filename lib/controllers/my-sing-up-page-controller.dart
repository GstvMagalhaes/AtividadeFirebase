import 'package:flutter/cupertino.dart';

import 'my-home-page-service.dart';

class MyHomePageController {
  final _serviceHome = MyHomePageService();
  final controllerNome = TextEditingController();
  final controllerModelo = TextEditingController();
  final controllerAno = TextEditingController();
  final controllerUrl = TextEditingController();

  createCelular() async {
    await _serviceHome.createCelular({
      'nome': controllerNome.text,
      'modelo': controllerModelo.text,
      'ano': controllerAno.text,
      'url': controllerUrl.text
    });
  }
}

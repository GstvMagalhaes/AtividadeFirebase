import 'package:cloud_firestore/cloud_firestore.dart';

class MyHomePageService {
  final _userFirestore = FirebaseFirestore.instance.collection('usuarios');

  createUser(dynamic user) async {
    await _userFirestore.doc().set({
      'nome': user['nome'],
      'email': user['email'],
      'ativo': user['ativo'],
    });
  }
}

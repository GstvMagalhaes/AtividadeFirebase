import 'package:cloud_firestore/cloud_firestore.dart';

class MyHomePageService {
  final celularFirestore = FirebaseFirestore.instance.collection('celulares');

  createCelular(dynamic celular) async {
    await celularFirestore.doc().set({
      'nome': celular['nome'],
      'modelo': celular['modelo'],
      'ano': celular['ano'],
      'url': celular['url']
    });
  }
}

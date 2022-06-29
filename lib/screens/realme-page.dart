// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../controllers/my-home-page-service.dart';

class Realme extends StatefulWidget {
  Realme({Key? key}) : super(key: key);

  @override
  State<Realme> createState() => _RealmeState();
}

class _RealmeState extends State<Realme> {
  final celularFirestore = FirebaseFirestore.instance.collection('celulares');

  Stream<QuerySnapshot> buscarCelulares() {
    return celularFirestore.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Celulares Cadastrados"),
      ),
      body: Container(
        color: Color.fromARGB(255, 24, 24, 24),
        child: Column(
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
              stream: buscarCelulares(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  case ConnectionState.active:
                  case ConnectionState.done:
                    if (snapshot.data!.docs.isEmpty) {
                      return Center(
                        child: Text('Nenhum Celular cadastrado.'),
                      );
                    }
                    return Row(
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                            height: 500,
                            child: CarouselSlider.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index, _) {
                                final DocumentSnapshot doc =
                                    snapshot.data!.docs[index];
                                return Column(
                                  children: [
                                    Text(
                                      doc['nome'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          fontFamily: 'Open Sans',
                                          fontSize: 25),
                                    ),
                                    Text(
                                      doc['modelo'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          fontFamily: 'Open Sans',
                                          fontSize: 20),
                                    ),
                                    Text(
                                      doc['ano'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontFamily: 'Open Sans',
                                          fontSize: 20),
                                    ),
                                    Image(
                                      image: NetworkImage(doc['url']),
                                      height: 300,
                                      width: 300,
                                    )
                                  ],
                                );
                              },
                              options: CarouselOptions(
                                height: 400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

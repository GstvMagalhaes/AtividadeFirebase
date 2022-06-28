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
  final List<String> imageList = [
    "assets/images/modelo1.png",
    "assets/images/modelo2.png",
    "assets/images/modelo3.png",
    "assets/images/modelo4.png",
    "assets/images/modelo5.png",
  ];

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
        child: Center(
          child: CarouselSlider(
            options: CarouselOptions(
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlay: true,
            ),
            items: imageList
                .map(
                  (e) => ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Stack(
                      fit: StackFit.expand,
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
                                return ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    final DocumentSnapshot doc =
                                        snapshot.data!.docs[index];
                                    return Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            doc['nome'],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            doc['modelo'],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            doc['ano'],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Xiaomi Realme Photos"),
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
                .map((e) => ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          Image.asset(
                            e,
                            width: 1050,
                            height: 350,
                            fit: BoxFit.cover,
                          )
                        ],
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

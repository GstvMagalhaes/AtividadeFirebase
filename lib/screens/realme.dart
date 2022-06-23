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
    "https://files.tecnoblog.net/wp-content/uploads/2021/12/realme-gt-realme-gt-master-edition-14-700x394.jpg",
    "https://gizmodo.uol.com.br/wp-content/blogs.dir/8/files/2021/02/Photo-2-realme-7-Pro-scaled-e1613074102329.jpg",
    "https://i.zst.com.br/thumbs/12/12/16/-459710149.jpg",
    "https://celular.pro.br/wp-content/uploads/2020/11/realme-e-bom.jpg",
    "https://files.tecnoblog.net/wp-content/uploads/2020/11/realme-7-pro-1.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 29, 97),
        title: const Center(
          child: SizedBox(
            child: Text("Xiaomi Realme 7i 64GB e 4GB RAM"),
          ),
        ),
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
                          Image.network(
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

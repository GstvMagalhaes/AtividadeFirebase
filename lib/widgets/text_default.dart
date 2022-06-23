import 'package:flutter/material.dart';

import '../utils/app-colors.dart';

class TextDefault extends StatefulWidget {
  final String text;
  final double size;

  const TextDefault({Key? key, required this.text, required this.size})
      : super(key: key);

  @override
  State<TextDefault> createState() => _TextDefaultState();
}

class _TextDefaultState extends State<TextDefault> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.all(size.width * 0.04),
          child: const Icon(Icons.access_alarm),
        ),
        Text(
          widget.text,
          style: TextStyle(
              color: AppColors.azulClaro,
              fontSize: widget.size / 5,
              fontWeight: FontWeight.w800),
        ),
      ],
    );
  }
}

import 'dart:math';
import 'package:flutter/material.dart';

mixin ChangeColor {
  static final Random _random = Random();

  static Color next() {
    return Color(0xFF000000 + _random.nextInt(0x00FFFFFF));
  }
}

class Homeview extends StatefulWidget {
  const Homeview({Key? key}) : super(key: key);

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  late Color randomColor;

  @override
  void initState() {
    super.initState();
    randomColor = ChangeColor.next();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(randomColor),
        ),
        onPressed: () {
          setState(() {
            randomColor = ChangeColor.next();
          });
        },
        child: Text(
          "Hey There! \n Color Code is $randomColor",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

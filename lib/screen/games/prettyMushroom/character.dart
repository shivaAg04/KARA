import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Character extends StatelessWidget {
  const Character({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Image.asset('assets/images/character.png' ,
      height: 40,
      width: 40,
      ),
      
    );
  }
}
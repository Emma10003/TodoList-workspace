import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/game_provider.dart';

class BirdWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final birdY = context.watch<GameProvider>().birdY;

    return AnimatedContainer(
      duration: Duration(milliseconds: 0),
      alignment: Alignment(0, birdY),
      child: Container(
        width: 50,  /* 새 모형의 크기 - 보통 정사각형 */
        height: 50,
        decoration: const BoxDecoration(
          color: Colors.yellow,
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: Text("🐥", style: TextStyle(fontSize: 30),),
        ),
      ),
    );
  }
}

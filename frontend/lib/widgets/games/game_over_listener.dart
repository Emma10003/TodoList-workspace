import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/game_provider.dart';

class GameOverListener extends StatefulWidget {
  const GameOverListener({super.key});

  @override
  State<GameOverListener> createState() => _GameOverListenerState();
}

class _GameOverListenerState extends State<GameOverListener> {
  bool _wasGameStarted = false;

  @override
  Widget build(BuildContext context) {
    final game = context.watch<GameProvider>();

    if(_wasGameStarted && !game.gameStarted) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _showGameOverDialog(context, game));
    }

    _wasGameStarted = game.gameStarted;

    return const SizedBox.shrink();
  }

  void _showGameOverDialog(BuildContext context, GameProvider game) {
    String msg = "";

    if(game.gameTime >= game.targetTime) {
      msg = "시간 종료\n최종점수: ${game.score}";
    } else if(game.score >= game.targetScore) {
      msg = "🎉목표 달성!🎉\n축하합니다!";
    } else {
      msg = "게임 오버\n최종점수: ${game.score}";
    }

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("게임 종료", textAlign: TextAlign.center,),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // const Text( -> 이 상태에서 msg를 작성하고 싶다면
              // const String msg 변수로 선언해야 함. -> 변할 수 없는(상수) 글자 데이터로 작성해야 함.
              // Text 글자가 변동이 있는 글자이기 때문에 const Text로 고정해서 사용할 수 없음.
              Text(
                msg,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              // 플레이 시간 내부에 변수가 없거나 변하는 데이터가 없으면
              // const 가능.
              // const Text("플레이 시간: 초") (O)
              // 하지만 아래와 같이 플레이시간: 옆에 초가 변한다면
              // 변수 상태의 Text이기 때문에 const 사용 불가.
              Text(
                "플레이 시간: ${game.gameTime.toStringAsFixed(1)}초",
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  game.resetGame();
                },
                child: const Text("다시 시작"),
            )
          ],
        )
    );
  }
}
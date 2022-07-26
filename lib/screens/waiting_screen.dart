import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rock_paper_scissors_game/components/hand_coin.dart';
import 'package:rock_paper_scissors_game/components/score_board.dart';
import 'package:rock_paper_scissors_game/constants/colors.dart';
import 'package:rock_paper_scissors_game/controllers/game.dart';
import 'package:rock_paper_scissors_game/states/game_state.dart';

class WaitingScreen extends ConsumerStatefulWidget {
  const WaitingScreen({super.key});

  @override
  ConsumerState<WaitingScreen> createState() => _WaitingScreenState();
}

class _WaitingScreenState extends ConsumerState<WaitingScreen> {
  String winText = "";

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var winningState = ref.read(gameProvider.notifier).checkWinner();
      ref.read(gameProvider.notifier).updateScore(winningState);
      winText = winningState == WinningState.player
          ? "You Win!"
          : winningState == WinningState.computer
              ? "Computer Wins!"
              : "Draw!";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final game = ref.watch(gameProvider);

    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: CColors.backgroundGradient,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  ScoreBoard(
                    score: game.player.score,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    child: Text(
                      winText,
                      style: const TextStyle(
                        fontSize: 52.0,
                        color: Colors.white,
                        shadows: <Shadow>[
                          Shadow(
                            blurRadius: 3.0,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 1100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Transform.scale(
                      scale: 1.2,
                      child: HandCoin(
                        onClick: _finishMatch,
                        playerHand: game.player.hand,
                        title: "YOU PICKED",
                      ),
                    ),
                    Transform.scale(
                      scale: 1.2,
                      child: HandCoin(
                        title: "THE HOUSE PICKED",
                        playerHand: game.computer.hand,
                        onClick: _finishMatch,
                        enemyTag: true,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  void _finishMatch(Hand hand) {
    Navigator.of(context).pop();
  }
}

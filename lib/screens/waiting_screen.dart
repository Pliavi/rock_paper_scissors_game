import 'package:flutter/material.dart';
import 'package:rock_paper_scissors_game/components/hand_coin.dart';
import 'package:rock_paper_scissors_game/components/score_board.dart';
import 'package:rock_paper_scissors_game/constants/colors.dart';
import 'package:rock_paper_scissors_game/controllers/game.dart';

class WaitingScreen extends StatelessWidget {
  const WaitingScreen(this.game, {Key? key}) : super(key: key);

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ScoreBoard(
              score: game.player.score,
            ),
            SizedBox(
              width: 1100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Transform.scale(
                    scale: 2.5,
                    child: PlayerHandCoin(
                      onClick: () => Navigator.pop(context),
                      playerHand: game.player.hand,
                      title: "YOU PICKED",
                    ),
                  ),
                  Transform.scale(
                    scale: 2.5,
                    child: PlayerHandCoin(
                      title: "THE HOUSE PICKED",
                      onClick: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}

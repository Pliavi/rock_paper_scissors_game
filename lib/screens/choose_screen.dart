import 'package:flutter/material.dart';
import 'package:rock_paper_scissors_game/components/score_board.dart';
import 'dart:math' as math;
import 'package:rock_paper_scissors_game/constants/colors.dart';
import 'package:rock_paper_scissors_game/controllers/game.dart';
import 'package:rock_paper_scissors_game/screens/waiting_screen.dart';

import '../components/hand_coin.dart';

class ChooseScreen extends StatelessWidget {
  const ChooseScreen(this.game, {Key? key}) : super(key: key);

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          gradient: CColors.backgroundGradient,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ScoreBoard(score: game.player.score),
            Builder(builder: (context) {
              return Center(
                child: FittedBox(
                  child: SizedBox(
                    width: 375 - 32,
                    height: 280,
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          right: 0,
                          child: Transform.rotate(
                            alignment: Alignment.center,
                            angle: -math.pi / 3,
                            child: Container(
                              width: 150,
                              height: 16,
                              color: CColors.handCoinConnectorColor,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          child: Transform.rotate(
                            alignment: Alignment.center,
                            angle: math.pi / 3,
                            child: Container(
                              width: 150,
                              height: 16,
                              color: CColors.handCoinConnectorColor,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 40,
                          child: Container(
                            width: 150,
                            height: 16,
                            color: CColors.handCoinConnectorColor,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: PlayerHandCoin(
                            onClick: () {
                              game.selectHand(PlayerHand.scissors);

                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => WaitingScreen(game),
                                ),
                              );
                            },
                            playerHand: PlayerHand.scissors,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          child: PlayerHandCoin(
                            onClick: () {
                              game.selectHand(PlayerHand.paper);

                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => WaitingScreen(game),
                                ),
                              );
                            },
                            playerHand: PlayerHand.paper,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: PlayerHandCoin(
                            onClick: () {
                              game.selectHand(PlayerHand.rock);

                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => WaitingScreen(game),
                                ),
                              );
                            },
                            playerHand: PlayerHand.rock,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
            Container(
              child: TextButton(
                onPressed: () {},
                child: Text("RULES"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

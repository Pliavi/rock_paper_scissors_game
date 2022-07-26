import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rock_paper_scissors_game/components/hand_coin.dart';
import 'package:rock_paper_scissors_game/constants/colors.dart';
import 'package:rock_paper_scissors_game/screens/waiting_screen.dart';
import 'package:rock_paper_scissors_game/states/game_state.dart';

class RockPaperScissorGrid extends ConsumerWidget {
  const RockPaperScissorGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameNotifier = ref.read(gameProvider.originProvider);

    return Center(
      child: FittedBox(
        child: SizedBox(
          width: 375 - 32,
          height: 280,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              const _JointLine(angle: -math.pi / 3, right: 0),
              const _JointLine(angle: math.pi / 3, left: 0),
              const _JointLine(top: 40),
              Positioned(
                top: 0,
                right: 0,
                child: Stack(
                  children: [
                    HandCoin(
                      onClick: (_) {},
                      playerHand: Hand.scissors,
                      enemyTag: true,
                    ),
                    HandCoin(
                      onClick: (hand) =>
                          _onClickHandCoin(context, hand, gameNotifier),
                      playerHand: Hand.scissors,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Stack(
                  children: [
                    HandCoin(
                      onClick: (_) {},
                      playerHand: Hand.paper,
                      enemyTag: true,
                    ),
                    HandCoin(
                      onClick: (hand) =>
                          _onClickHandCoin(context, hand, gameNotifier),
                      playerHand: Hand.paper,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Stack(
                  children: [
                    HandCoin(
                      onClick: (_) {},
                      playerHand: Hand.rock,
                      enemyTag: true,
                    ),
                    HandCoin(
                      onClick: (hand) =>
                          _onClickHandCoin(context, hand, gameNotifier),
                      playerHand: Hand.rock,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onClickHandCoin(
      BuildContext context, Hand hand, GameStateNotifier notifier) {
    notifier.selectHand(hand);
    notifier.setComputerHand();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const WaitingScreen(),
      ),
    );
  }
}

class _JointLine extends StatelessWidget {
  const _JointLine({
    Key? key,
    this.angle,
    this.top,
    this.right,
    this.left,
    this.bottom,
  }) : super(key: key);

  final double? angle;
  final double? top;
  final double? right;
  final double? left;
  final double? bottom;

  @override
  Widget build(BuildContext context) {
    var line = Container(
      width: 150,
      height: 16,
      color: CColors.handCoinConnectorColor,
    );

    Widget? rotatedLine;
    if (angle != null) {
      rotatedLine = Transform.rotate(
        alignment: Alignment.center,
        angle: angle!,
        child: line,
      );
    }

    return Positioned(
      top: top,
      right: right,
      left: left,
      bottom: bottom,
      child: rotatedLine ?? line,
    );
  }
}

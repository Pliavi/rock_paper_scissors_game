import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rock_paper_scissors_game/components/hand_coin.dart';
import 'package:rock_paper_scissors_game/controllers/game.dart';

final gameProvider = StateNotifierProvider.autoDispose<GameStateNotifier, Game>(
  (_) => GameStateNotifier(),
);

class GameStateNotifier extends StateNotifier<Game> {
  GameStateNotifier() : super(Game());

  void selectHand(Hand hand) {
    state = state.copyWith(
      player: state.player.copyWith(hand: hand),
    );
  }

  void updateScore(WinningState winningState) {
    if (winningState == WinningState.player) {
      state = state.copyWith(
        player: state.player.copyWith(score: state.player.score + 1),
      );
      return;
    }
    state = state.copyWith(
      computer: state.computer.copyWith(score: state.computer.score + 1),
    );
  }

  WinningState checkWinner() {
    final player = state.player;
    final computer = state.computer;

    if (player.hand == computer.hand) return WinningState.draw;

    final playerWins = Game.handWins[player.hand]?.contains(
      computer.hand,
    );

    if (playerWins == true) return WinningState.player;

    return WinningState.computer;
  }

  void setComputerHand({bool addLizardSpock = false}) {
    final computer = state.computer;
    final lizardSpockLength =
        addLizardSpock ? Hand.values.length : Hand.values.length - 2;

    state = state.copyWith(
      computer: computer.copyWith(
        hand: Hand.values[Random().nextInt(
          lizardSpockLength,
        )],
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rock_paper_scissors_game/components/hand_coin.dart';
import 'package:rock_paper_scissors_game/models/player.dart';
import 'package:rock_paper_scissors_game/screens/choose_screen.dart';

class Game {
  Player player = Player();
  Player computer = Player();

  // void start(BuildContext context) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(builder: (_) => const ChooseScreen()),
  //   );
  // }

  void selectHand(PlayerHand hand) {
    player.hand = hand;
    computer.hand =
        PlayerHand.values[Random().nextInt(PlayerHand.values.length)];
  }

  void updateScore(WinningState winningState) {
    if (winningState == WinningState.player) {
      player.score++;
    } else if (winningState == WinningState.computer) {
      computer.score++;
    }
  }

  WinningState checkWinner() {
    if (player.hand == computer.hand) {
      return WinningState.draw;
    }

    if (player.hand == PlayerHand.rock) {
      if (computer.hand == PlayerHand.scissors ||
          computer.hand == PlayerHand.lizard) {
        return WinningState.player;
      }
    }

    if (player.hand == PlayerHand.paper) {
      if (computer.hand == PlayerHand.rock ||
          computer.hand == PlayerHand.spock) {
        return WinningState.player;
      }
    }

    if (player.hand == PlayerHand.scissors) {
      if (computer.hand == PlayerHand.paper ||
          computer.hand == PlayerHand.lizard) {
        return WinningState.player;
      }
    }

    if (player.hand == PlayerHand.lizard) {
      if (computer.hand == PlayerHand.spock ||
          computer.hand == PlayerHand.paper) {
        return WinningState.player;
      }
    }

    if (player.hand == PlayerHand.spock) {
      if (computer.hand == PlayerHand.scissors ||
          computer.hand == PlayerHand.rock) {
        return WinningState.player;
      }
    }

    return WinningState.computer;
  }
}

enum WinningState { player, computer, draw }

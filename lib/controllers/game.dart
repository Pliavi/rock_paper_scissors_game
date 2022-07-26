import 'dart:math';

import 'package:rock_paper_scissors_game/components/hand_coin.dart';
import 'package:rock_paper_scissors_game/models/player.dart';

class Game {
  final Player player;
  final Player computer;

  Game({
    this.player = const Player(hand: null, score: 0),
    this.computer = const Player(hand: null, score: 0),
  });

  Game copyWith({
    Player? player,
    Player? computer,
  }) {
    return Game(
      player: player ?? this.player,
      computer: computer ?? this.computer,
    );
  }

  static const Map<Hand, List<Hand>> handWins = {
    Hand.rock: [Hand.scissors, Hand.lizard],
    Hand.paper: [Hand.rock, Hand.spock],
    Hand.scissors: [Hand.paper, Hand.lizard],
    Hand.lizard: [Hand.paper, Hand.spock],
    Hand.spock: [Hand.scissors, Hand.rock],
  };
}

enum WinningState { player, computer, draw }

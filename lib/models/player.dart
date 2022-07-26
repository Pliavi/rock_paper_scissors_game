import 'package:rock_paper_scissors_game/components/hand_coin.dart';

class Player {
  final Hand? hand;
  final int score;

  const Player({
    required this.hand,
    required this.score,
  });

  Player copyWith({
    Hand? hand,
    int? score,
  }) {
    return Player(
      hand: hand ?? this.hand,
      score: score ?? this.score,
    );
  }
}

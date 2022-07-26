import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rock_paper_scissors_game/components/score_board.dart';
import 'package:rock_paper_scissors_game/constants/colors.dart';
import 'package:rock_paper_scissors_game/states/game_state.dart';
import 'package:rock_paper_scissors_game/widgets/rock_paper_scissor_grid.dart';

class ChooseScreen extends ConsumerWidget {
  const ChooseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(gameProvider);

    return SafeArea(
      child: Scaffold(
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
              const RockPaperScissorGrid(),
              TextButton(
                onPressed: () {},
                child: const Text("RULES"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

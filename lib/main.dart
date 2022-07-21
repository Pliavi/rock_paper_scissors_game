import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rock_paper_scissors_game/components/hand_coin.dart';
import 'package:rock_paper_scissors_game/constants/colors.dart';
import 'package:rock_paper_scissors_game/controllers/game.dart';
import 'package:rock_paper_scissors_game/screens/choose_screen.dart';

void main() {
  // TODO use change notifier, this one will lead to a non resetable game
  Game game = Game();

  runApp(MyApp(game));
}

class MyApp extends StatelessWidget {
  const MyApp(this.game, {Key? key}) : super(key: key);

  final Game game;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.barlowSemiCondensedTextTheme(textTheme),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 16,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              side: const BorderSide(
                color: CColors.buttonBorderColor,
                width: 2,
              ),
            ),
          ),
        ),
      ),
      home: ChooseScreen(game),
    );
  }
}

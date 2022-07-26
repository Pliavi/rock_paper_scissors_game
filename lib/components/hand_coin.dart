import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rock_paper_scissors_game/constants/colors.dart';

class HandCoin extends StatelessWidget {
  const HandCoin({
    super.key,
    this.playerHand,
    required this.onClick,
    this.scale = 1,
    this.won = false,
    this.title,
    this.enemyTag = false,
  });

  final void Function(Hand hand)? onClick;
  final Hand? playerHand;
  final double scale;
  final bool won;
  final String? title;
  final bool enemyTag;

  @override
  Widget build(BuildContext context) {
    final shadowSpread = won ? 20.0 : 0.0;

    final coin = Material(
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          if (title != null)
            Positioned(
              top: -20,
              child: Text(
                title!,
                style: const TextStyle(
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
          playerHand == null
              ? Container(
                  // TODO: this margin is just ot fix the text position
                  // a fixed coin size would be better
                  margin: const EdgeInsets.all(11),
                  height: 120,
                  width: 120,
                  decoration: const BoxDecoration(
                    color: CColors.noneShadowColor,
                    shape: BoxShape.circle,
                  ),
                )
              : MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: onClick != null ? () => onClick!(playerHand!) : null,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: playerHand!.gradient,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: playerHand!.shadowColor,
                            blurRadius: 0,
                            offset: const Offset(0, 5),
                          ),
                          BoxShadow(
                            color: Colors.white.withAlpha(5),
                            offset: const Offset(0, 0),
                            spreadRadius: 1 * shadowSpread,
                          ),
                          BoxShadow(
                            color: Colors.white.withAlpha(5),
                            offset: const Offset(0, 0),
                            spreadRadius: 2 * shadowSpread,
                          ),
                          BoxShadow(
                            color: Colors.white.withAlpha(5),
                            offset: const Offset(0, 0),
                            spreadRadius: 3 * shadowSpread,
                          ),
                        ],
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(top: 4),
                        padding: const EdgeInsets.all(24),
                        decoration: const BoxDecoration(
                          color: CColors.coinInsetColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: CColors.coinInsetShadowColor,
                              blurRadius: 0,
                              offset: Offset(0, -4),
                            ),
                          ],
                        ),
                        child: SvgPicture.asset(playerHand!.icon),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );

    return playerHand == null
        ? coin
        : Hero(
            tag: '${playerHand!.name}${enemyTag ? '-enemy' : null}',
            child: coin,
          );
  }
}

enum Hand {
  paper(
    'assets/images/icon-paper.svg',
    CColors.paperGradient,
    CColors.paperShadowColor,
  ),
  scissors(
    'assets/images/icon-scissors.svg',
    CColors.scissorGradient,
    CColors.scissorShadowColor,
  ),
  rock(
    'assets/images/icon-rock.svg',
    CColors.rockGradient,
    CColors.rockShadowColor,
  ),
  lizard(
    'assets/images/icon-lizard.svg',
    CColors.lizardGradient,
    CColors.lizardShadowColor,
  ),
  spock(
    'assets/images/icon-spock.svg',
    CColors.spockGradient,
    CColors.spockShadowColor,
  );

  final String icon;
  final LinearGradient gradient;
  final Color shadowColor;

  const Hand(
    this.icon,
    this.gradient,
    this.shadowColor,
  );
}

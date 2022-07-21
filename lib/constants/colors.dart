import 'package:flutter/material.dart';

abstract class CColors {
  static const coinInsetColor = Color(0xFFDDDDDD);
  static const coinInsetShadowColor = Color(0xFFBBBDD4);

  static const scissorsFrom = Color(0xFFEC9E0E);
  static const scissorsTo = Color(0xFFECA922);
  static const scissorGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [scissorsFrom, scissorsTo],
  );
  static const Color scissorShadowColor = Color(0xFFC56D1C);

  static const paperFrom = Color(0xFF4865F4);
  static const paperTo = Color(0xFF5671F5);
  static const paperGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [paperFrom, paperTo],
  );
  static const paperShadowColor = Color(0xFF2944C4);

  static const rockFrom = Color(0xFFDC2E4E);
  static const rockTo = Color(0xFFDD405D);
  static const rockGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [rockFrom, rockTo],
  );
  static const rockShadowColor = Color(0xFF9D1635);

  static const lizardFrom = Color(0xFF834FE3);
  static const lizardTo = Color(0xFF8C5DE5);
  static const lizardGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [lizardFrom, lizardTo],
  );
  static const lizardShadowColor = Color(0xFF5C2C9C);

  static const spockFrom = Color(0xFF40B9CE);
  static const spockTo = Color(0xFF52BED1);
  static const spockGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [spockFrom, spockTo],
  );
  static const spockShadowColor = Color(0xFF1E8C9C);

  static const Color noneShadowColor = Color(0xFF182744);

  static const backgroundFrom = Color(0xFF1F3756);
  static const backgroundTo = Color(0xFF141539);
  static const backgroundGradient = RadialGradient(
    center: Alignment.topCenter,
    radius: 1.5,
    colors: [backgroundFrom, backgroundTo],
  );

  static const darkText = Color(0xFF3B4363);
  static const scoreText = Color(0xFF2A46C0);

  static const headerOutline = Color(0xFF606E85);

  static const handCoinConnectorColor = Color(0xFF14223C);

  static const boxBorderColor = Color(0xFF5B6F88);

  static const buttonBorderColor = Color(0xFF888CA7);
}

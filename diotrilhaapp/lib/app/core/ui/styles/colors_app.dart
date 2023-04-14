import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp get i {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get blue => const Color(0xFF2196F3);
  Color get bluelight => const Color(0xFF058AC6);
  Color get darkblue =>const Color(0xFF1A237E);
  Color get orange => const Color(0xFFFF9800);
  Color get purple => const Color(0xFF7A1EA1);
  Color get green => const Color(0xFF00BF9A);
  Color get lightgreen => const Color(0xFF69F0AE);

  Color get black => const Color(0XFF140E0E);
  Color get primary => const Color(0XFF007D21);
  Color get secudary => const Color(0XFFF88B0C);
  Color get dashboardColor => const Color.fromARGB(255, 82, 96, 230);
  Color get buttonhomeColor => Color.fromARGB(255, 231, 232, 241);
}

extension ColorsAppExcetions on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}


import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp get i {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get purple700 => const Color(0xFF292537);
  Color get pink700 => const Color(0xffE4105D);
  Color get blue750 => const Color(0xff249FEF);
  Color get purple750 => const Color(0xff5F53D5);
  Color get gray700 => const Color(0xff1E192C);
  Color get gray200 => const Color(0xffA0A4AE);
  Color get blue200 => const Color(0xffECEFF7);
}

extension ColorsAppExcetions on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}
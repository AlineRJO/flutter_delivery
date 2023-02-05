
import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._(); // TODO: PRIVADO PQ NINGUEM PODE CONSULTAR ELA

  static ColorsApp get i {
    _instance ??= ColorsApp._();
    return _instance!; // TODO: forcar que este atributo nao é null
  }

  Color get primary => const Color(0xFF007D21);
  Color get secondary => const Color(0xFFF88B0C);
}

extension ColorsAppExcetions on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}

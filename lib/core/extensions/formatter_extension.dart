
import 'package:intl/intl.dart';

extension FormatterExtension on double {
  String get currencyPTBR {
    final currencyFormat = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: r'R$' // TODO: este "r" indica que é uma string literal para nao ficar neste formarto: 'R\$'
    );
    return currencyFormat.format(this);
  }
}
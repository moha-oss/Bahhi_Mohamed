import 'Compt.dart';

void main(List<String> args) {
  Compte c = Compte();
  c.dipot();
  print(c.toString());
  c.retrait();
  print(c.toString());
}

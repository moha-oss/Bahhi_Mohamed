import 'dart:ffi';
import 'dart:io';

class Compte {
  int code = 0000;
  double solde = 0;
  double sdepot = 0;
  double sretrait = 0;
  double decouvert = 1000;
  double? tauxInteret;
  int nbL = 0;
  int nbC = 0;
  int nbQ = 0;
  int nbOp = 0;
  void dipot() {
    print("Enter Le code:");
    int pass = int.parse(stdin.readLineSync()!);
    if (code == pass) {
      print("Donner le type d'operation:");
      String op = stdin.readLineSync()!;
      if (op == "L") {
        nbL += 1;
        nbOp += 1;
      }
      if (op == "C") {
        nbC += 1;
        nbOp += 1;
      }
      if (op == "Q") {
        nbQ += 1;
        nbOp += 1;
      }
      print("Donner le montan a deposer :");
      double dipot = double.parse(stdin.readLineSync()!);
      solde += dipot;
      sdepot += dipot;
      print("Deposition avec succee ");
    } else {
      print("Le code incorrect");
    }
  }

  void retrait() {
    print("Enter Le code:");
    int pass = int.parse(stdin.readLineSync()!);
    if (code == pass) {
      print("Donner le type d'operation:");
      String op = stdin.readLineSync()!;
      if (op == "L") {
        nbL += 1;
        nbOp += 1;
      }
      if (op == "C") {
        nbC += 1;
        nbOp += 1;
      }
      if (op == "Q") {
        nbQ += 1;
        nbOp += 1;
      }
      print("Donner le montan a retirer :");
      double re = double.parse(stdin.readLineSync()!);
      if (re < decouvert) {
        solde -= re;
        sretrait += re;
        print("Retirer avec succee ");
      } else {
        print("La retrait refuse");
      }
    } else {
      print("Le code incorrect");
    }
  }

  String toString() {
    return "Votre Solde est: $solde DH\nTotal deposer est: $sdepot DH\nTotal retirer est: $sretrait DH \nTotale des operations est: $nbOp\n"
    "L: ${100*(nbOp-(nbC+nbQ))/nbOp} %\nC: ${100*(nbOp-(nbL+nbQ))/nbOp} %Q: ${100*(nbOp-(nbL+nbC))/nbOp} %";
  }
}

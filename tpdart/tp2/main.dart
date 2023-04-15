import 'Personne.dart';

void main() {
  Personne personne1 = Personne("Mohamed");
  Personne.messageBienvenue();
  personne1.setNumSecu("2950612345678");
  personne1.setSociete("Facebook");
  personne1.afficherSurEcran();
  Personne personne2 = Personne.avecSociete("Mohamed", "Bahhi");
  personne2.setNumSecu("1980723456789");
  personne2.quitterSociete();
  personne2.afficherSurEcran();
}

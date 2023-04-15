class Personne {
  late String nom;
  late String societe;
  late String numSecu;

  Personne(String nom) {
    this.nom = nom.toUpperCase();
    societe = "?";
    numSecu = "";
  }

  Personne.avecSociete(String nom, String entreprise) {
    this.nom = nom.toUpperCase();
    societe = _validerSociete(entreprise).toUpperCase();
    numSecu = "";
  }

  Personne.avecNumSecu(String nom, String entreprise, String numSecu) {
    this.nom = nom.toUpperCase();
    societe = _validerSociete(entreprise).toUpperCase();
    this.numSecu = validerNumSecu(numSecu);
  }

  int getAge() {
    if (numSecu.isEmpty) return 0;
    DateTime now = DateTime.now();
    DateTime dateNaissance = DateTime.parse("19${numSecu.substring(1, 3)}-${numSecu.substring(3, 5)}-01");
    int age = now.year - dateNaissance.year;
    if (now.month < dateNaissance.month ||
        (now.month == dateNaissance.month && now.day < dateNaissance.day)) {
      age--;
    }
    return age;
  }

  bool isMasculin() {
    if (numSecu.isEmpty) return false;
    int sexe = int.parse(numSecu.substring(0, 1));
    return sexe == 1 || sexe == 3 || sexe == 7 || sexe == 9;
  }

  String getDateNaissance() {
    if (numSecu.isEmpty) return "";
    String annee = "19${numSecu.substring(1, 3)}";
    String mois = numSecu.substring(3, 5);
    return "$mois/$annee";
  }

  String getInfo() {
    String sexe = isMasculin() ? "Masculin" : "Féminin";
    String age = getAge().toString();
    String societeAffichage = societe == "?" ? "Sans emploi" : societe;
    return "Nom: $nom, Sexe: $sexe, Age: $age ans, Société: $societeAffichage";
  }

  void setNom(String nom) {
    this.nom = nom.toUpperCase();
  }

  String getNom() {
    return nom;
  }

  void setSociete(String societe) {
    this.societe = _validerSociete(societe).toUpperCase();
    print("Changement de société");
    afficherSurEcran();
  }

  String getSociete() {
    return societe;
  }

  void quitterSociete() {
    if (societe == "?") {
      print("Impossible de quitter la société car sans emploi");
    } else {
      print("Je quitte la société: $societe");
      societe = "?";
      afficherSurEcran();
    }
  }

  void setNumSecu(String numSecu) {
    this.numSecu = validerNumSecu(numSecu);
  }

  String getNumSecu() {
    return numSecu;
  }

  static String _validerSociete(String sNom) {
    if (sNom.length > 32 || sNom == "?") {
      print("Classe Personne, société incorrecte: $sNom");
      sNom = "?";
    }
    return sNom;
  }

  String validerSociete(String sNom) {
    if (sNom.length > 32 || sNom == "?") {
      print("Classe Personne, société incorrecte: $sNom");
      sNom = societe;
    }
    return sNom;
  }

  String validerNumSecu(String num) {
    if (num.length != 13 || (num[0] != '1' && num[0] != '2') || int.parse(num.substring(2, 4)) > 12) {
      print("Numéro desécurité invalide: $num");
      num = numSecu;
    }
    return num;
  }

  void afficherSurEcran() {
    print(getInfo());
  }
  static void messageBienvenue() {
    print("Bienvenue dans notre application");
  }
}

class Candidate {
  String? name;
  String? surname;
  String? describe;
  String? profil_image;

  Candidate({this.name, this.surname, this.describe, this.profil_image});

  @override
  String toString() {
    return 'Person{name: $name, surname: $surname, birthDate: $describe, sex: $profil_image}';
  }
}

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

   factory Candidate.fromJson( Map<String, dynamic> data){
    return Candidate(name: data["name"],
        surname: data["surname"],
        describe: data["describe"],
        profil_image: data["profil_image"]);
  }
  
   Map<String, dynamic> toJson(){
    return {
      "name":name,
      "surname":surname,
      "describe":describe,
      "profil_image":profil_image,
    };

}

}
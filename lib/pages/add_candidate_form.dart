import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:candidate_vote_app/models/candidate.dart';
import 'package:candidate_vote_app/common/input_form.dart';
import 'package:candidate_vote_app/common/button_form.dart';
import 'package:http/http.dart' as http;

class AddCandidateForm extends StatefulWidget {
  const AddCandidateForm({super.key});

  @override
  State<AddCandidateForm> createState() => _AddCandidateFormState();
}

class _AddCandidateFormState extends State<AddCandidateForm> {
  final _formKey = GlobalKey<FormState>();
  final Candidate candidate = Candidate();
  List<Candidate> candidates = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un candidat'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              InputForm(
                name: 'Nom',
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Champ obligatoire";
                  }
                  return null;
                },
                onSaved: (value) {
                  candidate.name = value;
                },
                prefixIcon: Icon(Icons.person),
              ),
              SizedBox(height: 20),
              InputForm(
                name: 'Prénom',
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Champ obligatoire";
                  }
                  return null;
                },
                onSaved: (value) {
                  candidate.surname = value;
                },
                prefixIcon: Icon(Icons.person),
              ),
              SizedBox(height: 20),
              InputForm(
                name: 'Description',
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Champ obligatoire";
                  }
                  return null;
                },
                onSaved: (value) {
                  candidate.describe = value;
                },
              ),
              SizedBox(height: 20),
              InputForm(
                name: 'Profil URL',
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Champ obligatoire";
                  }
                  return null;
                },
                onSaved: (value) {
                  candidate.profil_image = value;
                },
              ),
              SizedBox(height: 20),
              ButtonForm(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {

                    var url =
                        Uri.https('jsonplaceholder.typicode.com', '/users');

                    var response = await http.post(
                      url,
                      body: jsonEncode(
                          candidate.toJson()), // Convertir l'objet en JSON
                    );

                    if (response.statusCode == 201) {

                        _formKey.currentState!.save();
                      Navigator.pop(context, candidate);
                    } 
                    else 
                    
                    {
                      // Si la soumission échoue, afficher un message d'erreur
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Erreur'),
                          content: const Text(
                              'La soumission a échoué. Veuillez réessayer.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  }
                },
                text: "Register as Candidate",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

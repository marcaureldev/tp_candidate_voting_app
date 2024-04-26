import 'package:flutter/material.dart';
import 'package:candidate_vote_app/models/candidate.dart';
import 'package:candidate_vote_app/common/input_form.dart';
import 'package:candidate_vote_app/common/button_form.dart';

class AddCandidateForm extends StatefulWidget {
  const AddCandidateForm({super.key});

  @override
  State<AddCandidateForm> createState() => _AddCandidateFormState();
}

class _AddCandidateFormState extends State<AddCandidateForm> {
  final _formKey = GlobalKey<FormState>();
  final Candidate candidate = Candidate();

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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.pop(context, candidate);
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

import 'package:candidate_vote_app/pages/candidate_list.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Candidate of Vote',
      home: CandidateList(),
    );
  }
}
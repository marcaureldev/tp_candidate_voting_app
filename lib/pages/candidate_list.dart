import 'package:candidate_vote_app/models/candidate.dart';
import 'package:candidate_vote_app/pages/add_candidate_form.dart';
import 'package:flutter/material.dart';

class CandidateList extends StatefulWidget {
  @override
  _CandidateListState createState() => _CandidateListState();
}

class _CandidateListState extends State<CandidateList> {
  List<Candidate> candidates = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello Samiat'),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: candidates.map((candidate) {
          return Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage("${candidate.profil_image}"),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${candidate.name} ${candidate.surname}"),
                        SizedBox(height: 4),
                        Text("${candidate.describe}"),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                ],
              ),

              // Row(
              //   children: [
              //     CircleAvatar(
              //       child: ClipOval(
              //         child: Image.network("${candidate.profil_image}",
              //         fit: BoxFit.cover,
              //         width: 100,
              //         height: 100,
              //         ),
              //       ),
              //     ),
              //     Column(
              //       children: [
              //         Text("${candidate.name} ${candidate.surname}"),
              //         Text("${candidate.describe}"),
              //       ],
              //     ),
              //   ],
              // ),
              SizedBox(height: 10), // Espace entre les candidats
            ],
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Candidate candidate = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddCandidateForm()),
          );
          setState(() {
            candidates.add(candidate);
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}

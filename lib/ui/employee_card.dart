import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmployeeCard extends StatelessWidget {
  EmployeeCard(this.firstName, this.lastName, this.email, this.imageUrl);

  final String firstName;
  final String lastName;
  final String email;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Container(height: 200,
        child: ListTile(
          title: Text("$firstName+ $lastName"),
          subtitle: Text(email),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
          ),
        ),
      ),
    );
  }
}

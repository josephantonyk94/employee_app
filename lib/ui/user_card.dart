import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  UserCard(this.title, this.body, this.id, this.imageUrl);

  final String title;
  final String body;
  final String id;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Container(height: 200,
        child: Column(
          children: [
            ListTile(
              title: Text("$title"),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
            Expanded(child: Container(child: Text(body),))
          ],
        ),
      ),
    );
  }
}

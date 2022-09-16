import 'package:flutter/material.dart';

class CardPost extends StatelessWidget {
  const CardPost({super.key, this.title = '', this.subtitle = ''});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      // ignore: prefer_const_constructors
      child: Card(
        child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }
}

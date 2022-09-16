import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teste_front/components/card/card.dart';
import 'package:teste_front/components/side-menu/sideMenu.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _items = [];
  @override
  Widget build(BuildContext context) {
    Future<void> readJsonHome() async {
      final String response =
          await rootBundle.loadString('assets/request.json');
      final data = await json.decode(response);
      setState(() {
        _items = data;
      });
    }

    readJsonHome();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text('Home Test'),
      ),
      drawer: const SideMenu(),
      backgroundColor: Colors.black12,
      body: _items.isNotEmpty
          ? SingleChildScrollView(
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: _items.map((e) {
                  return CardPost(title: e["title"], subtitle: e["content"]);
                }).toList(),
              ),
            )
          : const Center(
              child: Text(
              'Infelizmente nada foi encontrado :(',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
    );
  }
}

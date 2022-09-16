import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:teste_front/components/card/card.dart';
import 'package:teste_front/components/side-menu/sideMenu.dart';

class Listing extends StatefulWidget {
  const Listing({super.key});

  @override
  State<Listing> createState() => _ListingState();
}

class _ListingState extends State<Listing> {
  List _poketMonsters = [];
  @override
  Widget build(BuildContext context) {
    void getPokedex() async {
      Response response =
          await Dio().get('https://pokeapi.co/api/v2/pokemon/?limit=25');
      setState(() {
        _poketMonsters = response.data['results'];
      });
    }

    getPokedex();

    return Scaffold(
        backgroundColor: Colors.black12,
        drawer: const SideMenu(),
        appBar: AppBar(
          backgroundColor: Colors.amber,
          centerTitle: true,
          title: const Text(
            'Pokedéx',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: _poketMonsters.isNotEmpty
            ? Container(
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: _poketMonsters.map((e) {
                      return CardPost(title: e["name"], subtitle: e["url"]);
                    }).toList(),
                  ),
                ),
              )
            : const Center(child: Text('Não foi encontrado nada :(')));
  }
}

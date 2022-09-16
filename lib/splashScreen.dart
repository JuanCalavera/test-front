import 'dart:async';
import 'dart:io';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:teste_front/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 7),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login())));
    // ignore: prefer_const_constructors
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(children: [
          Container(
              width: 500,
              height: 500,
              margin: EdgeInsets.symmetric(vertical: 60, horizontal: 30),
              // ignore: prefer_const_constructors
              child: FlareActor('assets/cash-in-hand.flr',
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  animation: "Untitled")),
          // ignore: prefer_const_constructors
          Text(
            'Seja bem vindo!!!',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          )
        ]));
  }
}

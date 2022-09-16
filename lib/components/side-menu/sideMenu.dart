// ignore: file_names
import 'package:flutter/material.dart';
import 'package:teste_front/home.dart';
import 'package:teste_front/listing.dart';
import 'package:teste_front/login.dart';
import 'package:teste_front/register.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Center(
                child: Text(
              'FastCash',
              style: TextStyle(color: Colors.white),
            )),
          ),
          ListTile(
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: ((context) => Home())))
            },
            title: Text('Home'),
            leading: Icon(Icons.home),
          ),
          ListTile(
            onTap: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: ((context) => Listing())))
            },
            title: Text('Listagem'),
            leading: Icon(Icons.list),
          ),
          ListTile(
            title: Text('Cadastro'),
            leading: Icon(Icons.edit),
            onTap: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: ((context) => Register())))
            },
          ),
          ListTile(
            title: Text('Login'),
            leading: Icon(Icons.start),
            onTap: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: ((context) => Login())))
            },
          )
        ],
      ),
    );
  }
}

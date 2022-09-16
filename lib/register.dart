import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _visible = false;

  void toogleVisibility() {
    setState(() {
      _visible = !_visible;
    });
  }

  void login(userName, email, password) {
    if (userName == 'Juan' &&
        email == 'juan@gmail.com' &&
        password == 'Calavera') {
      print("cadastro efetuado");
      Navigator.pop(context);
    }
    toogleVisibility();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Front'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ignore: prefer_const_constructors
            Text(
              'Cadastro',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
            Column(
              children: <Widget>[
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                  child: TextFormField(
                      controller: userNameController,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(), labelText: 'Nome')),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                  child: TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(), labelText: 'Email')),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(), labelText: 'Senha')),
                ),
                ElevatedButton(
                    onPressed: () => {
                          login(userNameController.text, emailController.text,
                              passwordController.text)
                        },
                    child: const Text("Registrar")),
                const SizedBox(
                  height: 10.0,
                ),
                // ignore: prefer_const_constructors
                Visibility(
                    visible: _visible,
                    child: const Text(
                      'Não foi possível fazer cadastro',
                      style: TextStyle(color: Colors.red),
                    ))
              ],
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

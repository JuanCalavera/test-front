import 'package:flutter/material.dart';
import 'package:teste_front/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  bool _visible = false;

  void toogleVisible() {
    setState(() {
      _visible = !_visible;
    });
  }

  void login(userName, password) {
    if (userName == 'Juan' && password == 'Calavera') {
      print("login efetuado");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Front'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ignore: prefer_const_constructors
            Text(
              'Login',
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
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(), labelText: 'Senha')),
                ),
                ElevatedButton(
                    onPressed: () => {
                          login(
                              userNameController.text, passwordController.text)
                        },
                    child: const Text("Entrar")),
                const SizedBox(
                  height: 10.0,
                ),
                Visibility(
                    visible: _visible,
                    child: const Text(
                      'Não foi possível fazer login',
                      style: TextStyle(color: Colors.red),
                    )),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const Register())))
                  },
                  // ignore: prefer_const_constructors
                  child: Text(
                    'Fazer Cadastro',
                    style: const TextStyle(color: Colors.red, fontSize: 20),
                  ),
                )
              ],
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

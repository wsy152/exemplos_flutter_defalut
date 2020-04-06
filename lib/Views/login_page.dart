import 'package:flutter/material.dart';
import 'package:project_experience/Views/home_page.dart';
import 'package:project_experience/actions/mynav.dart';
import 'package:project_experience/apis/login_api.dart';
import 'package:project_experience/class/usuario.dart';
import 'package:project_experience/components/mybutton.dart';
import 'package:project_experience/components/mytextformfield.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Size get tamanho => MediaQuery.of(context).size;
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _focusSenha = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text('$tamanho.width x $tamanho.'),
      ),
      body: _body(),
    );
  }

  _body() {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16),
        height: tamanho.height * 0.6,
        width: _largura(),
        child: Card(
          child: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.all(16),
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 10),
                  MyTextFormField(
                    'Login',
                    'Digite seu login',
                    ctrl: _tLogin,
                    validar: _validarLogin,
                    tipoTeclado: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    nextFocus: _focusSenha,
                  ),
                  SizedBox(height: 25),
                  MyTextFormField(
                    'Senha',
                    'Digite dua senha',
                    senha: true,
                    ctrl: _tSenha,
                    validar: _validarSenha,
                    tipoTeclado: TextInputType.emailAddress,
                    focusNode: _focusSenha,
                  ),
                  SizedBox(height: 35),
                  MyButton(
                    'Login',
                    _onClickLogin,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _largura() {
    if (tamanho.width < 500) {}
  }

  _onClickLogin() async {
    bool formOK = _formKey.currentState.validate();
    if (!formOK) {
      return;
    }
    String login = _tLogin.text;
    String senha = _tSenha.text;
    print(senha);
    print(login);

    Usuario user = await LoginApi.login(login, senha);

    if (user != null) {
      print('>>>> $user');
      push(context, HomePage());
    } else {
      print('Login com erro');
    }
  }

  String _validarLogin(String text) {
    if (text.isEmpty) {
      return 'Digete o login';
    }
    if (text.length < 3) {
      return 'Digite no minimo 3 caracter';
    }
    return null;
  }

  String _validarSenha(String text) {
    if (text.isEmpty) {
      return 'Digite a senha';
    }
    if (text.length < 3) {
      return ' Sua senha deve conter no minimo 3 caracter';
    }
    return null;
  }
}

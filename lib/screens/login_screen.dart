import 'package:flutter/material.dart';
import 'package:phil_shop/models/user_model.dart';
import 'package:phil_shop/screens/signup_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Color pColor = Theme.of(context).primaryColor;

    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          centerTitle: true,
          actions: <Widget>[
            FlatButton(
              child: Text('Criar Conta', style: TextStyle(fontSize: 15.0)),
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SignupScreen()));
              },
            ),
          ],
        ),
        body: ScopedModelDescendant<UserModel>(
          builder: (context, child, model) {
            if (model.isLoading) {
              return Center(child: CircularProgressIndicator());
            }
            return Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(hintText: 'E-mail'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (text) {
                      if (text.isEmpty || !text.contains('@')) {
                        return 'E-mail inválido!';
                      }
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Senha'),
                    obscureText: true,
                    validator: (text) {
                      if (text.isEmpty || text.length < 6) {
                        return 'Senha inválida!';
                      }
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text('Esqueci minha senha'),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  SizedBox(
                    height: 45.0,
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {}
                        model.signIn();
                      },
                      child: Text('Entrar', style: TextStyle(fontSize: 18.0)),
                      textColor: Colors.white,
                      color: pColor,
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}

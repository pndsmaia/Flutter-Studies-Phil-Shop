import 'package:flutter/material.dart';
import 'package:phil_shop/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Color pColor = Theme.of(context).primaryColor;

    return Scaffold(
        appBar: AppBar(
          title: Text('Signup'),
          centerTitle: true,
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
                    controller: _nameController,
                    decoration: InputDecoration(hintText: 'Nome completo'),
                    validator: (text) {
                      if (text.isEmpty) {
                        return 'Nome inválido!';
                      }
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _emailController,
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
                    controller: _passwordController,
                    decoration: InputDecoration(hintText: 'Senha'),
                    obscureText: true,
                    validator: (text) {
                      if (text.isEmpty || text.length < 6) {
                        return 'Senha inválida!';
                      }
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _addressController,
                    decoration: InputDecoration(hintText: 'Endereço'),
                    validator: (text) {
                      if (text.isEmpty) {
                        return 'Nome inválido!';
                      }
                    },
                  ),
                  SizedBox(height: 16.0),
                  SizedBox(
                    height: 45.0,
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Map<String, dynamic> userData = {
                            'name': _nameController.text,
                            'email': _emailController.text,
                            'address': _addressController.text
                          };

                          model.signUp(
                              userData: userData,
                              pass: _passwordController.text,
                              onSuccess: _onSuccess,
                              onFail: _onFail);
                        }
                      },
                      child: Text('Criar', style: TextStyle(fontSize: 18.0)),
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

  void _onSuccess() {}

  void _onFail() {}
}

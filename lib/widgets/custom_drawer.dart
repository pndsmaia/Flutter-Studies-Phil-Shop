import 'package:flutter/material.dart';
import 'package:phil_shop/models/user_model.dart';
import 'package:phil_shop/screens/login_screen.dart';
import 'package:phil_shop/tiles/drawer_tile.dart';
import 'package:phil_shop/widgets/gradient_background.dart';
import 'package:scoped_model/scoped_model.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          _drawerBackground(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0, 16.0, 16.0, 8.0),
                height: 170.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8.0,
                      left: 0.0,
                      child: Text(
                        "Phil's Shop",
                        style: TextStyle(
                            fontSize: 36.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                        left: 0,
                        bottom: 0,
                        child: ScopedModelDescendant<UserModel>(
                          builder: (context, child, model) {
                            if (model.isLoading) {
                              return Center(child: CircularProgressIndicator());
                            }
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Olá, ${!model.isLoggedIn() ? '' : model.userData['name']}',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                GestureDetector(
                                  child: Text(
                                    !model.isLoggedIn()
                                        ? 'Entre ou Cadastre-se!'
                                        : 'Sair',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  onTap: () {
                                    if (!model.isLoggedIn()) {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen()));
                                    } else {
                                      model.signOut();
                                    }
                                  },
                                ),
                              ],
                            );
                          },
                        )),
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.home, 'Início', pageController, 0),
              DrawerTile(Icons.list, 'Produtos', pageController, 1),
              DrawerTile(Icons.location_on, 'Lojas', pageController, 2),
              DrawerTile(
                  Icons.playlist_add_check, 'Meus Pedidos', pageController, 3),
            ],
          ),
        ],
      ),
    );
  }

  Widget _drawerBackground() {
    return GradientBackGround(
      Color.fromARGB(255, 203, 236, 241),
      Colors.white,
      beginAlignment: Alignment.topCenter,
      endAlignment: Alignment.bottomCenter,
    );
  }
}

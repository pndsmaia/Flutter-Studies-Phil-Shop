import 'package:flutter/material.dart';
import 'package:phil_shop/tiles/drawer_tile.dart';
import 'package:phil_shop/widgets/gradient_background.dart';

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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Olá,',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            child: Text(
                              'Entre ou Cadastre-se!',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
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

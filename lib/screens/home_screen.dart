import 'package:flutter/material.dart';
import 'package:phil_shop/tabs/Home_tab.dart';
import 'package:phil_shop/tabs/products_tab.dart';
import 'package:phil_shop/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('Produtos'),
            centerTitle: true,
          ),
          body: ProductsTab(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('Lojas'),
            centerTitle: true,
          ),
          body: Container(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('Meus pedidos'),
            centerTitle: true,
          ),
          body: Container(),
          drawer: CustomDrawer(_pageController),
        ),
      ],
    );
  }
}

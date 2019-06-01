import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:phil_shop/datas/product_data.dart';

class ProductScreen extends StatefulWidget {
  final ProductData product;

  ProductScreen(this.product);

  @override
  _ProductScreenState createState() => _ProductScreenState(product);
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductData product;
  String onSize;

  _ProductScreenState(this.product);

  @override
  Widget build(BuildContext context) {
    final Color pColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(title: Text(product.title), centerTitle: true),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 0.9,
            child: Carousel(
              images: product.images.map((url) => NetworkImage(url)).toList(),
              dotSize: 4.0,
              dotSpacing: 15.0,
              dotBgColor: Colors.transparent,
              dotColor: pColor,
              //autoplay: false,
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  product.title,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
                Text(
                  'R\$ ${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: pColor),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Escolha o Tamanho:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10.0),
                SizedBox(
                  height: 30.0,
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 7,
                      crossAxisSpacing: 5,
                      childAspectRatio: 0.5,
                    ),
                    scrollDirection: Axis.horizontal,
                    children: product.sizes
                        .map((size) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  onSize = size;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: size == onSize
                                          ? pColor
                                          : Colors.grey[500],
                                      width: 3.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3.0)),
                                ),
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(vertical: 4.0),
                                child: Text(size),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(height: 16.0),
                SizedBox(
                  height: 44.0,
                  child: RaisedButton(
                    onPressed: onSize != null ? () {} : null,
                    color: pColor,
                    textColor: Colors.white,
                    child: Text('Adicionar ao Carrinho'),
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Descrição:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                ),
                Text(product.description, style: TextStyle(fontSize: 16.0)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

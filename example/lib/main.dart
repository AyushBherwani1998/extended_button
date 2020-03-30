import 'package:extended_button/extended_button.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Extended Button Demo"),
        ),
        body: Container(
          alignment: Alignment.center,
          child: ExtendedButton(
            size: 100,
            bottomLeftIcon: Icons.shopping_cart,
            bottomRightIcon: Icons.print,
            topLeftIcon: Icons.photo,
            topRightIcon: Icons.print,
            onClickBottomLeft: () {
              print("Shopping Cart Clicked");
            },
            onClickBottomRight: () {
              print("Print Icon Clicked");
            },
            onClickTopLeft: () {
              print("Photo Icon Clicked");
            },
            onClickTopRight: () {
              print("Print Icon Clicked");
            },
          ),
        ),
      ),
    ));

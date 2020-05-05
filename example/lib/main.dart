import 'package:extended_button/extended_button.dart';
import 'package:extended_button/material_sheet_fab.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Extended Button Demo"),
      ),
      floatingActionButton: MaterialSheetFab(
        firsTileTitle: Text("First Tile"),
        firstTileIcon: Icon(Icons.edit),
        firstTileOnTap: () => print("Hello"),
        secondTileTile: Text("Second Tile"),
        secondTileIcon: Icon(Icons.image),
        secondTileOnTap: () => print("Second Tile Pressed"),
        thirdTileTitle: Text("Third Tile"),
        thirdTileIcon: Icon(Icons.print),
        fabBackgroundColor: Colors.deepPurple,
        fabChild: Icon(
          Icons.add,
          color: Colors.white,
        ),
        menuTitleColor: Colors.white,
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
    );
  }
}

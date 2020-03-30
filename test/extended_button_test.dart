import 'package:extended_button/extended_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

final List<String> list = [];

ExtendedButton testableWidget({bool opened}) => ExtendedButton(
      size: 100,
      bottomLeftIcon: Icons.shopping_cart,
      bottomRightIcon: Icons.print,
      topLeftIcon: Icons.photo,
      topRightIcon: Icons.print,
      opened: opened,
      onClickBottomLeft: () {
        list?.add("Bottom Left Pressed");
      },
      onClickBottomRight: () {
        list?.add("Bottom Right Pressed");
      },
      onClickTopLeft: () {
        list?.add("Top Left Pressed");
      },
      onClickTopRight: () {
        list?.add("Top Right Pressed");
      },
    );

void main() {
  testWidgets('when opened is false, the iconColor should be transparent',
      (WidgetTester tester) async {
    await tester.pumpWidget(Directionality(
      child: Material(
        child: testableWidget(opened: false),
      ),
      textDirection: TextDirection.ltr,
    ));

    expect(tester.widget<Icon>(find.byIcon(Icons.shopping_cart)).color,
        Colors.transparent);
    expect(tester.widget<Icon>(find.byIcon(Icons.print).first).color,
        Colors.transparent);
    expect(tester.widget<Icon>(find.byIcon(Icons.photo)).color,
        Colors.transparent);
  });

  testWidgets('when opened is true, the iconColor shouldnot be transparent',
      (WidgetTester tester) async {
    await tester.pumpWidget(Directionality(
      child: Material(
        child: testableWidget(opened: true),
      ),
      textDirection: TextDirection.ltr,
    ));

    // By default color combination is black and white
    expect(tester.widget<Icon>(find.byIcon(Icons.shopping_cart)).color,
        Colors.white);
    expect(tester.widget<Icon>(find.byIcon(Icons.print).first).color,
        Colors.white);
    expect(tester.widget<Icon>(find.byIcon(Icons.photo)).color, Colors.white);
  });

  testWidgets('icons respond to user click when open',
      (WidgetTester tester) async {
    await tester.pumpWidget(Directionality(
      child: Material(
        child: testableWidget(opened: true),
      ),
      textDirection: TextDirection.ltr,
    ));

    await tester.tap(find.byIcon(Icons.shopping_cart));
    expect(list.length, 1);

    await tester.tap(find.byIcon(Icons.print).first);
    expect(list.length, 2);

    await tester.tap(find.byIcon(Icons.print).last);
    expect(list.length, 3);

    await tester.tap(find.byIcon(Icons.photo));
    expect(list.length, 4);
  });
}

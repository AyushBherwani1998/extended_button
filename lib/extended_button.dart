library extended_button;

import 'package:flutter/material.dart';

/// Creates an Extended Button Widget
/// An extended button widget provides and expanding button whenever the button is
/// clicked.
///
/// [topRightIcon], [topLeftIcon], [bottomLeftIcon], [bottomRightIcon] icons are used
/// whenever the button is expanded.
///
/// [opened] is define whether the button should be expanded initially or not. By
/// default the value of [opened] is false
///
/// [onClickBottomLeft], [onClickBottomRight], [onClickTopLeft], [onClickTopRight] are
/// the functions called whenever the icons are pressed. If you don't want to trigger
/// function you can pass null.
///
/// [size] parameter defines the size of the [ExtendedButton]. The size of Extended
/// Button should be greater than 80.
///
/// [curve] parameter is used to define the [Curve] for expanded animation. By
/// default value of [curve] is [Curves.easeIn].
///
/// [iconColor] is used to defined the color for icons for both expand and shrink state.
/// By default value of [iconColor] is [Colors.white]
///
/// [boxColor] is used to define the color for the Extended Button. By default value of
/// [boxColor] is [Colors.black]

class ExtendedButton extends StatefulWidget {
  final IconData topRightIcon, topLeftIcon, bottomRightIcon, bottomLeftIcon;
  final bool opened;
  final Curve curve;
  final Function onClickTopRight,
      onClickTopLeft,
      onClickBottomLeft,
      onClickBottomRight;
  final double size;
  final Color iconColor, boxColor;

  const ExtendedButton(
      {Key key,
      this.opened = false,
      @required this.size,
      this.iconColor = Colors.white,
      this.boxColor = Colors.black,
      @required this.topRightIcon,
      @required this.topLeftIcon,
      @required this.bottomRightIcon,
      @required this.bottomLeftIcon,
      @required this.onClickTopRight,
      @required this.onClickTopLeft,
      @required this.onClickBottomLeft,
      @required this.onClickBottomRight,
      this.curve = Curves.easeIn})
      : assert(iconColor != null, "Icon color cannot be null"),
        assert(boxColor != null, "Box color can not be null"),
        assert(topRightIcon != null, "Top right Icon can not be null"),
        assert(topLeftIcon != null, "Top left Icon can not be null"),
        assert(bottomRightIcon != null, "Bottom right Icon can not be null"),
        assert(bottomLeftIcon != null, "Bottom left Icon can not be null"),
        assert(size > 80, "Size can not be less than 80"),
        assert(curve != null, "Curve can not be null"),
        super(key: key);

  @override
  _ExtendedButtonState createState() => _ExtendedButtonState(opened: opened);
}

class _ExtendedButtonState extends State<ExtendedButton> {
  Dimensions dimensions;
  bool opened;

  _ExtendedButtonState({this.opened});

  @override
  void initState() {
    dimensions = Dimensions(widget.size);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size,
      width: widget.size,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double height = constraints.maxHeight;
          double width = constraints.maxWidth;
          return Stack(
            children: <Widget>[
              Positioned(
                top: constraints.maxHeight / 2 -
                    dimensions.calculateDimension(32),
                left: constraints.maxWidth / 2 -
                    dimensions.calculateDimension(32),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  alignment: Alignment.center,
                  height: dimensions.calculateDimension(64),
                  width: dimensions.calculateDimension(64),
                  decoration: BoxDecoration(
                      color: opened
                          ? widget.boxColor.withOpacity(0.6)
                          : widget.boxColor,
                      borderRadius: BorderRadius.circular(
                          opened ? dimensions.calculateDimension(32) : 0)),
                  child: Container(),
                ),
              ),
              SquareBox(
                  opened: opened,
                  size: widget.size,
                  curve: widget.curve,
                  icon: widget.topLeftIcon,
                  boxColor: widget.boxColor,
                  iconColor: widget.iconColor,
                  closedTop: height / 2 - dimensions.calculateDimension(31),
                  openedTop: height / 2 - dimensions.calculateDimension(50),
                  openedLeft: width / 2 - dimensions.calculateDimension(50),
                  closedLeft: width / 2 - dimensions.calculateDimension(31),
                  onClick: widget.onClickTopLeft),
              SquareBox(
                  opened: opened,
                  size: widget.size,
                  curve: widget.curve,
                  iconColor: widget.iconColor,
                  boxColor: widget.boxColor,
                  icon: widget.topRightIcon,
                  closedTop: height / 2 - dimensions.calculateDimension(32),
                  openedTop: height / 2 - dimensions.calculateDimension(50),
                  openedLeft: width / 2 + dimensions.calculateDimension(10),
                  closedLeft: width / 2 + dimensions.calculateDimension(2),
                  onClick: widget.onClickTopRight),
              SquareBox(
                  opened: opened,
                  size: widget.size,
                  curve: widget.curve,
                  iconColor: widget.iconColor,
                  boxColor: widget.boxColor,
                  icon: widget.bottomRightIcon,
                  closedTop: height / 2 + dimensions.calculateDimension(2),
                  openedTop: height / 2 + dimensions.calculateDimension(10),
                  openedLeft: width / 2 + dimensions.calculateDimension(10),
                  closedLeft: width / 2 + dimensions.calculateDimension(2),
                  onClick: widget.onClickBottomRight),
              SquareBox(
                  opened: opened,
                  size: widget.size,
                  curve: widget.curve,
                  iconColor: widget.iconColor,
                  boxColor: widget.boxColor,
                  icon: widget.bottomLeftIcon,
                  closedTop: height / 2 + dimensions.calculateDimension(2),
                  openedTop: height / 2 + dimensions.calculateDimension(10),
                  openedLeft: width / 2 - dimensions.calculateDimension(50),
                  closedLeft: width / 2 - dimensions.calculateDimension(32),
                  onClick: widget.onClickBottomLeft),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  child: Transform.rotate(
                    angle: opened ? 0.75 : 0,
                    child: Icon(
                      Icons.add,
                      color: widget.iconColor,
                      size: dimensions.calculateDimension(28),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      opened = !opened;
                    });
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class SquareBox extends StatefulWidget {
  final IconData icon;
  final bool opened;
  final Function onClick;
  final double closedLeft, openedLeft, closedTop, openedTop, size;
  final Color iconColor, boxColor;
  final Curve curve;

  SquareBox(
      {this.icon,
      this.opened,
      this.onClick,
      this.closedLeft,
      this.openedLeft,
      this.closedTop,
      this.openedTop,
      this.iconColor,
      this.boxColor,
      this.size,
      this.curve});

  @override
  _SquareBoxState createState() => _SquareBoxState();
}

class _SquareBoxState extends State<SquareBox> {
  Dimensions dimensions;

  @override
  void initState() {
    dimensions = Dimensions(widget.size);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      curve: widget.curve,
      top: widget.opened ? widget.openedTop : widget.closedTop,
      left: widget.opened ? widget.openedLeft : widget.closedLeft,
      child: AnimatedContainer(
        alignment: Alignment.center,
        duration: Duration(milliseconds: 500),
        width: widget.opened
            ? Dimensions(widget.size).calculateDimension(40)
            : dimensions.calculateDimension(30),
        height: widget.opened
            ? dimensions.calculateDimension(40)
            : dimensions.calculateDimension(30),
        child: GestureDetector(
          onTap: widget.opened ? widget.onClick : null,
          child: Icon(
            widget.icon,
            size: dimensions.calculateDimension(20),
            color: widget.opened ? widget.iconColor : Colors.transparent,
          ),
        ),
        decoration: BoxDecoration(
            color: widget.boxColor,
            borderRadius: BorderRadius.circular(
                widget.opened ? dimensions.calculateDimension(5) : 0)),
      ),
    );
  }
}

class Dimensions {
  final double size;

  Dimensions(this.size);

  calculateDimension(int value) {
    return size * value / 106;
  }
}

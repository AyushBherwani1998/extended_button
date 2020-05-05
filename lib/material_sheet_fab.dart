import 'package:flutter/material.dart';

class MaterialSheetFab extends StatefulWidget {
  final Text firsTileTitle;
  final Text secondTileTile;
  final Text thirdTileTitle;
  final Icon firstTileIcon;
  final Icon secondTileIcon;
  final Icon thirdTileIcon;
  final Function firstTileOnTap;
  final Function secondTileOnTap;
  final Function thirdTileOnTap;
  final Color menuTitleColor;
  final Widget fabChild;
  final Color fabBackgroundColor;
  final bool expanded;

  const MaterialSheetFab({
    Key key,
    this.firsTileTitle,
    this.secondTileTile,
    this.thirdTileTitle,
    this.firstTileIcon,
    this.secondTileIcon,
    this.thirdTileIcon,
    this.expanded = false,
    this.firstTileOnTap,
    this.secondTileOnTap,
    this.thirdTileOnTap,
    this.fabChild,
    this.fabBackgroundColor,
    this.menuTitleColor,
  })  : assert(firsTileTitle != null),
        assert(secondTileTile != null),
        assert(thirdTileTitle != null),
        assert(firstTileIcon != null),
        assert(secondTileIcon != null),
        assert(thirdTileIcon != null),
        super(key: key);

  @override
  _MaterialSheetFabState createState() => _MaterialSheetFabState();
}

class _MaterialSheetFabState extends State<MaterialSheetFab> {
  bool selected;
  Color _color;

  @override
  void initState() {
    super.initState();
    _color = widget.fabBackgroundColor;
    selected = widget.expanded;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selected ? null : () => setState(() => selected = !selected),
      child: AnimatedContainer(
        height: selected ? 220 : 56,
        width: selected ? 200 : 56,
        duration: Duration(milliseconds: 600),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(selected ? 0 : 28),
          color: selected
              ? Colors.white
              : _color ??
                  Theme.of(context).floatingActionButtonTheme.backgroundColor,
        ),
        child: selected
            ? Card(
                elevation: 12,
                child: Column(
                  children: [
                    Expanded(
                      child: ListTile(
                        onTap: widget.firstTileOnTap,
                        leading: widget.firstTileIcon,
                        title: widget.firsTileTitle,
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        onTap: widget.secondTileOnTap,
                        leading: widget.secondTileIcon,
                        title: widget.secondTileTile,
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        onTap: widget.thirdTileOnTap,
                        leading: widget.thirdTileIcon,
                        title: widget.thirdTileTitle,
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => selected = !selected),
                        child: Container(
                          color: _color ??
                              Theme.of(context)
                                  .floatingActionButtonTheme
                                  .backgroundColor,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(4),
                          child: Text(
                            "Close Menu",
                            style: TextStyle(
                              color: widget.menuTitleColor ?? Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : widget.fabChild,
      ),
    );
  }
}

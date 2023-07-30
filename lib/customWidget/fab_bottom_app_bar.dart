
import 'package:flutter/material.dart';

class FABBottomAppBarItem {
  IconData? iconData;
  String? text;

  FABBottomAppBarItem({this.iconData = Icons.add, this.text = "Home"});
}

class FABBottomAppBar extends StatefulWidget {
  FABBottomAppBar(
      {this.items,
      this.centerItemText = "265655",
      this.height = 60.0,
      this.iconSize = 24.0,
      this.backgroundColor = Colors.green,
      this.color = Colors.white70,
      this.selectedIndex = 1,
      this.selectedColor = Colors.white,
      this.notchedShape = const CircularNotchedRectangle(),
      this.onTabSelected}) {
    assert(this.items!.length == 2 || this.items!.length == 4);
  }

  final List<FABBottomAppBarItem>? items;
  final String centerItemText;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final int selectedIndex;
  final NotchedShape notchedShape;
  final ValueChanged<int>? onTabSelected;

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  int _selectedIndex = 1;

  // ValueNotifier valChange=ValueNotifier(1);


  _updateIndex(int index) {
    // if(isTrue){
      widget.onTabSelected!(index);
    //
    // }
    setState(() {
      _selectedIndex = index;
    });
  }

  bool isFirst = true;

  @override
  void initState() {
    super.initState();
    // _selectedIndex = widget.selectedIndex;
    // setState(() {
    //
    // });

    // _updateIndex(4);
    print("index---true12323");
  }

  @override
  Widget build(BuildContext context) {

    // if (isFirst) {
    //   // _selectedIndex = widget.selectedIndex;
    //
    //   Timer(Duration(seconds: 1), () {
    //     isFirst = false;
    //     _updateIndex(4);
    //   });
    // }
    // return Container(
    //   child: StatefulBuilder(
    //     builder: (context, setState123) {
    //       if (isFirst) {
    //         _selectedIndex = widget.selectedIndex;
    //       }
    //       List<Widget> items = List.generate(widget.items!.length, (int index) {
    //         return _buildTabItem(
    //           item: widget.items![index],
    //           index: index,
    //           onPressed: _updateIndex,
    //         );
    //       });
    //       items.insert(items.length >> 1, _buildMiddleTabItem());
    //       print("getvalsset===${items.length}---${items.length >> 1}--$isFirst");
    //
    //     return Row(
    //       children: [
    //         Expanded(
    //           flex: 1,
    //           child: BottomAppBar(
    //             shape: widget.notchedShape,
    //             color: widget.backgroundColor,
    //             child: Row(
    //               mainAxisSize: MainAxisSize.max,
    //               mainAxisAlignment: MainAxisAlignment.spaceAround,
    //               children: items,
    //             ),
    //           ),
    //         ),
    //
    //         StatefulBuilder(
    //           builder: (context, setStateq) {
    //             if(isFirst)
    //             {
    //               setState123(() {
    //                 isFirst=false;
    //               });
    //             }
    //             return Container();
    //             // return FutureBuilder(
    //             //   future: null,
    //             //   builder: (context, snapshot) {
    //             //     if (isFirst) {
    //             //       // _selectedIndex = widget.selectedIndex;
    //             //
    //             //       // Timer(Duration(seconds: 1), () {
    //             //       isFirst = false;
    //             //       _updateIndex(4);
    //             //       // });
    //             //     }
    //             //     return Container();
    //             //
    //             //   },
    //             // )
    //           },
    //
    //         )
    //       ],
    //       // child: BottomAppBar(
    //       //   shape: widget.notchedShape,
    //       //   color: widget.backgroundColor,
    //       //   child: Row(
    //       //     mainAxisSize: MainAxisSize.max,
    //       //     mainAxisAlignment: MainAxisAlignment.spaceAround,
    //       //     children: items,
    //       //   ),
    //       // ),
    //     );
    //     },
    //
    //   ),
    // );


    List<Widget> items = List.generate(widget.items!.length, (int index) {
      return _buildTabItem(
        item: widget.items![index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());

    return BottomAppBar(
      shape: widget.notchedShape,
      color: widget.backgroundColor,

      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: widget.iconSize),
            Text(
              widget.centerItemText,
              style: TextStyle(color: widget.color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required FABBottomAppBarItem item,
    required int index,
    required ValueChanged<int> onPressed,
  }) {
    Color? color =
        _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(item.iconData, color: color, size: widget.iconSize),
                Text(
                  item.text!,
                  style: TextStyle(color: color),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:blobs/blobs.dart';

class unknown extends StatefulWidget {
  const unknown({Key? key}) : super(key: key);

  @override
  State<unknown> createState() => _unknownState();
}

class _unknownState extends State<unknown>{
PageController _horizontalController = PageController(viewportFraction: 0.8);
PageController _verticalController = PageController(viewportFraction: 0.8);
double _currentHorizontalPage = 0.0;
double _currentVerticalPage = 0.0;
int _rowCount = 3;
int _columnCount = 3;

@override
void initState() {
  super.initState();
  _horizontalController.addListener(() {
    setState(() {
      _currentHorizontalPage = _horizontalController.page!;
    });
  });
  _verticalController.addListener(() {
    setState(() {
      _currentVerticalPage = _verticalController.page!;
    });
  });
}

void _handleHorizontalSwipe(DragUpdateDetails details) {
  double sensitivity = 8.0;
  if (details.delta.dx > sensitivity) {
    _horizontalController.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  } else if (details.delta.dx < -sensitivity) {
    _horizontalController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}

void _handleVerticalSwipe(DragUpdateDetails details) {
  double sensitivity = 8.0;
  if (details.delta.dy > sensitivity) {
    _verticalController.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  } else if (details.delta.dy < -sensitivity) {
    _verticalController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}

@override
Widget build(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.5,
    child: GestureDetector(
      onHorizontalDragUpdate: _handleHorizontalSwipe,
      onVerticalDragUpdate: _handleVerticalSwipe,
      child: PageView.builder(
        controller: _horizontalController,
        itemCount: _rowCount,
        itemBuilder: (context, rowIndex) {
          return PageView.builder(
            controller: _verticalController,
            itemCount: _columnCount,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, columnIndex) {
              int index = rowIndex * _columnCount + columnIndex;
              double opacity = 1.0 - ((_currentHorizontalPage - rowIndex).abs() * 0.3) -
                  ((_currentVerticalPage - columnIndex).abs() * 0.3);
              return Opacity(
                opacity: opacity,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(
                      'Grid Item ${index + 1}',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    ),
  );
}
}
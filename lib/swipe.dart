import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  var maxRows = 7;
  var maxColumns = 7;

  var ans = ['A', 'P', 'AQ'];

  List<List<String>> listOfElement = [
    ['A', 'B', 'C', 'D', 'E', 'F', 'G'],
    ['H', 'I', 'J', 'K', 'L', 'M', 'N'],
    ['O', 'P', 'Q', 'R', 'S', 'T', 'U'],
    ['V', 'W', 'X', 'Y', 'Z', 'AA', 'AB'],
    ['AC', 'AD', 'AE', 'AF', 'AG', 'AH', 'AI'],
    ['AJ', 'AK', 'AL', 'AM', 'AN', 'AO', 'AP'],
    ['AQ', 'AR', 'AS', 'AT', 'AU', 'AV', 'AW'],
  ];

  List<List<String>> swipeLeftFunction(
      var listOfElement, int maxRows, int index) {
    var a = listOfElement[index][0];
    for (int i = 0; i < maxRows; i++) {
      listOfElement[index][i] = listOfElement[index][(i + 1) % maxRows];
    }
    listOfElement[index][6] = a;
    return listOfElement;
  }

  List<List<String>> swipeDownFunction(
      var listOfElement, int maxColumns, int index) {
    var lastElement = listOfElement[6][index];
    for (int i = maxColumns - 2; i >= 0; i--) {
      listOfElement[i + 1][index] = listOfElement[(i) % maxColumns][index];
    }
    listOfElement[0][index] = lastElement;
    return listOfElement;
  }

  List<List<String>> swipeUpFunction(
      var listOfElement, int maxColumns, int index) {
    var firstElement = listOfElement[0][index];
    for (int i = 0; i < maxRows; i++) {
      listOfElement[i][index] = listOfElement[(i + 1) % maxColumns][index];
    }
    listOfElement[6][index] = firstElement;
    return listOfElement;
  }

  List<List<String>> swipeRightFunction(
      var listOfElement, int maxColumns, int index) {
    var a = listOfElement[index][6];
    for (int i = maxRows - 2; i >= 0; i--) {
      listOfElement[index][i + 1] = listOfElement[index][(i) % maxColumns];
    }
    listOfElement[index][0] = a;
    return listOfElement;
  }

  void swipeLeftOrRight(DragEndDetails details, int index) {
    if (details.primaryVelocity! < 0) {
      setState(() {
        swipeLeftFunction(listOfElement, maxRows, index);
      });
    } else if (details.primaryVelocity! > 0) {
      setState(() {
        swipeRightFunction(listOfElement, maxColumns, index);
      });
    }
  }

  void swipeUpOrDown(DragEndDetails details, int index) {
    if (details.primaryVelocity! < 0) {
      setState(() {
        swipeUpFunction(listOfElement, maxColumns, index);
      });
    } else if (details.primaryVelocity! > 0) {
      setState(() {
        swipeDownFunction(listOfElement, maxColumns, index);
      });
    }
  }

  Widget gridBox(String value, Color color) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      child: Center(
          child: Text(
        value,
        style: const TextStyle(
          fontSize: 35,
          color: Color(0xfff00000),
        ),
      )),
    );
  }

  Widget middleRowElementChecker(int horizontalindex, int verticalindex) {
    return listOfElement[1][verticalindex] == ans[0] ||
            listOfElement[1][verticalindex] == ans[1] ||
            listOfElement[1][verticalindex] == ans[2]
        ? gridBox(
            listOfElement[horizontalindex][verticalindex], Color(0xff29ea07))
        : gridBox(
            listOfElement[horizontalindex][verticalindex], Color(0xfff5dadf));
  }

  Widget gridRow(int xIndex) {
    return Row(
      children: [
        gestureDetector(xIndex, 0),
        const SizedBox(
          width: 30,
        ),
        gestureDetector(xIndex, 1),
        const SizedBox(
          width: 30,
        ),
        gestureDetector(xIndex, 2),
      ],
    );
  }

  Widget gestureDetector(int horizontalindex, int verticalindex) {
    return horizontalindex != 1
        ? GestureDetector(
            onHorizontalDragEnd: (DragEndDetails details) {
              swipeLeftOrRight(details, horizontalindex);
            },
            onVerticalDragEnd: (DragEndDetails details) {
              swipeUpOrDown(details, verticalindex);
            },
            child: gridBox(listOfElement[horizontalindex][verticalindex],
                Color(0xfff5dadf)))
        : GestureDetector(
            onHorizontalDragEnd: (DragEndDetails details) {
              swipeLeftOrRight(details, horizontalindex);
            },
            onVerticalDragEnd: (DragEndDetails details) {
              swipeUpOrDown(details, verticalindex);
            },
            child: middleRowElementChecker(horizontalindex, verticalindex),
          );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            gridRow(0),
            const SizedBox(
              height: 30,
            ),
            gridRow(1),
            const SizedBox(
              height: 30,
            ),
            gridRow(2),
          ]),
        ),
      ),
    );
  }
}

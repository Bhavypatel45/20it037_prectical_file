import 'package:flutter/material.dart';

class exam extends StatefulWidget {
  const exam({Key? key}) : super(key: key);

  @override
  _examState createState() => _examState();
}

class _examState extends State<exam> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
      appBar: AppBar(title: Text("Mitch Koko"),),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 12.0),
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 200,
                    width: 100,
                    child: Image.network("https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                  ),
                  Column(
                    children: [
                      Container(
                        child: Text("How do you feel?"),
                      ),
                      Container(
                        child: Text("fill out your medical"),
                      ),
                      Container(
                        child: Text("card right now"),
                      ),
                      SizedBox(height: 20,),
                      ElevatedButton(
                        child: const Text('Get Started'),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(

                          shadowColor: Colors.lightGreen,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: 50,
            width: 350,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.purple,
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: TextFormField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                    hintText: "how can we help you"),
              ),
            ),
          ),
          SizedBox(height: 30,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.purple,
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 30,),
                      Container(
                        height: 100,
                        width: 50,
                        child: Image.network("https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                      ),
                      SizedBox(width: 10,),
                      Text("Surgeon"),
                      SizedBox(width: 20,),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.purple,
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 30,),
                      Container(
                        height: 100,
                        width: 50,
                        child: Image.network("https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                      ),
                      SizedBox(width: 10,),
                      Text("Surgeon"),
                      SizedBox(width: 20,),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30,),
          Container(
            child: Row(
              children: [
                SizedBox(width: 20,),
                Text("Doctor List", style: TextStyle(
                  fontSize: 20,
                ),),
                SizedBox(width: 200,),
                Text("See all"),
                SizedBox(width: 20,),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              SizedBox(width: 10,),
              Container(
                height: 200,
                width: 150,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.purple,
                ),
                child: Column(
                  children: [
                    SizedBox(width: 10,),
                    Container(
                      height: 100,
                      width: 100,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage("https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text("Dr Marck"),
                    SizedBox(width: 5,),
                    Text("Phycologist"),
                  ],
                ),
              ),
              SizedBox(width: 30,),
              Container(
                height: 200,
                width: 150,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.purple,
                ),
                child: Column(
                  children: [
                    SizedBox(width: 10,),
                    Container(
                      height: 100,
                      width: 100,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage("https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text("Dr Marck"),
                    SizedBox(width: 5,),
                    Text("Phycologist"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      ),
    );
  }
}

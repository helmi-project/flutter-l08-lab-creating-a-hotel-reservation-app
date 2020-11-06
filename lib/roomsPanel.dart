import 'package:flutter/material.dart';

class RoomsPanel extends StatefulWidget {
  @override
  _RoomsPanelState createState() => _RoomsPanelState();
}

class NewItem {
  bool isExpanded;
  final Widget header;
  final String selection;
  final String body;

  NewItem(this.isExpanded, this.header, this.selection, this.body);
}

class _RoomsPanelState extends State<RoomsPanel> {
  List<NewItem> items = <NewItem>[
    NewItem(
      false,
      Container(
        child: Image(
          height: 100,
          width: 200,
          image: AssetImage('images/1bed.jpg'),
        ),
      ),
      "King Room",
      "A room with a king-sized bed.",
    ),
    NewItem(
      false,
      Container(
        child: Image(
          height: 100,
          width: 200,
          image: AssetImage('images/2beds.jpg'),
        ),
      ),
      "Double Room",
      "A room assigned to two people.",
    ),
    NewItem(
      false,
      Container(
        child: Image(
          height: 100,
          width: 200,
          image: AssetImage('images/3beds.jpg'),
        ),
      ),
      "Family Room",
      "A room assigned to three or four people.",
    ),
  ];

  ListView List_Criteria;

  Widget build(BuildContext context) {
    List_Criteria = new ListView(
      children: <Widget>[
        new Padding(
          padding: new EdgeInsets.all(10.0),
          child: new ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                items[index].isExpanded = !items[index].isExpanded;
              });
            },
            children: items.map((NewItem item) {
              return new ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return new ListTile(
                    leading: item.header,
                    title: new Text(
                      item.selection,
                      textAlign: TextAlign.left,
                      style: new TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  );
                },
                isExpanded: item.isExpanded,
                body: Text(
                  item.body,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );

    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text(
          "Rooms List",
          style: TextStyle(fontSize: 25.0, color: Colors.white),
        ),
      ),
      body: List_Criteria,
      persistentFooterButtons: <Widget>[
        ButtonBar(
          children: <Widget>[
            RaisedButton(
              color: Colors.orange,
              child: Text(
                'Next',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
    return scaffold;
  }
}

/*
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Android ATC Hotel',
            style: TextStyle(fontSize: 25.0, color: Colors.white),
          ),
        ),
        body: Container(
          child: Text('Home'),
        ),
      ),
    );
  }
}
*/

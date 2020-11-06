import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime checkInDate = DateTime.now();

  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: checkInDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null && picked != checkInDate) {
      setState(() {
        checkInDate = picked;
      });
    }
  }

  DateTime checkOutDate = DateTime.now();

  Future<Null> selectDate2(BuildContext context) async {
    final DateTime pickedout = await showDatePicker(
      context: context,
      initialDate: checkOutDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (pickedout != null && pickedout != checkOutDate) {
      setState(() {
        checkOutDate = pickedout;
      });
    }
  }

  var adult_Number = 0.0;
  var child_Number = 0.0;

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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image(
                        alignment: Alignment.topCenter,
                        width: 350.0,
                        image: AssetImage('images/entrance.jpg'),
                      ),
                    ],
                  ),
                  Row(
                    // This Row for Check-in Date : Android ATC - Lab 8
                    children: <Widget>[
                      Text(
                        'Check-in Date : ',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ('${checkInDate.year} - ${checkInDate.month} - ${checkInDate.day}')
                            .toString(),
                        style: TextStyle(fontSize: 20.0, color: Colors.blue),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.date_range,
                          color: Colors.deepOrangeAccent,
                        ),
                        onPressed: () {
                          selectDate(context);
                        },
                      ),
                    ],
                  ),
                  Row(
                    // This Row for Check-out Date
                    children: <Widget>[
                      Text(
                        'Check-out Date : ',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ('${checkOutDate.year} - ${checkOutDate.month} - ${checkOutDate.day}')
                            .toString(),
                        style: TextStyle(fontSize: 20.0, color: Colors.blue),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.date_range,
                          color: Colors.deepOrangeAccent,
                        ),
                        onPressed: () {
                          selectDate2(context);
                        },
                      ),
                    ],
                  ),
                  //** Here the code for Slider Widget : Number of Adults
                  Row(
                    children: <Widget>[
                      Text(
                        'Adults: '
                        '$adult_Number',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: 250.0,
                        child: Slider(
                          value: adult_Number,
                          onChanged: (newRating) {
                            setState(() {
                              adult_Number = newRating;
                            });
                          },
                          divisions: 6,
                          label: '$adult_Number.Adult',
                          min: 0,
                          max: 6,
                        ),
                      ),
                    ],
                  ),
                  //***** Here the code for Slider Widget : Number of Children
                  Row(
                    children: <Widget>[
                      Text(
                        'Children: '
                        '$child_Number',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: 250.0,
                        child: Slider(
                          value: child_Number,
                          onChanged: (newRating) {
                            setState(() {
                              child_Number = newRating;
                            });
                          },
                          divisions: 6,
                          label: '$child_Number.Children',
                          min: 0,
                          max: 6,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Extras :',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 200.0,
                    child: CheckboxGroup(
                      labelStyle: TextStyle(fontSize: 20.0),
                      labels: <String>[
                        "Breakfast (10 USD/Day)",
                        "Internet WiFi (5 USD/Day)",
                        "Parking (5 USD/Day)",
                        "Swimming Pool (10 USD/Day)",
                      ],
                      onSelected: (List<String> checked) =>
                          print(checked.toString()),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'View :',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: RadioButtonGroup(
                      orientation: GroupedButtonsOrientation.VERTICAL,
                      labelStyle: TextStyle(fontSize: 20.0),
                      labels: <String>[
                        "City View",
                        "Sea View",
                      ],
                      onSelected: (String selected) => print(selected),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.deepOrange,
                        child: Text(
                          'Check Rooms and Rates',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, 'RoomsPanel');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

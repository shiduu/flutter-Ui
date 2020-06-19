import 'package:flutter/material.dart';
import 'package:frontend/customShape_clipper.dart';
import 'package:frontend/homescreen_container.dart';
import 'package:frontend/lowerpart.dart';
import 'package:frontend/main.dart';

final Color discountBackground = Color(0XFFFFE08D);
final Color flightBorderColor = Color(0XFFE6E6E6);
final Color chipBackground = Color(0XFFF6F6F6);

class FlightListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Search for flights"),
          centerTitle: true,
          leading: InkWell(
              child: Icon(
                Icons.arrow_back,
              ),
              onTap: () {
                Navigator.of(context).pop();
              }),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
                  child: Column(
            children: <Widget>[
              FlightListTopPart(),
              SizedBox(height: 20,),
              FlightBotomPart()],
          ),
        ));
  }
}

// bottom part
class FlightBotomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Best deals for the next 6 months',
            style: dropDownMenuItemStyle,
          ),
          SizedBox(
            height: 10,
          ),
          ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              FLightCard(),
              FLightCard(),
              FLightCard(),
              FLightCard(),
              FLightCard(),
              FLightCard(),
            ],
          )
          
        ],
      ),
    );
  }
}

class FLightCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 16),
          //height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            border: Border.all(color: flightBorderColor),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      '${formatCurrency.format(4159)}',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '${(formatCurrency.format(41959))}',
                      style: TextStyle(
                          fontSize: 12,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey),
                    ),
                  ],
                ),
                Wrap(
                  spacing: 8,
                  runSpacing: -6,
                  children: <Widget>[
                    FlightDetailChip(Icons.calendar_today, 'may, 2020'),
                    FlightDetailChip(Icons.flight_takeoff, 'flight airways'),
                    FlightDetailChip(Icons.star, '4.5')
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 14,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text('55%', style: TextStyle(color: appTheme.primaryColor, fontSize: 12),),
            decoration: BoxDecoration(
              color: discountBackground,
              borderRadius: BorderRadius.all(Radius.circular(10),
              ),
              ),
          ),
        )
      ]),
    );
  }
}

class FlightDetailChip extends StatelessWidget {
  final IconData iconData;
  final String label;

  FlightDetailChip(this.iconData, this.label);
  @override
  Widget build(BuildContext context) {
    return RawChip(
      label: Text(label),
      labelStyle: TextStyle(color: Colors.black, fontSize: 11),
      backgroundColor: chipBackground,
      avatar: Icon(iconData, size: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    );
  }
}

// top part
class FlightListTopPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [firstColor, secondColor])),
            height: 160,
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                margin: EdgeInsets.symmetric(horizontal: 16),
                elevation: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 22),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Boston(BOS',
                              style: TextStyle(fontSize: 14),
                            ),
                            Divider(color: Colors.grey),
                            Text(
                              'New York City(JFK)',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.import_export,
                            color: Colors.black,
                            size: 28,
                          )),
                    ],
                  ),
                )),
          ],
        )
      ],
    );
  }
}

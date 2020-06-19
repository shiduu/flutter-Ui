import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:frontend/homescreen_container.dart';

const viewAllStyle = TextStyle(fontSize: 14, color: Color(0xFFF3791A));

class LowerPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'Currently watched items',
                  style: dropDownMenuItemStyle,
                ),
                Spacer(),
                Text(
                  'VIEW ALL (12)',
                  style: viewAllStyle,
                )
              ],
            ),
          ),
          Container(
            height: 230,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: cityCard,
            ),
          )
        ],
      ),
    );
  }
}

List<CityCard> cityCard = [
  CityCard(
      "assets/images/athens.jpg", "Athens", "Apr 2020", "45", "500", "600"),
  CityCard(
      "assets/images/lasvegas.jpg", "Lasvegas", "Apr 2020", "45", "500", "600"),
  CityCard(
      "assets/images/sydney.jpeg", "Sydney", "Apr 2020", "45", "500", "600"),
];
final formatCurrency = new NumberFormat.simpleCurrency();

class CityCard extends StatelessWidget {
  final String imagePath, cityName, monthYear, discount, oldPrice, newPrice;

  CityCard(this.imagePath, this.cityName, this.monthYear, this.discount,
      this.oldPrice, this.newPrice);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 150,
                  width: 140,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned( 
                  left: 0,
                  bottom: 0,
                  width: 140,
                  height: 80,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black,
                          Colors.black.withOpacity(0.1),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 10,
                  right: 10,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            cityName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16),
                          ),
                          Text(
                            monthYear,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                                fontSize: 12),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Text(
                          '$discount%',
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
            SizedBox(width: 2,),
            Text(' \$${(newPrice)} ', style: TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.bold),),
            SizedBox(width: 2,),
            Text('\$${(oldPrice)} ' , style: TextStyle(color: Colors.grey,fontSize: 16, fontWeight: FontWeight.normal),),
      ],)
        ],
      ),
    
    );
  }
}

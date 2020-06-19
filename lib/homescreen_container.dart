import 'package:flutter/material.dart';
import 'package:frontend/customShape_clipper.dart';
import 'package:frontend/flight_list.dart';

 Color firstColor = Color(0XFF00695C);
  Color secondColor = Color(0XFF00796B);

  List<String> locations = [
    'Nairobi (NBI',
    'Mombasa (MSA)',
  ];
  
const dropDownLabelStyle = TextStyle(color: Colors.white,fontSize: 16);
const dropDownMenuItemStyle = TextStyle(color: Colors.black,fontSize: 16);



class HomeScreenContainer extends StatefulWidget {
  @override
  _HomeScreenContainerState createState() => _HomeScreenContainerState();
}

class _HomeScreenContainerState extends State<HomeScreenContainer> {

  var selctedLocationIndex = 0;
  var isFlightSelected = true;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 400,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                firstColor,
                secondColor
              ],),
            ),
            //main column
            child: Column(
              children: <Widget>[
                SizedBox(height: 40),

                //first row starts here
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.location_on, color: Colors.white),
                      SizedBox(width: 16,),

                      PopupMenuButton(
                        onSelected: (index){
                          setState(() {
                            selctedLocationIndex = index;
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            Text(
                              locations[selctedLocationIndex],
                              style: dropDownLabelStyle
                            ),
                            Icon(Icons.keyboard_arrow_down, color: Colors.white,)
                          ],
                        ),
                         itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                           PopupMenuItem(
                             child: Text(locations[0], style: dropDownMenuItemStyle,),
                             value: 0,
                           ),
                           PopupMenuItem(
                             child: Text(locations[1], style: dropDownMenuItemStyle,),
                             value: 1,
                           ),

                         ]
                        ),
                        Spacer(),
                        Icon(Icons.settings, color: Colors.white,)
                    ],
                    
                  ),
                ),
               
               //second row
                SizedBox(height: 50),
                Text(
                  'Where would \n you want to go?',
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 24,             
                   ),
                   textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: TextField(
                      controller: TextEditingController(text: locations[1]),
                      style: dropDownMenuItemStyle,
                      cursorColor: Color(0xFFF3791A),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                        suffixIcon: Material(
                          elevation: 2,
                          borderRadius: BorderRadius.all(Radius.circular(30)),

                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> FlightListScreen()));
                            },
                            child: Icon(Icons.search, color: Colors.black),

                          ),
                        ),

                      ),
                    ),
                  ),
                ),

                //Third row
                SizedBox(height: 20,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(child: 
                    ChoiceChip(
                      Icons.flight_takeoff,
                       "flights",
                        isFlightSelected, ),
                        onTap: (){
                          setState(() {
                            isFlightSelected = true;
                          });
                        },),
                    SizedBox(width: 20,),
                    InkWell(child: ChoiceChip(Icons.hotel, "Hotels", !isFlightSelected),
                    onTap: () {
                      setState(() {
                        isFlightSelected = false;
                      });
                    },)
                  ],
                )
              ],
            ),
          ),
        )
      ],
      
    );
    
  }
}

class ChoiceChip extends StatefulWidget {

  final IconData icon;
  final String text;
  final bool isSelected;

  ChoiceChip(this.icon, this.text, this.isSelected);

  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical:8),
      decoration: widget.isSelected ? BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.all(Radius.circular(20))
      ): null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(
            widget.icon,
            size: 20,
            color: Colors.white,
            ),
          SizedBox(width: 8,),
          Text(
            widget.text,
             style: TextStyle(
              color: Colors.white,
              fontSize: 14
            ))
        ],
        
      ),
    );
  }
}

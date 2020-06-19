import 'package:flutter/material.dart';
import 'package:frontend/custom_appbar.dart';
import 'package:frontend/drawer.dart';
import 'package:frontend/homescreen_container.dart';
import 'package:frontend/lowerpart.dart';



void main() => 
    runApp(
      MaterialApp(
        title: 'flight List',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: HomeScreen(),
      )
  );

 

  ThemeData appTheme = ThemeData(
    primaryColor: Color(0XFF00796B),
    fontFamily: 'Oxygen'
  );

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.settings,
            //color: Colors.white,
          ),
          onPressed: () {
            // do something
          },
    )
  ],
      ),
      drawer: MainDrawer(),
      bottomNavigationBar: CustomAppBar(),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
          
            HomeScreenContainer(),
            LowerPart()

          ],
        ),
      ),
    );
  }
}


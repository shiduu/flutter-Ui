import 'package:flutter/material.dart';
import 'package:frontend/custom_appbar.dart';
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
    primaryColor: Color(0xFFF3791A),
    fontFamily: 'Oxygen'
  );

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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


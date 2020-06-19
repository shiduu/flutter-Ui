import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget {

  List< BottomNavigationBarItem> bottonBarItems = [];

  CustomAppBar(){
    bottonBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(Icons.home, color: Color(0xFFF3791A),),
        title: Text('Explore', style: TextStyle(color: Colors.black),),
        )

    );
     bottonBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite, color: Colors.black,),
        title: Text('Matchlist', style: TextStyle(color: Colors.black),),
        )

    );
     bottonBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(Icons.local_offer, color: Colors.black,),
        title: Text('Deals', style: TextStyle(color: Colors.black),),
        )

    );
     bottonBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(Icons.notifications, color: Colors.black,),
        title: Text('Notoications', style: TextStyle(color: Colors.black),),
        )

    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15,
          child: BottomNavigationBar(
        
        items: bottonBarItems,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
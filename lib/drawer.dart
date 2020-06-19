import 'package:flutter/material.dart';

import 'customShape_clipper.dart';

var listStyleTitle = TextStyle(fontWeight: FontWeight.w600, fontFamily: 'RobotoCondensed', color: Colors.white);
var listSubtitle = TextStyle(fontWeight: FontWeight.normal, fontFamily: 'RobotoCondensed', color: Colors.white);

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 16,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 12,
            fontWeight: FontWeight.w600),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: 220,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              color: Theme.of(context).primaryColor,
              child: Center(
                  child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: FittedBox(
                    
                      child: Icon(Icons.person),
                    
                  ),
                ),
                title: Text('Shidu', style: listStyleTitle),
                subtitle: Text('shidu@gmail.com', style: listSubtitle ),
              )
                  //Text(
                  // 'Recipe',
                  // style: TextStyle(
                  //   fontWeight: FontWeight.w700,
                  //   fontSize: 15,
                  //   color: Colors.white
                  // ),
                  // ),
                  ),
            ),
          ),
          SizedBox(height: 20),
          buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Settings', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed('/filter');
          }),
        ],
      ),
    );
  }
}

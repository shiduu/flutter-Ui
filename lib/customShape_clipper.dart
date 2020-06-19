import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper <Path>{
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height);

    var firstEndPoint = Offset(size.width* .5, size.height - 30.0);
    var fistControlPoint = Offset(size.height * 0.25, size.height - 60);

    path.quadraticBezierTo(fistControlPoint.dx, fistControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 80);
    var seconfControlPoint = Offset(size.width * .85, size.height -10);

     path.quadraticBezierTo(seconfControlPoint.dx, seconfControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close;
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;

}
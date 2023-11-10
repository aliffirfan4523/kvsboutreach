import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Card_Homepage extends StatelessWidget {
  Card_Homepage({super.key, required this.title, required this.image_url});

  String title;
  String image_url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.centerLeft,
          children: [
            Positioned(
              top: 10,
              left: 50,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff386A20),
                  border: Border.all(color: Color(0xff386A20)),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(50.0),
                    topRight: Radius.circular(50.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff386A20).withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(4, 4), // changes position of shadow
                    ),
                  ],
                ),
                height: 80,
                width: MediaQuery.of(context).size.width*0.8,
              ),
            ),
            Positioned(
              left: 2,
              child: TrapeziumShapeBorder()
            ),
            TrapeziumShapeWidget(image_url: image_url,),
            Positioned(
              //top: 35,
              left: 185,
              right: 15,
              child: Center(
                child: Text(
                  title, 
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
}

class TrapeziumShapeWidget extends StatelessWidget {
  TrapeziumShapeWidget({super.key, required this.image_url});

  final String image_url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
    	borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30.0),
				bottomLeft: Radius.circular(30.0),
      ),
      child: ClipPath(
        clipper: TrapeziumClipper(),
        child: Container(
          width: 200,
          height: 100,
          child: CachedNetworkImage(
            imageUrl: image_url,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    //colorFilter:ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                ),
              ),
            ),
            //placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
         	
        ),
      ),
    );
  }
}

class TrapeziumShapeBorder extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30.0),
        bottomLeft: Radius.circular(30.0),
      ),
      child: ClipPath(
        clipper: TrapeziumClipper(),
        child: Container(
          width: 200,
          height: 100,
          color: Colors.black26
        ),
      ),
    );
  }
}

class TrapeziumClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    var roundness = 30.0;

    path.moveTo(0,0);
    path.lineTo(size.width * 0.33 + roundness, 0);
    path.lineTo(size.width * 0.75 - roundness, 0);
    //path.quadraticBezierTo(size.width * 0.75 - roundness, 0, size.width, roundness );
    path.lineTo(size.width * 0.9 , size.height * 0.75 );
    path.conicTo(size.width * 0.9 , size.height * 0.75, size.width - roundness, size.height, 5);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
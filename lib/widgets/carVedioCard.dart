import 'package:flutter/material.dart';
class carVedioCCard extends StatelessWidget {
  String image;

  carVedioCCard(this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: 200,
      width: 320,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),

                  child: Image(


                    fit: BoxFit.fill,
                    image: AssetImage(

                      image,

                    ),
                  ),
                ),
            

              ],

              ),
              
            ),

          ),
        ),
      ),
    );
  }
}

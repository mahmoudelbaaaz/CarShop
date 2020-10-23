import 'package:flutter/material.dart';
import 'package:jobtask/widgets/badge.dart';
import 'package:jobtask/widgets/carCard.dart';
import 'package:jobtask/widgets/carVedioCard.dart';
import '../pre/my_flutter_app_icons.dart' as custicon;
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    void _openEndDrawer() {
      _scaffoldKey.currentState.openEndDrawer();
    }

    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type : BottomNavigationBarType.fixed,
          backgroundColor: Colors.purpleAccent,
           selectedItemColor: Colors.black,
  unselectedItemColor: Colors.white,
       currentIndex: 0, // this will be set when a new tab is tapped
       items: [
         BottomNavigationBarItem(
           title: new Text('التامين'), icon:   Icon(custicon.MyFlutterApp.people_carry,color: Colors.white,),
         ),
         BottomNavigationBarItem(
           icon:  Icon(custicon.MyFlutterApp.car_crash,color: Colors.white,),
           title: new Text('التثمين'),
           backgroundColor: Colors.purple
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.room_service),
           title: Text('الخدمات')
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.school),
           title: Text('الوكالات')
         ),
       ],
     ),
      key: _scaffoldKey,
      endDrawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('This is the Drawer'),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image(
                    image: AssetImage('images/nissan.jpg'),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(top: 20, right: 10.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        size: 24,
                        color: Colors.white,
                      ),
                      onPressed: () =>
                          _scaffoldKey.currentState.openEndDrawer(),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 20, left: 10.0),
                    child: Badge(
                      value: '12',
                      child: IconButton(
                          icon: Icon(
                        Icons.notifications,
                        color: Colors.white,
                      )),
                    ),
                  )
                ],
              ),
              Container(
                child: Text('تصفح حسب نوع السياره'),
                alignment: Alignment.topRight,
              ),
              Container(
                height: 110,
                child: carsTypebuildListView(),
              ),
              Divider(),
              Container(
                margin: EdgeInsets.only(right: 12, left: 12),
                child: highlitbuildRow("الكل", "تصفح حسب الماركات"),
              ),
              Container(
                height: 110,
                child: buildListView(),
              ),
              Container(
                margin: EdgeInsets.only(right: 12, left: 12),
                child: highlitbuildRow("الكل", "جديد الوكالات"),
              ),
              Container(
                height: 240,
                width: 380,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: <Widget>[
                    carCard("images/blueCar.jpg","تبدا من 129000 ك.د","Tesla i8"),
                    carCard("images/blueCar.jpg","تبدا من 129000 ك.د","new nissan"),
                    Container(
                      margin: EdgeInsets.only(right: 12, left: 12),
                    ),


                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 12, left: 12),
                child: highlitbuildRow("الكل", "فيديو"),
              ),
              Container(
                height: 187,
                width: 380,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                  carVedioCCard('images/tesla.png'),
                  carVedioCCard('images/tesla.png'),
                ],),
              )

            ],
          ),
        ),
      ),
    );
  }

  Row highlitbuildRow(String all, String description) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(all),
        Text(description),
      ],
    );
  }

  ListView buildListView() {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 15, left: 15),
          child: carModelbuildColumn('images/audi.png'),
        ),
        Container(
          margin: EdgeInsets.only(right: 15, left: 15),
          child: carModelbuildColumn('images/honda.jpeg'),
        ),
        Container(
          margin: EdgeInsets.only(right: 15, left: 15),
          child: carModelbuildColumn('images/lex.png'),
        ),
        Container(
          margin: EdgeInsets.only(right: 15, left: 15),
          child: carModelbuildColumn('images/lex.png'),
        ),
        Container(
          margin: EdgeInsets.only(right: 15, left: 15),
          child: carModelbuildColumn('images/mg.jpeg'),
        ),
      ],
    );
  }

  ListView carsTypebuildListView() {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 15, left: 15),
          child: carTypebuildColumn("SUV", 'images/LX.jpg'),
        ),
        Container(
          margin: EdgeInsets.only(right: 15, left: 15),
          child: carTypebuildColumn("sedan", 'images/LX.jpg'),
        ),
        Container(
          margin: EdgeInsets.only(right: 15, left: 15),
          child: carTypebuildColumn("Jeep", 'images/LX.jpg'),
        ),
        Container(
          margin: EdgeInsets.only(right: 15, left: 15),
          child: carTypebuildColumn("family", 'images/LX.jpg'),
        ),
      ],
    );
  }

  Column carTypebuildColumn(String carName, String image) {
    return Column(
      children: <Widget>[
        Image(
          image: AssetImage(image),
          width: 80,
          height: 80,
        ),
        Text(carName)
      ],
    );
  }

  Column carModelbuildColumn(String image) {
    return Column(
      children: <Widget>[
        Image(
          image: AssetImage(image),
          width: 80,
          height: 80,
        ),
      ],
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project/About%20us.dart';
import 'package:project/PageExpression.dart';
import 'package:project/PageFile.dart';
import 'package:project/PageVideo.dart';
import 'package:project/Profile.dart';
class Myhome extends StatefulWidget {
  const Myhome({Key? key}) : super(key: key);

  @override
  _MyhomeState createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _BuildAppbar,
        drawer: _BuildDrawer,
        body: _CrouselSlider,
        bottomNavigationBar: _BuildButtonBar,
      ),

    );
  }
  get _BuildButtonBar => BottomNavigationBar(
    //fixedColor: Colors.blue,
    //selectedItemColor: Colors.red,
    unselectedItemColor: Colors.blue,
    currentIndex: 1,
    items: [
      BottomNavigationBarItem(
        icon: InkWell(child: Icon(Icons.home),onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Myhome()));
        },),label: "Home"
      ),
      BottomNavigationBarItem(
          icon: InkWell(child: Icon(Icons.account_circle_rounded),onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile()));
          },),label: "Profile"
      ),
      BottomNavigationBarItem(
          icon: InkWell(
              child: Icon(Icons.info),
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> PageAboutUs())
          )),
          label: "About us"
      ),
    ],
  );
  get _BuildAppbar => AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 80),
        child: Text("Home",style: TextStyle(fontFamily: "f1"),)),

  );
  get _BuildDrawer => Drawer(
    child: ListView(
      children: [
        _DrawerHeader,
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Myhome()));
          },

        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text("Profile"),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Myhome()));
          },

        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text("About Us"),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => PageAboutUs()));
          },

        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text("Settings"),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Myhome()));
          },

        ),
        Divider(color: Colors.black,),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text("Logout"),
          onTap: (){
            Navigator.pop(context);
          },

        ),
      ],
    ),
  );
  get _DrawerHeader => Container(
    height: 250,
    decoration: BoxDecoration(
      color: Colors.blue,
      image: DecorationImage(
        image: AssetImage("images/pro.jpg"),
        fit: BoxFit.cover
      )
    ),
  );
  get _CrouselSlider => Container(
    child: ListView(
      children:[
        CarouselSlider(
          items: [
            //slider 1
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage("images/s3.jpg"),
                  fit: BoxFit.cover
                )
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage("images/s2.jpg"),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage("images/s1.jpg"),
                      fit: BoxFit.cover
                  )
              ),
            )
          ],
          options: CarouselOptions(
            height: 200,
            aspectRatio: 16/9,
            autoPlay: true,
            autoPlayAnimationDuration: Duration(seconds: 2),
            enlargeCenterPage: true,
            autoPlayCurve: Curves.fastLinearToSlowEaseIn,
            enableInfiniteScroll: true,
            viewportFraction: 0.8
          ),
        ),
        SizedBox(height: 20,),
        _myLession,
      ]
    ),
  );
  get _myLession => SingleChildScrollView(
    child: Container(
      child: Column(
        children: [
          _ex(),
          SizedBox(height: 20,),
          _video(),
          SizedBox(height: 20,),
          _file(),

        ],
      ),
    ),
  );
  _ex(){
    return InkWell(
      child: Stack(
        alignment: Alignment.center,
         children: [
          Container(
            alignment: Alignment.center,
            width: 350,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage("images/image lession/03.jpg"),
                  fit: BoxFit.cover
              ),
            ),
          ),
           Container(
             child: Text("លំហាត់",style: TextStyle(fontSize: 30,color: Colors.white,fontFamily: "f1"),),
           )
         ],
        ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyExpresstion()));
      },
    );
  }
  _video(){
    return InkWell(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            width: 350,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage("images/image lession/04.jpg"),
                  fit: BoxFit.cover
              ),
            ),
          ),
          Container(
            child: Text("Video",style: TextStyle(fontSize: 30,color: Colors.white,fontFamily: "f1"),),
          )
        ],
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Myvideo()));
      },
    );
  }
  _file(){
    return InkWell(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            width: 350,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage("images/image lession/05.jpg"),
                  fit: BoxFit.cover
              ),
            ),
          ),
          Container(
            child: Text("ឯកសារ",style: TextStyle(fontSize: 30,color: Colors.white,fontFamily: "f1"),),
          )
        ],
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> PageFile()));
      },
    );
  }
}

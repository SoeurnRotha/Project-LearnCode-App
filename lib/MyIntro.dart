import 'package:flutter/material.dart';
import 'package:project/MyHome.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class Myintro extends StatefulWidget {
  const Myintro({Key? key}) : super(key: key);

  @override
  _MyintroState createState() => _MyintroState();
}

class _MyintroState extends State<Myintro> {
  final _controller = PageController();
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody,
      bottomSheet: _buildButtonNexAndSkip,
    );
  }
  get _buildBody => Container(
    child: PageView(
      controller: _controller,
      onPageChanged: (index){
        setState(() => isLastPage = index == 2);
      },
      children: [
        background,
        _Develop("SARO SEREYVICHEA","images/chea.jpg"),
        _Develop("SOEURN ROTHA","images/rotha.jpg"),


      ],
    ),
  );
  get background => Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/back.jpg"),
            fit: BoxFit.cover
        )
    ),
    child: Stack(
      children: [
        _logo,
      ],
    ),
  );
  get _logo => Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: AssetImage("images/logo.png"),
        )
    ),
    child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 400),
      decoration: BoxDecoration(
      ),
      child: Text("Welcome to LearnCode",style: TextStyle(fontFamily: "s2",fontSize: 30,color: Colors.white),),
    ),
  );
  _Develop(String text,String img) =>Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(img),
        fit: BoxFit.cover
      )
    ),
    child: Container(
      padding: EdgeInsets.only(bottom: 500),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(("Develop by"),style: TextStyle(fontFamily: "s2",fontSize: 60,color: Colors.white),),
          SizedBox(height: 20,),
          Text(text,style: TextStyle(fontFamily: "s2",fontSize: 40,color: Colors.white),)
        ],
      ),
    ),
  );
  get _buildButtonNexAndSkip =>isLastPage ? TextButton(
    style: TextButton.styleFrom(
      minimumSize: Size.fromHeight(70),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
      primary: Colors.white,
      backgroundColor: Colors.blue
    ),
    child: Text("GetStart",style: TextStyle(fontSize: 30,fontFamily: "f1"),),
    onPressed: () async{
      Navigator.push(context, MaterialPageRoute(builder: (context) => Myhome()));
    },
  ) : Container(
    height: 60,
    child: Row(
     //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(right: 50),
          child: TextButton(
            child: Text("Skip"),
            onPressed: () => _controller.jumpToPage(2),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 30),
          child: SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: WormEffect(
              spacing: 16,
              activeDotColor: Colors.blue,
              dotColor: Colors.grey
            ),
            onDotClicked: (page) => _controller.animateToPage(page, duration: Duration(milliseconds: 100), curve: Curves.easeIn),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 50),
          child: TextButton(
            child: Text("Next"),
            onPressed: () => _controller.nextPage(duration: Duration(milliseconds: 100), curve: Curves.easeInOut)
          ),
        ),
      ],
    ),
  );
}

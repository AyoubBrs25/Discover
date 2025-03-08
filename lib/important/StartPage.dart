import 'package:discover/important/Sign&Register.dart';
import 'package:flutter/material.dart';
class start extends StatefulWidget {
  const start({super.key});

  @override
  State<start> createState() => _startState();
}

class _startState extends State<start> {
  double y = 0;

  navigate() async {
    await Future.delayed(Duration(milliseconds: 200 ), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EnterPage()));
  }

  @override
  Widget build(BuildContext context) {
    double scrwidth = MediaQuery.of(context).size.width;
    double scrheight = MediaQuery.of(context).size.height;
    return Container(
      width: scrwidth,
      height: scrheight,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assetes/Groupe 182.png'),
          fit: BoxFit.cover,
        )
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Explore Your \n Favorite Journey',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: 30 ,
                    fontFamily: 'Font2',
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Let's Make Our Life Better",
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontSize: 12,
                    fontFamily: 'Font2',
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
              width: 80,
              height: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                  colors: [
                    Color(0x41ffffff),
                    Color(0xE6FFFFFF),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                ),
              ),
              child: Center(
                child: GestureDetector(
                  onHorizontalDragStart: (details){
                    setState(() {
                      if( y == 0){
                        y = -90;
                        navigate();
                      }
                    });
                  },
                  onHorizontalDragUpdate: (details) {
                    setState(() {
                      y = y.clamp(-90, 0);
                    });
                  },
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.keyboard_arrow_up_rounded,
                            color: Color(0x91ffffff),
                            size: 60,
                          ),
                          Transform(
                            transform: Matrix4.translationValues(0, -45, 0),
                            child: Icon(
                              Icons.keyboard_arrow_up_rounded,
                              color: Color(0xffffffff),
                              size: 60,
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 0,
                        child: Center(
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            curve: Curves.easeOut,
                            transform: Matrix4.translationValues(0, y, 0),
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                color: Colors.white,
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child: Center(
                              child: Text(
                                'Go',
                                style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Font2',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}

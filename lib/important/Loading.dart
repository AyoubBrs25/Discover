import 'package:flutter/material.dart';
import 'package:discover/important/StartPage.dart';
class laoding extends StatefulWidget {
  const laoding({super.key});

  @override
  State<laoding> createState() => _laodingState();
}

class _laodingState extends State<laoding> {
  @override
  void initState() {
    super.initState();
    navigate();
  }
  navigate() async {
    await Future.delayed(Duration(milliseconds: 3000  ), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => start()));
  }

  @override
  Widget build(BuildContext context) {
    double scrwidth = MediaQuery.of(context).size.width;
    double scrheight = MediaQuery.of(context).size.height;
    return Container(
      height: scrheight,
      width: scrwidth,
      color: Colors.white,
      child: Center(
        child: Container(
          width: 180,
          height: 180,
          child: Image(
            image: AssetImage('assetes/discover.png'),
          ),
        ),
      ),
    );
  }
}

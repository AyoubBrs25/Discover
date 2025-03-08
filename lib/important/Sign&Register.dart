import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:discover/secondry/listview_scroll.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'dart:async';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../secondry/provide.dart';

class EnterPage extends StatefulWidget {
  const EnterPage({super.key});

  @override
  State<EnterPage> createState() => _EnterPageState();
}
class _EnterPageState extends State<EnterPage> {

  LocaleProvider? localeProvider1;
  @override
  void initState() {
    super.initState();
    localeProvider1 = Provider.of<LocaleProvider>(context, listen: false);
  }

  //changer index
  int indc = 0;
  //login
  bool Focused = false;                            //forget password                                //Register
  bool Focused1 = false;                             final phoncnt = TextEditingController();         bool Focused01 = false;      final usercnt = TextEditingController();
  String errormsg = 'Must entre a password!';        bool Focused2 = false;                           bool Focused02 = false;      final emailcnt = TextEditingController();
  final contrl = TextEditingController();            int counter = 30;                                bool Focused03 = false;      final mtpcnt = TextEditingController();
  final ctrusr = TextEditingController();            Timer? time;                                     bool Focused04 = false;      final cnfmtpcnt = TextEditingController();
  double txtop = 1;                                  bool resend = false;                             bool showpasswrd01 = false;  double iconop = 0;
  bool showpasswrd = false;                                                                           bool showpasswrd02 = false;

  final FocusNode focusNode1 = FocusNode();       final FocusNode focusNode2 = FocusNode();        final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();
  @override
 Widget build(BuildContext context) {
    @override
    double scrwidth = MediaQuery.of(context).size.width;
    double scrheight = MediaQuery.of(context).size.height;
    return  MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: Scaffold(
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll){
            overscroll.disallowIndicator();
            return false;
          },
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: NoGlowScrollPhysics(),
            itemCount: 1,
              itemBuilder: (context , index){
              index = indc;
                return  pages(scrwidth,scrheight, index);
              },
          ),
        ),
      ),
    ) ;
  }


  Widget pages (w , h , i){
    List<Widget> page = [
      //first page
      Container(
        padding: EdgeInsets.only(bottom: 25),
        width: w,
        height: h,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assetes/Groupe 273.png'),
                fit: BoxFit.cover
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            AnimatedContainer(
              transform: Matrix4.translationValues(0, 0, 0),
              duration: Duration(milliseconds: 500),
              margin: EdgeInsets.only(bottom: 15),
              width: 300 ,
              height: 55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black
              ),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    indc = 1;
                  });
                },
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent)
                ),
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Font2',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: 300 ,
              height: 55 ,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xFFF38000),
              ),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    indc = 4;
                  });
                },
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent)
                ),
                child: Center(
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Font2',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),

      //login page
      Stack(
        children : <Widget> [
         Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          width: w,
          height: h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assetes/Groupe 273.png'),
              fit: BoxFit.cover,
            )
          ),
          child: ListView(
            children: <Widget>[
              Form(
                child: Stack(
                  children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 30, top: 100),
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Color(0xFFF38000),
                              fontFamily: 'Font2',
                              fontSize: 43,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 50),
                        width: w,
                        height: 220,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow : [BoxShadow(
                              color: Color(0x29000000),
                              offset: Offset(0,3),
                              blurRadius: 10,
                              spreadRadius: 3
                          ),],
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(18, 10, 18, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Focus(
                                onFocusChange: (hasFocus) {
                                  setState(() {
                                    Focused = hasFocus;
                                  });
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Focused? Color(0xFFF38000) : Color(0x80000000),
                                        width: 1.2,
                                      ),
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    padding: EdgeInsets.fromLTRB(7, 2, 2, 1.5),
                                    child: TextFormField(
                                      onEditingComplete: () {
                                        FocusScope.of(context).requestFocus(focusNode1);
                                      },
                                      controller: ctrusr,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontFamily: 'Font2',
                                          fontWeight: FontWeight.bold
                                      ),
                                      decoration: InputDecoration(
                                        suffixIcon: Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Icon(
                                            EvaIcons.person,
                                            size: 25 ,
                                          ),
                                        ),
                                        suffixIconColor: Color(0xFF463EC9),
                                        contentPadding: EdgeInsets.all(5),
                                        label: Padding(
                                          padding: EdgeInsets.only(left: 5),
                                          child: Text(
                                            'Username',
                                            style: TextStyle(
                                               fontFamily: 'Font2',
                                               color: Focused? Color(0xFFF38000) : Color(0x99000000),
                                               fontSize: 18,
                                               fontWeight: FontWeight.w800
                                            ),
                                          ),
                                        ),
                                        border: InputBorder.none,
                                      ),
                                      cursorColor: Color(0x66000000),
                                      cursorWidth: 1,
                                    ),
                                  ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Focus(
                                onFocusChange: (hasFocus) {
                                  setState(() {
                                    Focused1 = hasFocus;
                                    if(contrl.text.length > 0){
                                      errormsg ='Must be 6 letters or more!';
                                    }else{
                                      errormsg ='Must entre a password!';
                                    }
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Focused1? Color(0xFFF38000) : Color(0x80000000),
                                        width: 1.2,
                                      ),
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  padding: EdgeInsets.fromLTRB(7, 2, 2, 1.5),
                                  child: TextFormField(
                                    focusNode: focusNode1,
                                    controller: contrl,
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Font2',
                                        fontWeight: FontWeight.bold
                                    ),
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        style: ButtonStyle(
                                          overlayColor: MaterialStateProperty.all(Colors.transparent),
                                        ),
                                        padding: EdgeInsets.only(left: 10),
                                        icon: showpasswrd ?
                                            Icon(EvaIcons.eyeOff) :
                                            Icon(EvaIcons.eye),
                                        onPressed: () {
                                          setState(() {
                                            showpasswrd =! showpasswrd;
                                          });
                                        }
                                      ),
                                      suffixIconColor: Color(0xFF463EC9),
                                      contentPadding: EdgeInsets.all(5),
                                      label: Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Text(
                                          'Password',
                                          style: TextStyle(
                                              fontFamily: 'Font2',
                                              color: Focused1? Color(0xFFF38000) : Color(0x99000000),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w800
                                          ),
                                        ),
                                      ),
                                      border: InputBorder.none,
                                    ),
                                    cursorColor: Color(0x66000000),
                                    cursorWidth: 1,
                                    obscureText: !showpasswrd,
                                  ),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget> [
                                 Transform(
                                    transform: Matrix4.translationValues(10, 5, 0),
                                    child: Opacity(
                                      opacity: (!Focused1 && contrl.text.length>6) ||
                                          (!Focused1 && contrl.text.length ==0
                                              && errormsg =='Must entre a password!')
                                          ||(Focused1 && contrl.text.length>6) ? 0 : 1,
                                      child: Text(
                                        '$errormsg',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontFamily: 'Font2',
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFFF38000)
                                        ),
                                      ),
                                    ),
                                  ),
                                  Transform(
                                    transform: Matrix4.translationValues(0, -8, 0),
                                    child: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            indc = 2;
                                          });
                                        },
                                        child: Text(
                                          'Forget Password ?',
                                          style: TextStyle(
                                            color: Color(0xFF463EC9),
                                            fontSize: 13,
                                            fontFamily: 'Font2',
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        style: ButtonStyle(
                                          overlayColor: MaterialStateProperty.all(Colors.transparent),
                                        ),
                                      ),
                                  ),
                                ]
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                    Transform(
                      transform: Matrix4.translationValues(0, 380, 0),
                      child: Center(
                        child: Container(
                          width: 150 ,
                          height: 50 ,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xFFF38000),
                            boxShadow : [BoxShadow(
                                color: Color(0x29000000),
                                offset: Offset(0,3),
                                blurRadius: 10,
                                spreadRadius: 3
                            ),],
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                if(ctrusr.text != localeProvider1?.userkepr || contrl.text != localeProvider1?.mtpkepr || (ctrusr.text != localeProvider1?.userkepr && contrl.text != localeProvider1?.mtpkepr )){
                                  erroralert();
                                }else{
                                  Navigator.pushReplacementNamed(context, 'home');
                                }
                              });
                            },
                            style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(Colors.transparent)
                            ),
                            child: Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'Font2',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]
                ),
              ),
            ],
          ),
        ),
          Transform(
            transform: Matrix4.translationValues(0, 20, 0),
            child: IconButton(
              onPressed: () {
                setState(() {
                  indc = 0;
                  ctrusr.text = '';
                  contrl.text = '';
                  errormsg ='Must entre a password!';
                });
              },
              icon: Icon(
                EvaIcons.arrowIosBack,
                size: 30,
                color: Color(0xFF463EC9),
              ),
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent)
              ),
            ),
          )
       ]
      ),

      //Forget password page
      Stack(
          children : <Widget> [
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              width: w,
              height: h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assetes/Groupe 273.png'),
                    fit: BoxFit.cover,
                  )
              ),
              child: ListView(
                children: <Widget>[
                  Form(
                    child: Stack(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(bottom: 30, top: 100),
                                child: Text(
                                  'Forget Password',
                                  style: TextStyle(
                                      color: Color(0xFFF38000),
                                      fontFamily: 'Font2',
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 50),
                                width: w,
                                height: 116,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow : [BoxShadow(
                                      color: Color(0x29000000),
                                      offset: Offset(0,3),
                                      blurRadius: 10,
                                      spreadRadius: 3
                                  ),],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Focus(
                                        onFocusChange: (hasFocus) {
                                          setState(() {
                                            Focused2 = hasFocus;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Focused2? Color(0xFFF38000) : Color(0x80000000),
                                                width: 1.2,
                                              ),
                                              borderRadius: BorderRadius.circular(10)
                                          ),
                                          padding: EdgeInsets.fromLTRB(10, 2, 2, 1.5),
                                          child: Stack(
                                            children: <Widget>[
                                            InternationalPhoneNumberInput(
                                              onInputChanged: (PhoneNumber phoneNumber) {
                                              },
                                              formatInput: false,
                                              selectorConfig: SelectorConfig(
                                                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                                              ),
                                              cursorColor: Color(0x80000000),
                                              inputDecoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(bottom: 14, left: 0),
                                                border: InputBorder.none,
                                                label: Padding(
                                                  padding: EdgeInsets.only(left: 2, top: 2),
                                                  child: Text(
                                                    'Phone Number',
                                                    style: TextStyle(
                                                        fontFamily: 'Font2',
                                                        color: Focused2? Color(0xFFF38000) : Color(0x99000000),
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w800
                                                    ),
                                                  ),
                                                ),
                                                counterText: '',
                                              ),
                                              textFieldController: phoncnt,
                                              maxLength: 9,
                                            ),
                                              Positioned(
                                                left: 90,
                                                top: 8,
                                                bottom: 8,
                                                child: Container(
                                                  height: 40,
                                                  width: 1,
                                                  color: Focused2? Color(0xFFF38000) : Color(0x80000000),
                                                ),
                                              ),
                                              Center(
                                                child: Transform(
                                                  transform: Matrix4.translationValues(118, 18, 0),
                                                  child: Icon(
                                                    EvaIcons.phone,
                                                    color: Color(0xFF463EC9),
                                                    size: 20,
                                                  ),
                                                ),
                                              )
                                            ]
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Transform(
                            transform: Matrix4.translationValues(0, 263, 0),
                            child: Center(
                              child: Container(
                                width: 140 ,
                                height: 50 ,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color(0xFFF38000),
                                  boxShadow : [BoxShadow(
                                      color: Color(0x29000000),
                                      offset: Offset(0,3),
                                      blurRadius: 10,
                                      spreadRadius: 3
                                  ),],
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    if(phoncnt.text.length == 9 && phoncnt.text == '696135644'){
                                      setState(() {
                                        indc = 3;
                                        StartTime();
                                      });
                                    }
                                  },
                                  style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all(Colors.transparent)
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Send',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontFamily: 'Font2',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]
                    ),
                  ),
                ],
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(0, 20, 0),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    indc = 1;
                    phoncnt.text = '';
                  });
                },
                icon: Icon(
                  EvaIcons.arrowIosBack,
                  size: 30,
                  color: Color(0xFF463EC9),
                ),
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent)
                ),
              ),
            )
          ]
      ),

      //Verifiacation numbe
      Stack(
          children : <Widget> [
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              width: w,
              height: h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assetes/Groupe 273.png'),
                    fit: BoxFit.cover,
                  )
              ),
              child: ListView(
                children: <Widget>[
                  Stack(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(bottom: 30, top: 100),
                              child: Text(
                                'Forget Password',
                                style: TextStyle(
                                    color: Color(0xFFF38000),
                                    fontFamily: 'Font2',
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 50),
                              width: w,
                              height: 135,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow : [BoxShadow(
                                    color: Color(0x29000000),
                                    offset: Offset(0,3),
                                    blurRadius: 10,
                                    spreadRadius: 3
                                ),],
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
                                child: Form(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: Center(
                                          child: TextFormField(
                                            onChanged: (value) {
                                              if(value.length == 1){
                                                FocusScope.of(context).nextFocus();
                                              }
                                            },
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 20
                                            ),
                                            decoration: InputDecoration(
                                              contentPadding: EdgeInsets.all(0),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                            ),
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(1),
                                              FilteringTextInputFormatter.digitsOnly
                                            ],
                                          ),
                                        ),
                                      ),                                      SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: Center(
                                          child: TextFormField(
                                            onChanged: (value) {
                                              if(value.length == 1){
                                                FocusScope.of(context).nextFocus();
                                              }
                                            },
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 20
                                            ),
                                            decoration: InputDecoration(
                                              contentPadding: EdgeInsets.all(0),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                            ),
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(1),
                                              FilteringTextInputFormatter.digitsOnly
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: Center(
                                          child: TextFormField(
                                            onChanged: (value) {
                                              if(value.length == 1){
                                                FocusScope.of(context).nextFocus();
                                              }
                                            },
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 20
                                            ),
                                            decoration: InputDecoration(
                                              contentPadding: EdgeInsets.all(0),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                            ),
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(1),
                                              FilteringTextInputFormatter.digitsOnly
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: Center(
                                          child: TextFormField(
                                            onChanged: (value) {
                                              if(value.length == 1){
                                                FocusScope.of(context).nextFocus();
                                              }
                                            },
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 20
                                            ),
                                            decoration: InputDecoration(
                                              contentPadding: EdgeInsets.all(0),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                            ),
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(1),
                                              FilteringTextInputFormatter.digitsOnly
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ),
                              )
                            )
                          ]
                        ),
                        Transform(
                          transform: Matrix4.translationValues(0, 281, 0),
                          child: Center(
                            child: Container(
                              width: 140 ,
                              height: 50 ,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(0xFFF38000),
                                boxShadow : [BoxShadow(
                                    color: Color(0x29000000),
                                    offset: Offset(0,3),
                                    blurRadius: 10,
                                    spreadRadius: 3
                                ),],
                              ),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                  });
                                },
                                style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.all(Colors.transparent)
                                ),
                                child: Center(
                                  child: Text(
                                    'Verifay',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: 'Font2',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Transform(
                          transform: Matrix4.translationValues(90,250, 0),
                          child: Row(
                            children: <Widget>[
                              Center(
                                child: Text(
                                  'Resend code after $counter',
                                  style: TextStyle(
                                      fontFamily: 'Font2',
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ]
                  ),
                ]
              ),
            ),
          ]
      ),

      //Register page
      Stack(
          children : <Widget> [
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              width: w,
              height: h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assetes/Groupe 273.png'),
                    fit: BoxFit.cover,
                  )
              ),
              child: ListView(
                children: <Widget>[
                  Stack(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(bottom: 30, top: 100),
                              child: Text(
                                'Create Account',
                                style: TextStyle(
                                    color: Color(0xFFF38000),
                                    fontFamily: 'Font2',
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 50),
                              width: w,
                              height: 350,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow : [BoxShadow(
                                    color: Color(0x29000000),
                                    offset: Offset(0,3),
                                    blurRadius: 10,
                                    spreadRadius: 3
                                ),],
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(18, 20, 18, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Focus(
                                      onFocusChange: (hasFocus) {
                                        setState(() {
                                          Focused01 = hasFocus;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Focused01 ? Color(0xFFF38000) : Color(0x80000000),
                                              width: 1.2,
                                            ),
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        padding: EdgeInsets.fromLTRB(7, 2, 2, 1.5),
                                        child: TextFormField(
                                          onEditingComplete: () {
                                            FocusScope.of(context).requestFocus(focusNode2);
                                          },
                                          controller: usercnt,
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontFamily: 'Font2',
                                              fontWeight: FontWeight.bold
                                          ),
                                          decoration: InputDecoration(
                                            suffixIcon: Padding(
                                              padding: EdgeInsets.only(left: 10),
                                              child: Icon(
                                                EvaIcons.person,
                                                size: 25 ,
                                              ),
                                            ),
                                            suffixIconColor: Color(0xFF463EC9),
                                            contentPadding: EdgeInsets.all(5),
                                            label: Padding(
                                              padding: EdgeInsets.only(left: 5),
                                              child: Text(
                                                'Username',
                                                style: TextStyle(
                                                    fontFamily: 'Font2',
                                                    color: Focused01? Color(0xFFF38000) : Color(0x99000000),
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w800
                                                ),
                                              ),
                                            ),
                                            border: InputBorder.none,
                                          ),
                                          cursorColor: Color(0x66000000),
                                          cursorWidth: 1,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Focus(
                                      onFocusChange: (hasFocus) {
                                        setState(() {
                                          Focused02 = hasFocus;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Focused02 ? Color(0xFFF38000) : Color(0x80000000),
                                              width: 1.2,
                                            ),
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        padding: EdgeInsets.fromLTRB(7, 2, 2, 1.5),
                                        child: TextFormField(
                                          focusNode: focusNode2,
                                          onEditingComplete: () {
                                            FocusScope.of(context).requestFocus(focusNode3);
                                          },
                                          controller: emailcnt,
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontFamily: 'Font2',
                                              fontWeight: FontWeight.bold
                                          ),
                                          decoration: InputDecoration(
                                            suffixIcon: Padding(
                                              padding: EdgeInsets.only(left: 10),
                                              child: Icon(
                                                EvaIcons.email,
                                                size: 25 ,
                                              ),
                                            ),
                                            suffixIconColor: Color(0xFF463EC9),
                                            contentPadding: EdgeInsets.all(5),
                                            label: Padding(
                                              padding: EdgeInsets.only(left: 5),
                                              child: Text(
                                                'Email',
                                                style: TextStyle(
                                                    fontFamily: 'Font2',
                                                    color: Focused02? Color(0xFFF38000) : Color(0x99000000),
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w800
                                                ),
                                              ),
                                            ),
                                            border: InputBorder.none,
                                          ),
                                          cursorColor: Color(0x66000000),
                                          cursorWidth: 1,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Focus(
                                      onFocusChange: (hasFocus) {
                                        setState(() {
                                          Focused03 = hasFocus;
                                          if(mtpcnt.text.length > 0){
                                            errormsg ='Must be 6 letters or more!';
                                          }else{
                                            errormsg ='Must entre a password!';
                                          }
                                          if(Focused03 || Focused04 && (mtpcnt.text.length >= 1 && cnfmtpcnt.text.length >= 1)){
                                            iconop = 1;
                                          }else{
                                            iconop = 0;
                                          }
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Focused03? Color(0xFFF38000) : Color(0x80000000),
                                              width: 1.2,
                                            ),
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        padding: EdgeInsets.fromLTRB(7, 2, 2, 1.5),
                                        child: TextFormField(
                                          focusNode: focusNode3,
                                          onEditingComplete: () {
                                            FocusScope.of(context).requestFocus(focusNode4);
                                          },
                                          controller: mtpcnt,
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontFamily: 'Font2',
                                              fontWeight: FontWeight.bold
                                          ),
                                          decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                                style: ButtonStyle(
                                                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                                                ),
                                                padding: EdgeInsets.only(left: 10),
                                                icon: showpasswrd01 ?
                                                Icon(EvaIcons.eyeOff) :
                                                Icon(EvaIcons.eye),
                                                onPressed: () {
                                                  setState(() {
                                                    showpasswrd01 =! showpasswrd01;
                                                  });
                                                }
                                            ),
                                            suffixIconColor: Color(0xFF463EC9),
                                            contentPadding: EdgeInsets.all(5),
                                            label: Padding(
                                              padding: EdgeInsets.only(left: 5),
                                              child: Text(
                                                'Password',
                                                style: TextStyle(
                                                    fontFamily: 'Font2',
                                                    color: Focused03? Color(0xFFF38000) : Color(0x99000000),
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w800
                                                ),
                                              ),
                                            ),
                                            border: InputBorder.none,
                                          ),
                                          cursorColor: Color(0x66000000),
                                          cursorWidth: 1,
                                          obscureText: !showpasswrd01,
                                        ),
                                      ),
                                    ),
                                    Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget> [
                                          Transform(
                                            transform: Matrix4.translationValues(10, 5, 0),
                                            child: Opacity(
                                              opacity: (!Focused03 && mtpcnt.text.length>6) ||
                                                  (!Focused03 && mtpcnt.text.length ==0
                                                      && errormsg =='Must entre a password!')
                                                  ||(Focused03 && mtpcnt.text.length>6) ? 0 : 1,
                                              child: Text(
                                                '$errormsg',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    fontFamily: 'Font2',
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xFFF38000)
                                                ),
                                              ),
                                            ),
                                          ),
                                        ]
                                    ),
                                    SizedBox(
                                      height: (!Focused03 && mtpcnt.text.length>6) ||
                                          (!Focused03 && mtpcnt.text.length ==0
                                              && errormsg =='Must entre a password!')
                                          ||(Focused03 && mtpcnt.text.length>6) ? 0 : 15,
                                    ),
                                    Focus(
                                      onFocusChange: (hasFocus) {
                                        setState(() {
                                          Focused04 = hasFocus;
                                          if(Focused03 || Focused04 && (mtpcnt.text.length >= 1 && cnfmtpcnt.text.length >= 1)){
                                            iconop = 1;
                                          }else{
                                            iconop = 0;
                                          }
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Focused04? Color(0xFFF38000) : Color(0x80000000),
                                              width: 1.2,
                                            ),
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        padding: EdgeInsets.fromLTRB(7, 2, 2, 1.5),
                                        child: TextFormField(
                                          focusNode: focusNode4,
                                          controller: cnfmtpcnt,
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontFamily: 'Font2',
                                              fontWeight: FontWeight.bold
                                          ),
                                          decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                                style: ButtonStyle(
                                                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                                                ),
                                                padding: EdgeInsets.only(left: 10),
                                                icon: showpasswrd02 ?
                                                Icon(EvaIcons.eyeOff) :
                                                Icon(EvaIcons.eye),
                                                onPressed: () {
                                                  setState(() {
                                                    showpasswrd02 =! showpasswrd02;
                                                  });
                                                }
                                            ),
                                            suffixIconColor: Color(0xFF463EC9),
                                            contentPadding: EdgeInsets.all(5),
                                            label: Padding(
                                              padding: EdgeInsets.only(left: 5),
                                              child: Text(
                                                'Confirm Password',
                                                style: TextStyle(
                                                    fontFamily: 'Font2',
                                                    color: Focused04? Color(0xFFF38000) : Color(0x99000000),
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w800
                                                ),
                                              ),
                                            ),
                                            border: InputBorder.none,
                                          ),
                                          cursorColor: Color(0x66000000),
                                          cursorWidth: 1,
                                          obscureText: !showpasswrd02,
                                        ),
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.translationValues(120, 0, 0),
                                      child: Opacity(
                                        opacity:iconop,
                                        child: mtpcnt.text == cnfmtpcnt.text ?
                                        Icon(
                                          EvaIcons.checkmark,
                                          color: Colors.green,
                                          size: 20,
                                        ):
                                        Icon(
                                          EvaIcons.close,
                                          color: Colors.red,
                                          size: 20,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Transform(
                          transform: Matrix4.translationValues(0, 504, 0),
                          child: Center(
                            child: Container(
                              width: 150 ,
                              height: 50 ,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(0xFFF38000),
                                boxShadow : [BoxShadow(
                                    color: Color(0x29000000),
                                    offset: Offset(0,3),
                                    blurRadius: 10,
                                    spreadRadius: 3
                                ),],
                              ),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                      Navigator.pushReplacementNamed(context, 'home' ,arguments: {
                                        'name' : usercnt.text,
                                        'email' : emailcnt.text,
                                        'mtp' : mtpcnt.text,
                                        'width':w,
                                        'height':h
                                      });
                                  });
                                },
                                style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.all(Colors.transparent)
                                ),
                                child: Center(
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: 'Font2',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]
                  ),
                ],
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(0, 20, 0),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    indc = 0;
                    usercnt.text = '';
                    mtpcnt.text = '';
                    emailcnt.text = '';
                    cnfmtpcnt.text = '';
                    errormsg ='Must entre a password!';
                  });
                },
                icon: Icon(
                  EvaIcons.arrowIosBack,
                  size: 30,
                  color: Color(0xFF463EC9),
                ),
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent)
                ),
              ),
            )
          ]
      ),
    ];

    return page[i];
  }





  //alert login msg
  void erroralert() {
    showDialog(context: context, builder: (BuildContext) {
      return Center(
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          ),
          contentPadding: EdgeInsets.all(0),
          content: Container(
            height: 120,
            width: 180,
            decoration: BoxDecoration(
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  (contrl.text.length == 0 && ctrusr.text.length == 0)?
                  'You must enter your user name and password..' :
                  'Your username or password are wrong please try agian.',
                  style: TextStyle(
                    fontFamily: 'Font2',
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    color: Colors.black
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  width: 150 ,
                  height: 35 ,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFFF38000),
                    boxShadow : [BoxShadow(
                        color: Color(0x29000000),
                        offset: Offset(0,3),
                        blurRadius: 10,
                        spreadRadius: 3
                    ),],
                  ),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        indc = 2;
                        Navigator.of(context).pop();
                      });
                    },
                    style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(Colors.transparent)
                    ),
                    child: Center(
                      child: Text(
                        'Get Password',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Font2',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  //alert creating msg
  void erroralert1() {
    showDialog(context: context, builder: (BuildContext) {
      return Center(
        child: AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
          ),
          contentPadding: EdgeInsets.all(0),
          content: Container(
            height: 120,
            width: 180,
            decoration: BoxDecoration(
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'You must enter your user name and password..',
                  style: TextStyle(
                      fontFamily: 'Font2',
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      color: Colors.black
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  width: 150 ,
                  height: 35 ,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFFF38000),
                    boxShadow : [BoxShadow(
                        color: Color(0x29000000),
                        offset: Offset(0,3),
                        blurRadius: 10,
                        spreadRadius: 3
                    ),],
                  ),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        Navigator.of(context).pop();
                      });
                    },
                    style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(Colors.transparent)
                    ),
                    child: Center(
                      child: Text(
                        'Try Agin',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Font2',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
  //Timer
  void StartTime(){
    time = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if(counter > 0){
          counter--;
        }else{
          time?.cancel();
          resend = true;
        }
      });
      Resend();
    });
  }

  //resend code
  void Resend(){
    if(resend){
      setState(() {
        indc = 2;
        counter = 30;
        resend = false;
      });
    }
  }
}
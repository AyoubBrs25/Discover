import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:discover/secondry/provide.dart';
import 'package:provider/provider.dart';

import '../secondry/themes.dart';
class Prticivy extends StatefulWidget {
  const Prticivy({super.key});

  @override
  State<Prticivy> createState() => _PersonamInfoState();
}

class _PersonamInfoState extends State<Prticivy> {
  bool Focused = false;
  bool Focused01 = false;
  final mtpcnt = TextEditingController();
  bool Focused1 = false;
  bool Focused02 = false;
  final emailcnt = TextEditingController();
  String errormsg = 'Must entre a password!';
  final cnfmtpcnt = TextEditingController();
  final cnfmtpcnt1 = TextEditingController();
  double txtop = 1;
  double iconop = 0;
  bool showpasswrd = false;
  bool showpasswrd1 = false;
  bool showpasswrd2= false;
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();

  @override
  Widget build(BuildContext context) {
    LocaleProvider localeProvider = Provider.of<LocaleProvider>(context);
    return Scaffold(
      backgroundColor: localeProvider.mode,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            localeProvider.appLocale.languageCode == 'ar'? EvaIcons.arrowIosForward :
            EvaIcons.arrowIosBack,
            size: 30,
            color: second,
          ),
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent)
          ),
        ),
        elevation: 0,
        title: Align(
          alignment: localeProvider.appLocale.languageCode == 'ar'? Alignment.topLeft : Alignment.topRight,
          child: Text(
            AppLocalizations.of(context)!.prvi,
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'Font2',
              fontWeight: FontWeight.bold,
              color: second,
            ),
          ),
        ),
        backgroundColor: localeProvider.mode,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 25),
                  child: Column(
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
                                color: Focused01? Color(0xFFF38000) : Color(0x80000000),
                                width: 1.2,
                              ),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          padding: EdgeInsets.fromLTRB(7, 2, 2, 1.5),
                          child: TextFormField(
                            focusNode: focusNode1,
                            onEditingComplete: () {
                              FocusScope.of(context).requestFocus(focusNode1);
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
                                  'Current Password',
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
                            obscureText: !showpasswrd,
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
                            if(mtpcnt.text.length > 0){
                              errormsg ='Must be 6 letters or more!';
                            }else{
                              errormsg ='Must entre a password!';
                            }
                            if(Focused1 || Focused02 && (cnfmtpcnt.text.length >= 1 && cnfmtpcnt1.text.length >= 1)){
                              iconop = 1;
                            }else{
                              iconop = 0;
                            }
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Focused02? Color(0xFFF38000) : Color(0x80000000),
                                width: 1.2,
                              ),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          padding: EdgeInsets.fromLTRB(7, 2, 2, 1.5),
                          child: TextFormField(
                            focusNode: focusNode2,
                            onEditingComplete: () {
                              FocusScope.of(context).requestFocus(focusNode2);
                            },
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
                                  icon: showpasswrd1 ?
                                  Icon(EvaIcons.eyeOff) :
                                  Icon(EvaIcons.eye),
                                  onPressed: () {
                                    setState(() {
                                      showpasswrd1 =! showpasswrd1;
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
                            obscureText: !showpasswrd1,
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
                                opacity: (!Focused1 && cnfmtpcnt.text.length>6) ||
                                    (!Focused1 && cnfmtpcnt.text.length ==0
                                        && errormsg =='Must entre a password!')
                                    ||(Focused1 && cnfmtpcnt.text.length>6) ? 0 : 1,
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
                        height: (!Focused1 && mtpcnt.text.length>6) ||
                            (!Focused1 && mtpcnt.text.length ==0
                                && errormsg =='Must entre a password!')
                            ||(Focused1 && mtpcnt.text.length>6) ? 0 : 15,
                      ),
                      Focus(
                        onFocusChange: (hasFocus) {
                          setState(() {
                            Focused02 = hasFocus;
                            if(Focused1 || Focused02 && (cnfmtpcnt.text.length >= 1 && cnfmtpcnt1.text.length >= 1)){
                              iconop = 1;
                            }else{
                              iconop = 0;
                            }
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Focused02? Color(0xFFF38000) : Color(0x80000000),
                                width: 1.2,
                              ),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          padding: EdgeInsets.fromLTRB(7, 2, 2, 1.5),
                          child: TextFormField(
                            focusNode: focusNode3,
                            controller: cnfmtpcnt1,
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
                                  icon: showpasswrd2 ?
                                  Icon(EvaIcons.eyeOff) :
                                  Icon(EvaIcons.eye),
                                  onPressed: () {
                                    setState(() {
                                      showpasswrd2 =! showpasswrd2;
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
                            obscureText: !showpasswrd2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: first,
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Center(
                    child: TextButton(
                      style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent)
                      ),
                      onPressed: () {
                        setState(() {
                          if (mtpcnt.text != null && mtpcnt.text == localeProvider.mtpkepr&& cnfmtpcnt.text != null && cnfmtpcnt.text != null) {
                            localeProvider.updateData1(cnfmtpcnt.text);
                            Navigator.pop(context);
                          }
                        });
                        print(localeProvider.userkepr);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.save,
                        style: TextStyle(
                            fontSize: 23,
                            fontFamily: 'Font2',
                            fontWeight: FontWeight.bold,
                            color: localeProvider.mode
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

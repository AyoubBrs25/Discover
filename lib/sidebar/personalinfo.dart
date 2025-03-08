import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:discover/secondry/provide.dart';
import 'package:provider/provider.dart';

import '../secondry/themes.dart';
class PersonamInfo extends StatefulWidget {
  const PersonamInfo({super.key});

  @override
  State<PersonamInfo> createState() => _PersonamInfoState();
}

class _PersonamInfoState extends State<PersonamInfo> {
  bool Focused = false;
  bool Focused01 = false;
  final usercnt = TextEditingController();
  bool Focused1 = false;
  bool Focused02 = false;
  final emailcnt = TextEditingController();
  String errormsg = 'Must entre a password!';
  final contrl = TextEditingController();
  final ctrusr = TextEditingController();
  double txtop = 1;
  bool showpasswrd = false;
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();

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
            AppLocalizations.of(context)!.prsinfo,
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
                        Focused = hasFocus;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Focused ? Color(0xFFF38000) : Color(0x80000000),
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
                              size: 25,
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
                                  color: Focused ? Color(0xFFF38000) : Color(0x99000000),
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
                      if (emailcnt.text != null && usercnt.text != null) {
                        localeProvider.updateData(emailcnt.text, ctrusr.text);
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

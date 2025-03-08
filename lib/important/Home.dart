
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:discover/important/main.dart';
import 'package:discover/secondry/language.dart';
import 'package:discover/secondry/languageconct.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:discover/secondry/themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:discover/sidebar/editprofile.dart';
import 'package:discover/secondry/provide.dart';
import 'package:provider/provider.dart';

import 'Sign&Register.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map data = {};
  bool changer = false;
  int index = 0;

  void didChangeDependencies() {
    super.didChangeDependencies();
    data = ModalRoute.of(context)?.settings.arguments as Map? ?? {};
  }

  void initState()  {
    LocaleProvider localeProvider1 = Provider.of<LocaleProvider>(context, listen: false);
    localeProvider1.fillList();
      Future.delayed(Duration(milliseconds: 1000), () {
        localeProvider1.userkepr = data['name'];
        localeProvider1.emailkepr = data['email'];
        localeProvider1.mtpkepr = data['mtp'];
      });
    super.initState();
  }



  String changename(int ind){
    late String keep;
    if(ind == 0){
      keep = AppLocalizations.of(context)!.homePage;
    }else if(ind == 1){
      keep = AppLocalizations.of(context)!.catgo;
    }else if(ind == 2){
      keep = AppLocalizations.of(context)!.fvrt;
    }else{
      keep = AppLocalizations.of(context)!.prfl;
    }
    return keep;
  }

  @override
  Widget build(BuildContext context) {
    LocaleProvider localeProvider = Provider.of<LocaleProvider>(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Align(
            alignment: localeProvider.appLocale.languageCode == 'ar'? Alignment.topLeft : Alignment.topRight,
            child: Text(
              changename(index),
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Font2',
                fontWeight: FontWeight.bold,
                color: second,
              ),
            ),
          ),
          backgroundColor: localeProvider.mode,
          leading: Builder(
            builder: (BuildContext context){
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(
                  EvaIcons.menu2,
                  size: 32,
                ),
                color: second,
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
              );
            },
          ),
        ),
      backgroundColor: localeProvider.mode,
        drawer: Drawer(
          width: 250,
          child: Column(
            children: <Widget>[
              Container(
                width: 250,
                height: 200,
                decoration: BoxDecoration(
                  color: second,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                          image: FileImage(localeProvider.fileImage as File),
                          fit: BoxFit.cover,
                        )
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.hi + ',' + localeProvider.userkepr,
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Font2',
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Edite_Profile(data:data)));
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFFCDCADA),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Icon(
                      EvaIcons.personDone,
                      color: localeProvider.items,
                      size: 23,
                    ),
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.modification,
                    style: TextStyle(
                        fontFamily: 'Font2',
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: localeProvider.items
                    ),
                  ),
                  trailing: Icon(
                    localeProvider.appLocale.languageCode == 'ar'? EvaIcons.arrowIosBack :
                    EvaIcons.arrowIosForward,
                    color: Color(0xFF7E7E7E),
                  ),
                ),
              ),
              InkWell(
                onTap: () {

                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color(0xFFCDCADA),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Icon(
                      EvaIcons.settings,
                      color: localeProvider.items,
                      size: 23,
                    ),
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.settings,
                    style: TextStyle(
                        fontFamily: 'Font2',
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        color: localeProvider.items
                    ),
                  ),
                  trailing: Icon(
                    localeProvider.appLocale.languageCode == 'ar'? EvaIcons.arrowIosBack :
                    EvaIcons.arrowIosForward,
                    color: Color(0xFF7E7E7E),
                  ),
                ),
              ),
            Container(
              color: Colors.black,
              width: 200,
              child: DropdownButton<Language>(
                onChanged: (Language? Language) async {
                  if(Language != null){
                    Locale _locale = await setLocale(Language.languageCode);
                    discover.setLocale(context, _locale);
                    localeProvider.setAppLocale(_locale);
                  }
                },
                isExpanded: true,
                items: Language.languageList()
                    .map((e) => DropdownMenuItem<Language>(

                  alignment: AlignmentDirectional.topEnd,
                  value: e,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        e.flag,
                        Text(
                          e.name,
                          style: TextStyle(
                              fontSize: 15,
                              //fontFamily: 'Font2'
                          ),
                        ),
                      ],
                    ),
                  ),
                )).toList(),
              ),
            ),
              InkWell(
                onTap: () {},
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color(0xFFCDCADA),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Icon(
                      EvaIcons.map,
                      color: localeProvider.items,
                      size: 23,
                    ),
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.maps,
                    style: TextStyle(
                        fontFamily: 'Font2',
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        color: localeProvider.items
                    ),
                  ),
                  trailing: Icon(
                    localeProvider.appLocale.languageCode == 'ar'? EvaIcons.arrowIosBack :
                    EvaIcons.arrowIosForward,
                    color: Color(0xFF7E7E7E),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  setState(() {
                    localeProvider.setcolors();
                    changer = !changer;
                  });
                },
                child: ListTile(
                  trailing: Icon(
                    changer ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                    color: localeProvider.items,
                    size: 17,
                  ),
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color(0xFFCDCADA),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Icon(
                      Icons.model_training_outlined,
                      color: localeProvider.items,
                      size: 23,
                    ),
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.darkmode,
                    style: TextStyle(
                        fontFamily: 'Font2',
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color:localeProvider.items
                    ),
                  ),
                ),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              Transform(
                transform: Matrix4.translationValues(0, 0, 0),
                child: Stack(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EnterPage()));
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: ListTile(
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Color(0xFFCDCADA),
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Icon(
                            Icons.logout_rounded,
                            color: second,
                            size: 23,
                          ),
                        ),
                        title: Text(
                          AppLocalizations.of(context)!.logout,
                          style: TextStyle(
                              fontFamily: 'Font2',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                              color: localeProvider.items
                          ),
                        ),
                        trailing: Icon(
                          localeProvider.appLocale.languageCode == 'ar'? EvaIcons.arrowIosBack :
                          EvaIcons.arrowIosForward,
                          color: second,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 54,
        items: [
          Icon(
            EvaIcons.home,
            size: 25,
            color: Colors.white,
          ),
          Icon(
            Icons.space_dashboard,
            size: 25,
            color: Colors.white,
          ),
          Icon(
            Icons.favorite_rounded,
            size: 25,
            color: Colors.white,
          ),
        ],
        backgroundColor: localeProvider.mode,
        color: second,
        animationDuration: Duration(milliseconds: 300),
        index: index,
        onTap: (index) {
            setState(() {
              this.index = index;
            });
        },
      ),
      body:  localeProvider.pages[index],
      );
  }
 }

import 'dart:io';
import 'package:discover/sidebar/personalinfo.dart';
import 'package:discover/sidebar/pribicy.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:discover/secondry/provide.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:discover/secondry/themes.dart';
import 'package:image_picker/image_picker.dart';
class Edite_Profile extends StatefulWidget {
  final Map<dynamic, dynamic> data;
  Edite_Profile({required this.data});

  @override
  State<Edite_Profile> createState() => _Edite_ProfileState();
}

class _Edite_ProfileState extends State<Edite_Profile> {
  LocaleProvider? localeProvider1;
  @override
  void initState() {
    localeProvider1 = Provider.of<LocaleProvider>(context, listen: false);
  }

  bool isFile = false;

  @override
  Widget build(BuildContext context) {
    LocaleProvider localeProvider = Provider.of<LocaleProvider>(context);
    return Scaffold(
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
            AppLocalizations.of(context)!.modification,
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
            height: 560,
            width: MediaQuery.of(context).size.width,
            color: localeProvider.mode,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: localeProvider.items,
                            width: 1.2
                        ),
                        borderRadius: BorderRadius.circular(100)
                    ),
                    padding: EdgeInsets.all(0),
                    child: TextButton(
                      onPressed: () async {
                        final picker = ImagePicker();
                        final pickedFile = await picker.pickImage(source: ImageSource.gallery);

                        if (pickedFile == null) return;

                        if (isFile == false) {
                          final file = File(pickedFile.path);

                          setState(() {
                            localeProvider.takeimage(file);
                          });
                        }
                      },
                      child: localeProvider.fileImage == null
                          ? Center(
                        child: LoadingAnimationWidget.threeRotatingDots(
                          color: Color(0xFFF38000),
                          size: 15,
                        ),
                      )
                          : buildFileImage(),
                    )
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0 , bottom: 0),
                  child: Text(
                    localeProvider.userkepr,
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Font2',
                        fontWeight: FontWeight.bold,
                        color: localeProvider.items
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Text(
                    localeProvider.emailkepr,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Font2',
                        fontWeight: FontWeight.bold,
                        color: Color(0xb3707070)
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      padding: EdgeInsets.all(20),
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: second,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35),
                          )
                      ),
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 200,
                            child: PageView(
                              //physics: NeverScrollableScrollPhysics(),
                              children: <Widget>[
                                types(),
                              ],
                            ),
                          ),
                        ],
                      )
                  ),
                )
              ],
            ),
          ),
        ],
      )
    );
  }


  Widget types(){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            AppLocalizations.of(context)!.myinfo,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Font2',
              fontWeight: FontWeight.bold,
              color: localeProvider1?.mode,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: localeProvider1!.mode,
                  width: 0.5
                )
              )
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context)!.prsinfo,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Font2',
                    color: localeProvider1?.mode,
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    padding:   MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(0)),
                    overlayColor: MaterialStateProperty.all<Color>(Colors.transparent)
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PersonamInfo()));
                  },
                  child: Icon(
                    localeProvider1?.appLocale.languageCode == 'ar'? EvaIcons.arrowIosBack :
                    EvaIcons.arrowIosForward,
                    color: Color(0xFFC7C7C7),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: localeProvider1!.mode,
                        width: 0.5
                    )
                )
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context)!.prvi,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Font2',
                    color: localeProvider1?.mode,
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                      padding:   MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(0)),
                      overlayColor: MaterialStateProperty.all<Color>(Colors.transparent)
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Prticivy()));
                  },
                  child: Icon(
                    localeProvider1?.appLocale.languageCode == 'ar'? EvaIcons.arrowIosBack :
                    EvaIcons.arrowIosForward,
                    color: Color(0xFFC7C7C7),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: localeProvider1!.mode,
                        width: 0.5
                    )
                )
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context)!.abtus,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Font2',
                    color: localeProvider1?.mode,
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                      padding:   MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(0)),
                      overlayColor: MaterialStateProperty.all<Color>(Colors.transparent)
                  ),
                  onPressed: () {},
                  child: Icon(
                    localeProvider1?.appLocale.languageCode == 'ar'? EvaIcons.arrowIosBack :
                    EvaIcons.arrowIosForward,
                    color: Color(0xFFC7C7C7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFileImage(){
    return Container(
      height: 150,
      width: 150,
      child: CircleAvatar(
        backgroundImage: FileImage(localeProvider1?.fileImage as File),
        radius: 60,
      ),
    );
  }



}

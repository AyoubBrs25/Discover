import 'dart:ui';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:discover/secondry/provide.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:discover/secondry/themes.dart';
class placePageappBar extends StatefulWidget {
  final int indx1;
  const placePageappBar({super.key, required this.indx1});
  @override
  State<placePageappBar> createState() => _placePageappBarState();
}

class _placePageappBarState extends State<placePageappBar> {

  @override
  Widget build(BuildContext context) {
    LocaleProvider localeProvider = Provider.of<LocaleProvider>(context);
    int index2 = widget.indx1;
    return SliverAppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark
      ),
      expandedHeight: 275,
      backgroundColor: localeProvider.mode,
      elevation: 0,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context , index){
              return  Image(
                image: AssetImage('assetes/${localeProvider.place[index2].picturs[index]}'),
                fit: BoxFit.cover,
              );
            },
          ),
        stretchModes: [
          StretchMode.blurBackground,
          StretchMode.zoomBackground
        ],
      ),
      bottom: PreferredSize(
        child: Container(
          height: 43,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: localeProvider.mode,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32)
            )
          ),
          child: Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: second,
              borderRadius: BorderRadius.circular(100)
            ),
          ),
        ),
        preferredSize: Size.fromHeight(0),
      ),
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            localeProvider.appLocale.languageCode == 'ar'? EvaIcons.arrowIosForward :
            EvaIcons.arrowIosBack,
            size: 35,
            color: second,
          ),
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent)
          ),
        ),
    );
  }
}

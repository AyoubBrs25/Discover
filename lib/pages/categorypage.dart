import 'package:discover/pages/placePage.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:discover/secondry/provide.dart';
import 'package:provider/provider.dart';
import 'package:discover/secondry/themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../secondry/places.dart';
//import 'package:discover/secondry/places.dart';
class category extends StatefulWidget {
  const category({super.key});

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {
  final searchcnt = TextEditingController();
  late List<Color> itemColors;
  late List<String> listTpe;

  @override
  void initState() {
    LocaleProvider localeProvider1 = Provider.of<LocaleProvider>(context, listen: false);
    localeProvider1.fillList();
    itemColors = List.filled(6, localeProvider1.mode);
    super.initState();
  }

  void searchplace(String enterkeyword){
    LocaleProvider localeProvider2 = Provider.of<LocaleProvider>(context, listen: false);
    List<PlacesCnstr>? result1 = localeProvider2.Allplaces;
    List<PlacesCnstr>? result;
    if(enterkeyword.isEmpty){
      result = result1;
    }else{
      result = result1?.where((elm) => elm.name.toLowerCase().contains(enterkeyword.toLowerCase())).toList();
    }
    setState(() {
      localeProvider2.Allplaces = result ?? [];
    });
  }



  @override
  Widget build(BuildContext context) {
    List<String> listTpe = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.city,
      AppLocalizations.of(context)!.mnt,
      AppLocalizations.of(context)!.bch,
      AppLocalizations.of(context)!.hc,
      AppLocalizations.of(context)!.gr,
    ];
    LocaleProvider localeProvider = Provider.of<LocaleProvider>(context);
    return Scaffold(
      backgroundColor: localeProvider.mode,
      body: Container(
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20,left: 20, bottom: 10),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    color: localeProvider.mode,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color:localeProvider.items,
                      width: 1.5,
                    )
                ),
                child: TextField(
                  onChanged: (value) => searchplace(value),
                  controller: searchcnt,
                  style: TextStyle(
                      fontFamily: 'Font2',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: localeProvider.items
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    prefixIcon: Icon(
                      EvaIcons.searchOutline,
                      color: localeProvider.items,
                      size: 25,
                    ),
                    prefixIconConstraints: BoxConstraints(
                      maxHeight: 20,
                      minWidth: 30,
                    ),
                    hintText: AppLocalizations.of(context)!.serch,
                    hintStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Font2',
                        fontWeight: FontWeight.w600,
                      color: localeProvider.items
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Container(
              height: 40,
              margin: EdgeInsets.only(bottom: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context,index){
                  return Container(
                    margin: localeProvider.appLocale.languageCode == 'ar'?
                    EdgeInsets.only(right: 7):
                    EdgeInsets.only(left: 7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                            color: itemColors[index] == second?
                            Colors.transparent:
                            localeProvider.items,
                            width: 1.2
                        ),
                        color: itemColors[index] == second?
                            second:
                            localeProvider.mode
                    ),
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                      ),
                      onPressed: (){
                        setState(() {
                          itemColors = List.filled(6, localeProvider.mode);
                          itemColors[index] =
                          (itemColors[index] == second) ? localeProvider.mode : second;
                          localeProvider.Allplaces = localeProvider.Updatelist(listTpe[index]);
                        });
                      },
                      child: Center(
                        child: Text(
                          listTpe[index],
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Font2',
                              color: localeProvider.items
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            ),
            Container(
              padding: EdgeInsets.only(right: 20, left: 20),
              height: 395,
              child: ListView.builder(
                itemCount: localeProvider.Allplaces?.length,//localeProvider.Allplaces?.length,
                itemBuilder: (context,index){
                  return Container(
                    margin: EdgeInsets.only(bottom: 15),
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage('assetes/${localeProvider.Allplaces?[index].picturs[0]}'),
                        fit: BoxFit.cover
                      )
                    ),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: 55,
                            decoration: BoxDecoration(
                              color: second.withOpacity(0.70),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15)
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment:MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text(
                                      '${localeProvider.Allplaces?[index].name}',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Font2',
                                          color: localeProvider.items,
                                          decoration: TextDecoration.none
                                      ),
                                    ),
                                    Text(
                                      '${localeProvider.Allplaces?[index].location}',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Font2',
                                          color: localeProvider.items,
                                          decoration: TextDecoration.none
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => PlacePage(indx: localeProvider.Allplaces![index].id)));
                                    },
                                    style: ButtonStyle(
                                        overlayColor: MaterialStateProperty.all<Color>(Colors.transparent)
                                    ),
                                    icon: Icon(
                                      localeProvider.appLocale.languageCode == 'ar'? Icons.arrow_circle_left :
                                      Icons.arrow_circle_right,
                                      size: 35,
                                      color: localeProvider.items,
                                    )
                                ),
                              ],
                            ),
                          ),
                        ),
                        Transform(
                          child: Consumer<LocaleProvider>(
                            builder: (context,localeProvider, _){
                              return IconButton(
                                  style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all<Color>(Colors.transparent)
                                  ),
                                  onPressed: () {
                                    localeProvider.toggleFavorite(index);
                                    setState(() {
                                      localeProvider.takefavr();
                                    });
                                  },
                                  icon: localeProvider.Allplaces?[index].fav == false?
                                  Icon(
                                    EvaIcons.heartOutline,
                                    color: localeProvider.mode,
                                    size: 30,
                                  ):
                                  Icon(
                                    EvaIcons.heart,
                                    color: Colors.red,
                                    size: 30,
                                  )
                              );
                            },
                          ),
                          transform: localeProvider.appLocale.languageCode == 'ar'?
                          Matrix4.translationValues(-260 , 0, 0):
                          Matrix4.translationValues(260, 0, 0),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }



}


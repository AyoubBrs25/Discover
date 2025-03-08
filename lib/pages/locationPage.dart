import 'package:discover/pages/placePage.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../secondry/places.dart';
import '../secondry/provide.dart';
import '../secondry/themes.dart';

class locationPage extends StatefulWidget {
  const locationPage({super.key});

  @override
  State<locationPage> createState() => _locationPageState();
}

class _locationPageState extends State<locationPage> {

  final searchcnt = TextEditingController();
  List<PlacesCnstr>? result1;


  @override
  void initState() {
    LocaleProvider localeProvider2 = Provider.of<LocaleProvider>(context, listen: false);
    result1 = localeProvider2.Allplaces;
    super.initState();
  }

  void searchplace(String enterkeyword){
    LocaleProvider localeProvider3 = Provider.of<LocaleProvider>(context, listen: false);
    List<PlacesCnstr>? result;
    if(enterkeyword.isEmpty){
      result = result1;
    }else{
      result = result1?.where((elm) => elm.name.toLowerCase().contains(enterkeyword.toLowerCase())).toList();
    }
    setState(() {
      localeProvider3.Allplaces = result ?? [];
    });
  }


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
            AppLocalizations.of(context)!.loc,
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
              padding: EdgeInsets.only(right: 20, left: 20),
              height: 500,
              child: localeProvider.Allplaces?.length == 0?
                  Center(
                    child: Text(
                      AppLocalizations.of(context)!.ntfond,
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Font2',
                        fontWeight: FontWeight.bold,
                        color: localeProvider.items
                      ),
                    ),
                  ):
              ListView.builder(
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

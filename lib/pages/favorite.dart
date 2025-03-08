import 'package:discover/pages/placePage.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../secondry/places.dart';
import '../secondry/provide.dart';
import '../secondry/themes.dart';
class favorite extends StatefulWidget {
  const favorite({super.key});

  @override
  State<favorite> createState() => _favoriteState();
}

class _favoriteState extends State<favorite> {
  List<PlacesCnstr>? result1;
  List<PlacesCnstr>? takeit;

  void initState() {
    LocaleProvider localeProvider2 = Provider.of<LocaleProvider>(context, listen: false);
    takeit = localeProvider2.takefavr();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    LocaleProvider localeProvider = Provider.of<LocaleProvider>(context);
    setState(() {
      takeit = localeProvider.takefavr();
    });
    return Scaffold(
      backgroundColor: localeProvider.mode,
      body: Container(
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 20, left: 20),
              height: 458,
              child: takeit?.length == 0?
              Center(
                child: Text(
                  AppLocalizations.of(context)!.ntfond,
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Font2',
                      fontWeight: FontWeight.bold,
                      color: localeProvider.items,
                      decoration: TextDecoration.none
                  ),
                ),
              ):
              ListView.builder(
                itemCount: takeit?.length,//localeProvider.Allplaces?.length,
                itemBuilder: (context,index){
                  return Container(
                    margin: EdgeInsets.only(bottom: 15),
                    height: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage('assetes/${takeit?[index].picturs[0]}'),
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
                                      '${takeit?[index].name}',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Font2',
                                          color: localeProvider.items,
                                          decoration: TextDecoration.none
                                      ),
                                    ),
                                    Text(
                                      '${takeit?[index].location}',
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
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => PlacePage(indx: takeit![index].id)));
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

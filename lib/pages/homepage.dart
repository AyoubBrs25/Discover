import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:discover/secondry/provide.dart';
import 'package:provider/provider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:discover/pages/placePage.dart';
import 'locationPage.dart';
class theHome extends StatefulWidget {
  const theHome({super.key});
  @override
  State<theHome> createState() => _theHomeState();
}

class _theHomeState extends State<theHome> {



  void initState() {
    LocaleProvider localeProvider1 = Provider.of<LocaleProvider>(context, listen: false);
    localeProvider1.fillList();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    LocaleProvider localeProvider = Provider.of<LocaleProvider>(context);
    return Scaffold(
      body: Container(
        color: localeProvider.mode,
        padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
        child: ListView(
          children: <Widget>[
            Container(
              height: 100,
              margin: EdgeInsets.only(bottom: 10),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 7,),
                    width: 150,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage('assetes/allimages.png'),
                          fit: BoxFit.fill,
                        )
                    ),
                    child: Center(
                      child: TextButton(
                        style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all<Color>(Colors.transparent)
                        ),
                        onPressed: () {
                          setState(() {
                            localeProvider.Allplaces = localeProvider.Updatelocation(AppLocalizations.of(context)!.all);
                          });
                          Navigator.push(context, MaterialPageRoute(builder: (context) => locationPage()));
                        },
                        child: Text(
                          AppLocalizations.of(context)!.all,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: localeProvider.mode,
                              fontFamily: 'Font2'
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 7,),
                    width: 150,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage('assetes/1_1194_02.jpg'),
                          fit: BoxFit.fill,
                        )
                    ),
                    child: Center(
                      child: TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent)
                        ),
                        onPressed: () {
                          setState(() {
                            localeProvider.Allplaces = localeProvider.Updatelocation(AppLocalizations.of(context)!.north);
                          });
                          Navigator.push(context, MaterialPageRoute(builder: (context) => locationPage()));
                        },
                        child: Text(
                          AppLocalizations.of(context)!.north,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: localeProvider.mode,
                            fontFamily: 'Font2'
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 7),
                    width: 150,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage('assetes/cad95c8f24ff45adfcda7d0cfef78608.jpg'),
                          fit: BoxFit.fill,
                        )
                    ),
                    child: Center(
                      child: TextButton(
                        style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all<Color>(Colors.transparent)
                        ),
                        onPressed: () {
                          setState(() {
                            localeProvider.Allplaces = localeProvider.Updatelocation(AppLocalizations.of(context)!.east);
                          });
                          Navigator.push(context, MaterialPageRoute(builder: (context) => locationPage()));
                        },
                        child: Text(
                          AppLocalizations.of(context)!.east,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: localeProvider.mode,
                              fontFamily: 'Font2'
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 7),
                    width: 150,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage('assetes/0eb47d1f1597a83b7884e1cad9991d94.webp'),
                          fit: BoxFit.fill,
                        )
                    ),
                    child: Center(
                      child: TextButton(
                        style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all<Color>(Colors.transparent)
                        ),
                        onPressed: () {
                          setState(() {
                            localeProvider.Allplaces = localeProvider.Updatelocation(AppLocalizations.of(context)!.west);
                          });
                          Navigator.push(context, MaterialPageRoute(builder: (context) => locationPage()));
                        },
                        child: Text(
                          AppLocalizations.of(context)!.west,
                          style: TextStyle(
                               fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: localeProvider.mode,
                              fontFamily: 'Font2'
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin:localeProvider.appLocale.languageCode == 'ar'?
                    EdgeInsets.only(right: 7) : EdgeInsets.zero,
                    width: 150,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage('assetes/tasiiiii.jpg'),
                          fit: BoxFit.fill,
                        )
                    ),
                    child: Center(
                      child: TextButton(
                        style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all<Color>(Colors.transparent)
                        ),
                        onPressed: () {
                          setState(() {
                            localeProvider.Allplaces = localeProvider.Updatelocation(AppLocalizations.of(context)!.south);
                          });
                          Navigator.push(context, MaterialPageRoute(builder: (context) => locationPage()));
                        },
                        child: Text(
                          AppLocalizations.of(context)!.south,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: localeProvider.mode,
                              fontFamily: 'Font2'
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.only(top: 5,bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context)!.popdes,
                    style: TextStyle(
                        color: localeProvider.items,
                        fontSize: 20,
                        fontFamily: 'Font2',
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  TextButton(
                    child: Text(
                      AppLocalizations.of(context)!.vwall,
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Font2',
                        color: Color(0xb3707070),
                        fontWeight: FontWeight.w600  
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => locationPage()));
                    },
                    style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(Colors.transparent)
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: localeProvider.Allplaces?.length,
                itemBuilder: (context , index){
                  return Container(
                      margin: EdgeInsets.only(right: 7),
                      padding: EdgeInsets.only(bottom: 10),
                      width: 220,
                      height: 350,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(35),
                          image: DecorationImage(
                            image: AssetImage('assetes/${localeProvider.Allplaces?[index].picturs[0]}'),
                            fit: BoxFit.cover,
                          )
                      ),
                      child:  Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              padding: localeProvider.appLocale.languageCode == 'ar'? EdgeInsets.only(right: 15):
                              EdgeInsets.only(left: 15),
                              width: 200,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: localeProvider.mode,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      '${localeProvider.Allplaces?[index].name}',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: localeProvider.items,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Font2'
                                      ),
                                    ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        '${localeProvider.Allplaces?[index].location},${localeProvider.Allplaces?[index].diriction}',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'Font2',
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xb3707070)
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Transform(
                            transform: localeProvider.appLocale.languageCode == 'ar'? Matrix4.translationValues(-162, 247, 0):
                            Matrix4.translationValues(162, 247, 0),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => PlacePage(indx: localeProvider.Allplaces![index].id)));
                                },
                                style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.all<Color>(Colors.transparent)
                                ),
                                icon: Icon(
                                  localeProvider.appLocale.languageCode == 'ar'? Icons.arrow_circle_left :
                                  Icons.arrow_circle_right,
                                  size: 25,
                                  color: localeProvider.items,
                                )
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
                            Matrix4.translationValues(-170, 10, 0):
                            Matrix4.translationValues(170, 10, 0),
                          )
                        ],
                      )
                  );
                },

























/*                  Container(
                    margin: EdgeInsets.only(right: 7),
                    padding: EdgeInsets.only(bottom: 10),
                    width: 220,
                    height: 350,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(35),
                      image: DecorationImage(
                        image: AssetImage('assetes/${localeProvider.place[0].picturs[0]}'),
                        fit: BoxFit.cover,
                      )
                    ),
                    child:  Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: localeProvider.appLocale.languageCode == 'ar'? EdgeInsets.only(right: 15):
                            EdgeInsets.only(left: 15),
                            width: 200,
                            height: 60,
                            decoration: BoxDecoration(
                              color: localeProvider.mode,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Hero(
                                    tag:'${localeProvider.place[0].name}'+'name' ,
                                    child: Text(
                                      '${localeProvider.place[0].name}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: localeProvider.items,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Font2'
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        '${localeProvider.place[0].location},${localeProvider.place[0].diriction} Algeria',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'Font2',
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xb3707070)
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                        ),
                        Transform(
                          transform: localeProvider.appLocale.languageCode == 'ar'? Matrix4.translationValues(-162, 247, 0):
                          Matrix4.translationValues(162, 247, 0),
                          child: IconButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => PlacePage()));
                              },
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all<Color>(Colors.transparent)
                              ),
                              icon: Icon(
                                localeProvider.appLocale.languageCode == 'ar'? Icons.arrow_circle_left :
                                Icons.arrow_circle_right,
                                size: 25,
                                color: localeProvider.items,
                              )
                          ),
                        ),
                        Transform(
                          child: Hero(
                            tag: '${localeProvider.place[0]}'+'fav',
                            child: Consumer<LocaleProvider>(
                              builder: (context,localeProvider, _){
                                return IconButton(
                                    style: ButtonStyle(
                                        overlayColor: MaterialStateProperty.all<Color>(Colors.transparent)
                                    ),
                                    onPressed: () {
                                        localeProvider.toggleFavorite(0);
                                    },
                                    icon: localeProvider.place[0].fav == false?
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
                          ),
                          transform: localeProvider.appLocale.languageCode == 'ar'?
                          Matrix4.translationValues(-170, 10, 0):
                          Matrix4.translationValues(170, 10, 0),
                        )
                      ],
                    )
                  ),*/
              ),
            )
          ],
        ),
      ),
    );
  }
}


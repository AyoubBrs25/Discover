import 'package:discover/pages/placePageappbar.dart';
import 'package:flutter/material.dart';
import 'package:discover/secondry/provide.dart';
import 'package:provider/provider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:discover/secondry/themes.dart';
class PlacePage extends StatefulWidget {
  final int indx;
  const PlacePage({super.key , required this.indx});

  @override
  State<PlacePage> createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  @override
  Widget build(BuildContext context) {
    int index1 = widget.indx;
    LocaleProvider localeProvider = Provider.of<LocaleProvider>(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          placePageappBar(indx1: index1),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.fromLTRB(20,5,20,10),
              color: localeProvider.mode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          '${localeProvider.place[index1].name}'+','+' ${localeProvider.place[index1].location}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Font2',
                            color: localeProvider.items,
                            decoration: TextDecoration.none
                          ),
                        ),
                      Consumer<LocaleProvider>(
                          builder: (context,localeProvider, _){
                            return IconButton(
                                style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.all<Color>(Colors.transparent)
                                ),
                                onPressed: () {
                                  localeProvider.toggleFavorite(index1);
                                  localeProvider.takefavr();
                                },
                                icon: localeProvider.place[index1].fav == false?
                                Icon(
                                  EvaIcons.heartOutline,
                                  color: localeProvider.items,
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
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 13),
                    child: Text(
                      '${localeProvider.place[index1].desc}',
                      style: TextStyle(
                        fontSize:14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Font2',
                        color: Color(0xb3707070),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Hotel&Restaurant in ${localeProvider.place[index1].location}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Font2',
                          color: localeProvider.items
                      ),
                    ),
                  ),
                ],
              ),
            )
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  color: localeProvider.mode,
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: second.withOpacity(0.35),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: localeProvider.appLocale.languageCode =='ar'?
                          EdgeInsets.only(left: 7):
                          EdgeInsets.only(right: 7),
                          width: 100,
                          height: 80,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assetes/${localeProvider.place[index1].hotels[index].imgsrc}'),
                              fit: BoxFit.cover
                            ),
                            borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              '${localeProvider.place[index1].hotels[index].name}',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Font2',
                                decoration: TextDecoration.none,
                                color: localeProvider.items
                              ),
                            ),
                            Text(
                              '${localeProvider.place[index1].hotels[index].price}',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Font2',
                                  decoration: TextDecoration.none,
                                  color: localeProvider.items
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              childCount: localeProvider.place[index1].hotels.length,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  color: localeProvider.mode,
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: second.withOpacity(0.35),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: localeProvider.appLocale.languageCode =='ar'?
                          EdgeInsets.only(left: 7):
                          EdgeInsets.only(right: 7),
                          width: 100,
                          height: 80,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assetes/${localeProvider.place[index1].restaurants[index].imgsrc}'),
                                  fit: BoxFit.cover
                              ),
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              '${localeProvider.place[index1].restaurants[index].name}',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Font2',
                                  decoration: TextDecoration.none,
                                  color: localeProvider.items
                              ),
                            ),
                            Text(
                              '${localeProvider.place[index1].restaurants[index].mtype}',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Font2',
                                  decoration: TextDecoration.none,
                                  color: localeProvider.items
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              childCount: localeProvider.place [index1].restaurants.length,
            ),
          ),
        ],
      ),
    );
  }
}



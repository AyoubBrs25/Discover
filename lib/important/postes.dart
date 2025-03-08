import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:discover/secondry/provide.dart';
import 'package:discover/secondry/themes.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Postes extends StatefulWidget {
  const Postes({super.key});

  @override
  State<Postes> createState() => _PostesState();
}

class _PostesState extends State<Postes> {
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
            AppLocalizations.of(context)!.poste,
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
        child: Column(
          children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 20,left: 20),
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
                  style: TextStyle(
                    fontFamily: 'Font2',
                    fontWeight: FontWeight.bold,
                    fontSize: 18
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
                      fontWeight: FontWeight.w600
                    ),
                    border: InputBorder.none,
                  ),
                ),
                            ),
              )
          ],
        ),
      ),
    );
  }
}

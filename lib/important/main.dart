import 'package:discover/important/Home.dart';
import 'package:flutter/material.dart';
import 'package:discover/important/Loading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:discover/secondry/provide.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      child: const discover(),
    ));
}

class discover extends StatefulWidget {
  const discover({super.key});

  @override
  State<discover> createState() => _discoverState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _discoverState? state = context.findAncestorStateOfType<_discoverState>();
    state?.setLocale(newLocale);
  }
}

class _discoverState extends State<discover> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
  @override
  void didChangeDependencies() {
    final localeProvider = Provider.of<LocaleProvider>(context);
    setLocale(localeProvider.appLocale);
    localeProvider.saveData();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        platform: TargetPlatform.iOS,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => laoding(),
        'home' : (context) => HomePage(),
      },
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      locale: _locale,
    );
  }
}


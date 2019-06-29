import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'locale/app_localization.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  AppLocalizationDelegate _localeOverrideDelegate =
      AppLocalizationDelegate(Locale('en', 'US'));

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      _localeOverrideDelegate
    ], supportedLocales: [
      const Locale('en', 'US'),
      const Locale('de', 'DE')
    ], 
    home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text(AppLocalization.of(context).heyWorld),
          ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: ListTile(
              leading: RaisedButton(
                onPressed: () {
                  setState(() {
                    AppLocalization.load(Locale('en', 'US'));
                  });
                },
                child: Text('ENGLISH'),
              ),
              trailing: RaisedButton(
                onPressed: () {
                  setState(() {
                    AppLocalization.load(Locale('de', 'DE'));
                  });
                },
                child: Text('GERMAN'),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              AppLocalization.of(context).heyWorld,
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}

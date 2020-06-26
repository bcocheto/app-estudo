import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:projeto_estrutura/config/provider_manager.dart';
import 'package:projeto_estrutura/config/router_manager.dart';
import 'package:projeto_estrutura/config/storage_manager.dart';
import 'package:projeto_estrutura/generated/i18n.dart';
import 'package:projeto_estrutura/model/local_view_model.dart';
import 'package:projeto_estrutura/model/theme_model.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  await StorageManager.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providers,
        child: Consumer2<ThemeModel, LocaleModel>(
            builder: (context, themeModel, localeModel, child) {
          return RefreshConfiguration(
            hideFooterWhenNotFull: true,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: themeModel.themeData(),
              darkTheme: themeModel.themeData(platformDarkMode: true),
              locale: localeModel.locale,
              localizationsDelegates: const [
                S.delegate,
                RefreshLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate
              ],
              supportedLocales: S.delegate.supportedLocales,
              onGenerateRoute: Router.generateRoute,
              initialRoute: RouteName.splash,
            ),
          );
        }));
  }
}

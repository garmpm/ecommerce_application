import 'package:ecommerce_application/src/nav_frame.dart';
import 'package:ecommerce_application/src/pages/product_detail_page.dart';
import 'package:ecommerce_application/src/pages/register_page.dart';
import 'package:ecommerce_application/src/pages/rezervation_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:get/get.dart';

import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          //restorationScopeId: 'app',

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent),
            useMaterial3: true,
          ),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          initialRoute: '/',
          getPages: [
            GetPage(
              name: '/',
              page: () => NavFrame(),
            ),
            GetPage(
              name: '/home/details',
              page: () => ProductDetailPage(),
            ),
            GetPage(
              name: '/history/details',
              page: () => RezervationDetailPage(),
            ),
            GetPage(
              name: '/settings',
              page: () => SettingsView(
                controller: settingsController,
              ),
            ),
            GetPage(
              name: '/register',
              page: () => RegisterPage(),
            ),
            GetPage(
              name: '/profile',
              page: () => ProfileScreen(
                providers: const [],
                actions: [
                  SignedOutAction((context) {
                    Get.offNamed('/');
                  }),
                ],
              ),
            ),
            GetPage(
              name: '/placeholder',
              page: () => Placeholder(),
            ),
          ],
        );
      },
    );
  }
}

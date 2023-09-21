import 'package:ecommerce_application/src/nav_frame.dart';
import 'package:ecommerce_application/src/pages/product_detail_page.dart';
import 'package:ecommerce_application/src/pages/rezervation_detail_page.dart';
import 'package:ecommerce_application/src/router.dart';
import 'package:ecommerce_application/src/settings/settings_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:go_router/go_router.dart';

import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp.router(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',

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
          routerConfig: GoRouter(
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const NavFrame(),
                routes: [
                  GoRoute(
                    path: 'sign-in',
                    builder: (context, state) {
                      return SignInScreen(
                        actions: [
                          ForgotPasswordAction(((context, email) {
                            final uri = Uri(
                              path: '/sign-in/forgot-password',
                              queryParameters: <String, String?>{
                                'email': email,
                              },
                            );
                            context.push(uri.toString());
                          })),
                          AuthStateChangeAction(((context, state) {
                            final user = switch (state) {
                              SignedIn state => state.user,
                              UserCreated state => state.credential.user,
                              _ => null
                            };
                            if (user == null) {
                              return;
                            }
                            if (state is UserCreated) {
                              user.updateDisplayName(user.email!.split('@')[0]);
                            }
                            if (!user.emailVerified) {
                              user.sendEmailVerification();
                              const snackBar = SnackBar(
                                  content: Text(
                                      'Please check your email to verify your email address'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                            context.pushReplacement('/');
                          })),
                        ],
                      );
                    },
                    routes: [
                      GoRoute(
                        path: 'forgot-password',
                        builder: (context, state) {
                          final arguments = state.uri.queryParameters;
                          return ForgotPasswordScreen(
                            email: arguments['email'],
                            headerMaxExtent: 200,
                          );
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'profile',
                    builder: (context, state) {
                      return ProfileScreen(
                        providers: const [],
                        actions: [
                          SignedOutAction((context) {
                            context.pushReplacement('/');
                          }),
                        ],
                      );
                    },
                  ),
                  GoRoute(
                    path: 'settings',
                    builder: ((context, state) {
                      return SettingsView(controller: settingsController);
                    }),
                  ),
                  GoRoute(
                    path: 'details',
                    builder: ((context, state) {
                      return ProductDetailPage();
                    }),
                  ),
                  GoRoute(
                    path: 'history/details',
                    builder: ((context, state) {
                      return RezervationDetailPage();
                    }),
                  ),
                  GoRoute(
                    path: 'placeholder',
                    builder: ((context, state) => Placeholder()),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

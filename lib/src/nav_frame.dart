import 'package:ecommerce_application/src/auth/auth.dart';
import 'package:ecommerce_application/src/pages/home_page.dart';
import 'package:ecommerce_application/src/state/app_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class NavFrame extends StatefulWidget {
  const NavFrame({super.key});

  @override
  State<NavFrame> createState() => _NavFrameState();
}

class _NavFrameState extends State<NavFrame> {
  var selectedIndex = 0;
  String appBarLabel = 'Home';

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = HomePage();
        appBarLabel = 'Home';
        break;
      case 1:
        page = Placeholder();
        appBarLabel = 'Browse by Categories';
        break;
      case 2:
        page = Placeholder();
        appBarLabel = 'Search';
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          title: Text(appBarLabel),
          actions: [
            IconButton(
                onPressed: () {
                  context.go('/settings');
                },
                icon: Icon(Icons.settings))
          ],
        ),
        drawer: Drawer(
            child: ListView(
          children: [
            Consumer<ApplicationState>(
              builder: (context, appState, _) => AuthFunc(
                  loggedIn: appState.loggedIn,
                  signOut: () {
                    FirebaseAuth.instance.signOut();
                  }),
            ),
            ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings),
              onTap: () {
                context.push('/settings');
              },
            )
          ],
        )),
        body: page,
        bottomNavigationBar: NavigationBar(
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            NavigationDestination(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
          ],
          selectedIndex: selectedIndex,
          onDestinationSelected: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
        ),
      );
    });
  }
}

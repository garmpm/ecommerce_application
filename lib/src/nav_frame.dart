import 'package:ecommerce_application/src/auth/auth.dart';
import 'package:ecommerce_application/src/pages/history_page.dart';
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
        appBarLabel = 'Search';
        break;
      case 3:
        page = HistoryPage();
        appBarLabel = 'History';
        break;
      case 4:
        page = Placeholder();
        appBarLabel = 'Notifications';
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
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
              icon: Icon(
                Icons.home_outlined,
                size: 40,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.search,
                size: 40,
              ),
              label: 'Search',
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Text(
                    'R',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            NavigationDestination(
              icon: Icon(
                Icons.list_alt_outlined,
                size: 40,
              ),
              label: 'History',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.notifications_outlined,
                size: 40,
              ),
              label: 'Notifications',
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

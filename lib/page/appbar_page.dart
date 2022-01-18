import 'package:flutter/material.dart';
import 'package:flutter_navigation/main.dart';
import 'package:flutter_navigation/page/center_page.dart';

class AppBarPage extends StatefulWidget {
  @override
  _AppBarPageState createState() => _AppBarPageState();
}

class _AppBarPageState extends State<AppBarPage>
    with SingleTickerProviderStateMixin {
  late TabController _appBarTabController;
  int selectedIndex = 1;
  @override
  void initState() {
    _appBarTabController =
        TabController(length: 4, vsync: this, initialIndex: selectedIndex);
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_none),
              onPressed: () {},
            ),
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.blueGrey],
                begin: Alignment.bottomCenter,
                end: Alignment.topRight,
              ),
            ),
          ),
          bottom: TabBar(
            //isScrollable: true,
            indicatorColor: Colors.white,
            controller: _appBarTabController,
            indicatorWeight: 5,
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.star), text: 'Feed'),
              Tab(icon: Icon(Icons.face), text: 'Profile'),
              Tab(icon: Icon(Icons.settings), text: 'Settings'),
            ],
          ),
          elevation: 20,
          titleSpacing: 20,
        ),
        body: TabBarView(
          controller: _appBarTabController,
          children: [
            buildPage('Home Page'),
            PopularMountains(appBarTabController: _appBarTabController),
            buildPage('Profile Page'),
            buildPage('Settings Page'),
          ],
        ),
      ),
    );
  }

  Widget buildPage(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 28),
        ),
      );
}

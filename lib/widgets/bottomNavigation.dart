import 'package:botanica/screens/cartScreen.dart';
import 'package:botanica/screens/exploreScreen.dart';
import 'package:botanica/screens/homeScreen.dart';
import 'package:botanica/screens/profileScreen.dart';
import 'package:botanica/screens/shopScreen.dart';
import 'package:flutter/material.dart';

class Bottomnavigation extends StatefulWidget {
  final int initialIndex;
  const Bottomnavigation({super.key, this.initialIndex = 0});

  @override
  State<Bottomnavigation> createState() => _BottomnavigationState();
}

class _BottomnavigationState extends State<Bottomnavigation> {
  late int activeTab;
  late List<int> tabHistory;

  @override
  void initState() {
    super.initState();
    activeTab = widget.initialIndex;
    tabHistory = [widget.initialIndex];
  }

  void changeTab(int index) {
    setState(() {
      activeTab = index;
      if (tabHistory.isEmpty || tabHistory.last != index) {
        tabHistory.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const Homescreen(),
      const Shopscreen(),
      const Explorescreen(),
      const Cartscreen(),
      const Profilescreen(),
    ];
    return PopScope(
      canPop: tabHistory.length <= 1,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        setState(() {
          tabHistory.removeLast();
          activeTab = tabHistory.last;
        });
      },
      child: Scaffold(
        body: screens[activeTab],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: activeTab,
          onTap: (index) {
            changeTab(index);
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xff006E2F),
          selectedFontSize: 16,
          unselectedItemColor: Color(0xff3d4a3d),
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.storefront_outlined),
              label: 'Category',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

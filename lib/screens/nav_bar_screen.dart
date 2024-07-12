import 'package:flutter/material.dart';
import 'package:storevein/screens/homes/widgets/account_screen.dart';
import 'package:storevein/screens/homes/home_screen.dart';
import '../constants/constants.dart';
import 'components/custom_app_bar.dart';
import 'homes/widgets/category_screen.dart';
import 'homes/widgets/store_screen.dart';

class NavBarBottom extends StatefulWidget {
  const NavBarBottom({super.key});

  @override
  State<NavBarBottom> createState() => _NavBarBottomState();
}

class _NavBarBottomState extends State<NavBarBottom> {
  int myIndex = 0;
  List<Widget> widgetList = const [
    HomeScreen(),
    CategoryScreen(),
    StoreScreen(),
    AccountScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100.0), // Custom height
        child: CustomAppBar(),
      ),

      //render screen
      body: Center(
        child: widgetList[myIndex],
      ),

      //bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: primaryActive, // Color for selected label
        unselectedItemColor: Colors.white, // Color for unselected labels
        selectedLabelStyle: const TextStyle(
          color: primaryActive, // Style for selected label
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(
          color: Colors.white, // Style for unselected labels
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: primaryColor,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
         setState(() {
           myIndex = index ;
         });
        },
        currentIndex: myIndex,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: primaryActive
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Category",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.store),
              label: "Stores",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Account",
          ),

        ],
      ),
    );
  }
}

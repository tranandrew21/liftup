import 'package:flutter/material.dart';
import 'package:lift_up/view/home/navigation.dart';
import 'package:lift_up/view/home/profile.dart';
import 'package:lift_up/view/home/friends.dart';
import 'package:lift_up/view/home/workout.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  // final List<Widget> _pages = [
  //   Center(child: Text("Profile Page")),
  //   Center(child: Text("Friends Page")),
  //   Center(child: Text("Workout Page")),
  //   Center(child: Text("Navigation Page")),
  // ];

  // Will be implemented after pages are fully implemented 
  final List<Widget> _pages = [
    ProfilePage(),  // Page 0
    FriendsPage(),  // Page 1
    WorkoutPage(),  // Page 2
    NavigationPage() // Page 3
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              // PROFILe ICON
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
              icon: Image.asset(
                // PROFILE ICON
                'assets/img/profile.png',
                height: 40,
                width: 40,
                color: _currentIndex == 0 ? Colors.orange : Colors.black,
              ),
            ),
            IconButton(
              // FRIENDS ICON
              onPressed: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
              icon: Image.asset(
                'assets/img/friends.png',
                height: 40,
                width: 40,
                color: _currentIndex == 1 ? Colors.orange : Colors.black,
              ),
            ),
            IconButton(
              // WOKROUT ICON
              onPressed: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
              icon: Image.asset(
                'assets/img/workout.png',
                height: 40,
                width: 40,
                color: _currentIndex == 2 ? Colors.orange : Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _currentIndex = 3;
                });
              },
              icon: Image.asset(
                'assets/img/navigation.png',
                height: 40,
                width: 40,
                color: _currentIndex == 3 ? Colors.orange : Colors.black,
              ),
            ),
          ],
        )),
    );
  }
}


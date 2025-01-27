import 'dart:math';

import 'package:expense_tracker/screens/Home/views/main_screen.dart';
import 'package:expense_tracker/screens/Stats/stats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int screen = 0;
  Color selectedItem=Colors.blue;
  Color unSelectedItem = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          child: BottomNavigationBar(
              onTap: (value) {
                setState(() {
                  screen = value;
                });
              },
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 3,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.home,
                      color: screen==0?selectedItem:unSelectedItem,
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.graph_square_fill,
                      color: screen==1?selectedItem:unSelectedItem,
                    ),
                    label: 'Stats')
              ]),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          shape: CircleBorder(),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [
                  Theme.of(context).colorScheme.tertiary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.primary,
                ], transform: const GradientRotation(pi / 4))),
            child: const Icon(CupertinoIcons.add),
          ),
        ),
        body: screen == 0 ? MainScreen() : StatScreen());
  }
}

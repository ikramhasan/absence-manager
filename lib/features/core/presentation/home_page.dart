import 'package:absence_manager/features/absence/presentation/components/absence_list_widget.dart';
import 'package:absence_manager/features/core/assets/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A widget representing the home page.
class HomePage extends StatefulWidget {
  /// Creates a [HomePage] instance.
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final pages = [
    const AbsenceListWidget(),
    const Center(child: Text('Settings')),
  ];

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      transitionDuration: const Duration(milliseconds: 100),
      smallBreakpoint: const Breakpoint(endWidth: 700),
      mediumBreakpoint: const Breakpoint(beginWidth: 700, endWidth: 1000),
      mediumLargeBreakpoint: const Breakpoint(beginWidth: 1000, endWidth: 1200),
      largeBreakpoint: const Breakpoint(beginWidth: 1200, endWidth: 1600),
      extraLargeBreakpoint: const Breakpoint(beginWidth: 1600),
      useDrawer: false,
      appBarBreakpoint: const Breakpoint.standard(),
      selectedIndex: selectedIndex,
      onSelectedIndexChange: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      appBar: AppBar(
        title: const Text('Absence Manager'),
      ),
      smallBody: (_) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: pages[selectedIndex],
      ),
      destinations: [
        NavigationDestination(
          icon: SvgPicture.asset(
            Vectors.peopleOutline,
            height: 20,
            width: 20,
          ),
          label: 'Absences',
        ),
        NavigationDestination(
          icon: SvgPicture.asset(
            Vectors.cogOutline,
            height: 20,
            width: 20,
          ),
          label: 'Settings',
        ),
      ],
      
    );
  }
}

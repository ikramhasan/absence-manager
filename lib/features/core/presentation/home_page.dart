import 'package:absence_manager/features/absence/presentation/components/absence_date_filter_widget.dart';
import 'package:absence_manager/features/absence/presentation/components/absence_list_widget.dart';
import 'package:absence_manager/features/absence/presentation/components/absence_table_widget.dart';
import 'package:absence_manager/features/absence/presentation/components/absence_type_filter_widget.dart';
import 'package:absence_manager/features/core/assets/resources.dart';
import 'package:absence_manager/features/l10n/l10n.dart';
import 'package:absence_manager/features/settings/presentation/settings_page.dart';
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

  final smallPages = [
    const AbsenceListWidget(),
    const SettingsPage(),
  ];

  final largePages = [
    const AbsenceTableWidget(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return AdaptiveScaffold(
      transitionDuration: const Duration(milliseconds: 1),
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
        centerTitle: false,
        title: Text(context.l10n.appName),
        actions: [
          if (width <= 700)
            const Row(
              children: [
                AbsenceTypeFilterWidget(),
                SizedBox(width: 16),
                AbsenceDateFilterWidget(),
                SizedBox(width: 16),
              ],
            )
          else
            const SizedBox(),
        ],
      ),
      smallBody: (_) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: smallPages[selectedIndex],
      ),
      body: (_) => largePages[selectedIndex],
      destinations: [
        NavigationDestination(
          icon: SvgPicture.asset(
            Vectors.peopleOutline,
            height: 20,
            width: 20,
          ),
          label: context.l10n.absences,
        ),
        NavigationDestination(
          icon: SvgPicture.asset(
            Vectors.cogOutline,
            height: 20,
            width: 20,
          ),
          label: context.l10n.settings,
        ),
      ],
      
    );
  }
}

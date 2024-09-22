import 'package:absence_manager/features/absence/presentation/components/absence_list_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Absence Manager'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: AbsenceListWidget(),
      ),
    );
  }
}

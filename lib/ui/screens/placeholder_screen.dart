import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../theme/theme_notifier.dart';

class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("🌸 FocusBloom"),
        actions: [
          IconButton(
            icon: Icon(
              themeNotifier.themeMode == ThemeMode.dark
                  ? Icons.wb_sunny_outlined
                  : Icons.nightlight_round,
            ),
            onPressed: () {
              themeNotifier.toggleTheme();
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          "FocusBloom UI – Coming Soon",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
} 
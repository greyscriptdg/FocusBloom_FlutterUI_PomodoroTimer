import 'package:flutter/material.dart';
import '../widgets/bloom_timer.dart';
import '../widgets/session_toggle_buttons.dart';
import '../../../theme/theme_notifier.dart';
import '../../models/session_type.dart';
import 'package:provider/provider.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const BloomTimer(),
          const SizedBox(height: 40),
          SessionToggleButtons(
            onSessionSelected: (SessionType session) {
              // Later: update timer duration & color
              debugPrint('Selected session: $session');
            },
          ),
        ],
      ),
    );
  }
}

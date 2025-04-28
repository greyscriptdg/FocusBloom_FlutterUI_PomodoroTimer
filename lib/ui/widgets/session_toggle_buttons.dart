import 'package:flutter/material.dart';
import '../../models/session_type.dart';

class SessionToggleButtons extends StatefulWidget {
  final Function(SessionType) onSessionSelected;

  const SessionToggleButtons({super.key, required this.onSessionSelected});

  @override
  State<SessionToggleButtons> createState() => _SessionToggleButtonsState();
}

class _SessionToggleButtonsState extends State<SessionToggleButtons> {
  SessionType _selectedSession = SessionType.work;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: SessionType.values.map((session) {
        final bool isSelected = session == _selectedSession;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: isSelected ? Colors.pinkAccent : Colors.grey.shade400,
                width: 2,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor:
                  isSelected ? Colors.pinkAccent.withOpacity(0.1) : Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            onPressed: () {
              setState(() {
                _selectedSession = session;
              });
              widget.onSessionSelected(session);
            },
            child: Text(
              _sessionLabel(session),
              style: TextStyle(
                color: isSelected ? Colors.pinkAccent : Colors.grey.shade600,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 16,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  String _sessionLabel(SessionType session) {
    switch (session) {
      case SessionType.work:
        return 'Work';
      case SessionType.shortBreak:
        return 'Short Break';
      case SessionType.longBreak:
        return 'Long Break';
    }
  }
}

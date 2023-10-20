import 'package:flutter/material.dart';
import 'package:zoom_clone/Widgets/meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  const MeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MeetingButton(
              onPressed: () {},
              text: 'New Meeting',
              icon: Icons.videocam,
            ),
            MeetingButton(
              onPressed: () {},
              text: 'Join Meeting',
              icon: Icons.add_box_rounded,
            ),
            MeetingButton(
              onPressed: () {},
              text: 'Schedule',
              icon: Icons.calendar_today,
            ),
            MeetingButton(
              onPressed: () {},
              text: 'Share Screen',
              icon: Icons.arrow_upward_rounded,
            ),
          ],
        ),
        const Expanded(
          child: Center(
            child: Text(
              'Create/Join Meetings with just a Click!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        )
      ],
    );
  }
}

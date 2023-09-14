import 'package:demo/model/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomChecker extends StatefulWidget {
  final String? event;
  final String eventname;
  const CustomChecker(
      {super.key, required this.event, required this.eventname});

  @override
  State<CustomChecker> createState() => _CustomCheckerState();
}

class _CustomCheckerState extends State<CustomChecker> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        widget.eventname,
        style: GoogleFonts.poppins(
            fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
      ),
      Material(
        child: Checkbox(
          activeColor: const Color(0xff013d6f),
            value: (widget.event == null) ? false : true, onChanged: (val) {}),
      )
    ]);
  }
}

class TeamDetails extends StatefulWidget {
  final String info;
  final User details;
  const TeamDetails({super.key, required this.info, required this.details});

  @override
  State<TeamDetails> createState() => _TeamDetailsState();
}

class _TeamDetailsState extends State<TeamDetails> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        widget.details.toString(),
        style: GoogleFonts.poppins(
            fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
      ),
    );
  }
}

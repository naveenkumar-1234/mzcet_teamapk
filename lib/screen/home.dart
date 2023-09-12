import 'package:demo/server/response.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Team List"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: fetchdata(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: Text("Working well"),
            );
          } else if (snapshot.hasError) {
            return Container(
              child: Text("Not working well"),
            );
          } else {
            return Container(
              child: Text("No"),
            );
          }
        },
      ),
    );
  }
}

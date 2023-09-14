import 'package:demo/functions/showusers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:demo/model/user.dart';

buildUsers(List<User> users) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemExtent: 80.0,
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];

          return GestureDetector(
            onTap: () {
              showDetails(context, user);
            },
            child: Card(
              child: ListTile(
                trailing: (user.screenshot==null)?Icon(Icons.error,color: Colors.red,):Icon(Icons.verified_rounded,color: Colors.green,),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                leading: CircleAvatar(
                  backgroundColor: const Color(0xff013d6f),
                  child: Text(
                    user.techquest_id,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(
                  user.teamName,
                  style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "From : ${user.collegeName}",
                  style: GoogleFonts.poppins(),
                ),
              ),
            ),
          );
        },
      ),
    );

import 'dart:convert';
import 'package:demo/reusables.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:demo/model/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home1 extends StatefulWidget {
  const Home1({Key? key}) : super(key: key);

  @override
  State<Home1> createState() => _Home1State();
}

const IconData group = IconData(0xe2eb, fontFamily: 'MaterialIcons');

class _Home1State extends State<Home1> {
  late Future<List<User>> usersFuture;
  Future<List<User>> users = getResponse();
  static Future<List<User>> getResponse() async {
    const url = 'https://mzcet.in/techquest23/returnjson.php';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> content = json.decode(response.body);
      return content.map((dynamic item) => User.fromJson(item)).toList();
    } else {
      throw Exception("Failed");
    }
  }

  TextEditingController _searchController = TextEditingController();
  List<User> filteredUsers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4eeee),
      appBar: AppBar(
        backgroundColor: const Color(0xff013d6f),
        elevation: 0,
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Team Details",
              style: GoogleFonts.robotoSlab(),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 7),
              child: Icon(group),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      border: Border.all(
                        color: Colors.grey,
                      )),
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(20.0),
                          suffixIcon: Icon(Icons.search),
                          hintText: "  Search",
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none)),
                ),
                // IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<User>>(
                future: getResponse(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error : ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final users = snapshot.data!;
                    return buildUsers(users);
                  } else {
                    return const Text("No data there");
                  }
                }),
          ),
        ],
      ),
    );
  }

//List_View_builder

  Widget buildUsers(List<User> users) => Padding(
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

  void showDetails(BuildContext context, User user) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Stack(
            children: [
              Center(
                child: SizedBox(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.4,
                    height: MediaQuery.of(context).size.height / 1.05,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                user.teamName,
                                style: GoogleFonts.robotoSlab(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  maxRadius: 28,
                                  backgroundColor: const Color(0xff013d6f),
                                  child: Text(
                                    user.techquest_id,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(color: Colors.black),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "College Name : ${user.collegeName}",
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Team Leader : ${user.teamLeader}",
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Email : ${user.email}",
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 8),
                              child: Text(
                                "Phone Number : ${user.phoneNumber.toString()}",
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: CustomChecker(
                                event: user.designup,
                                eventname: "DesignUp",
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: CustomChecker(
                                event: user.knowlegde,
                                eventname: "KnowledgeBowl",
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: CustomChecker(
                                event: user.codelog,
                                eventname: "CodeLog",
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: CustomChecker(
                                event: user.techvein,
                                eventname: "TechVein",
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: CustomChecker(
                                event: user.quizarddy,
                                eventname: "Quizardry",
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}

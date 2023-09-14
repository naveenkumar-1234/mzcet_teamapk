import 'package:demo/export/import.dart';

void showDetails(BuildContext context, User user) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Center(
              child: SizedBox(
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: MediaQuery.of(context).size.height / 1,
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
                            padding: const EdgeInsets.all(8.5),
                            child: Text(
                              "College Name : ${user.collegeName}",
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.5),
                            child: Text(
                              "Team Leader : ${user.teamLeader}",
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.5),
                            child: Text(
                              "Email : ${user.email}",
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.5),
                            child: Text(
                              "Phone Number : ${user.phoneNumber.toString()}",
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.5),
                            child: CustomChecker(
                              event: user.designup,
                              eventname: "DesignUp",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.5),
                            child: CustomChecker(
                              event: user.knowlegde,
                              eventname: "KnowledgeBowl",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.5),
                            child: CustomChecker(
                              event: user.codelog,
                              eventname: "CodeLog",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.5),
                            child: CustomChecker(
                              event: user.techvein,
                              eventname: "TechVein",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.5),
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

import 'package:auto_size_text/auto_size_text.dart';
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FittedBox(
                                fit: BoxFit.contain,
                                child: AutoSizeText(
                                  minFontSize: 25,
                                  maxFontSize: 30,
                                  user.teamName,
                                  style: GoogleFonts.robotoSlab(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    // fontSize: 30,
                                  ),
                                ),
                              ),
                            ],
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
                              style: DefaultStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.5),
                            child: Text(
                              "Team Leader : ${user.teamLeader}",
                              style: DefaultStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.5),
                            child: Text(
                              "Email : ${user.email}",
                              style: DefaultStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.5),
                            child: Text(
                              "Phone Number : ${user.phoneNumber.toString()}",
                              style: DefaultStyle,
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
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.5),
                                child: Text("Screenshot : " , style: DefaultStyle,),
                              ),
                              (user.screenshot == null)?Text("Screenshot not attached" , style: DefaultStyle,):ElevatedButton(
                                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color(0xff013d6f),)),
                                  onPressed: (){
                                Navigator.pop(context);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ScreenshotPage(imageUrl: user.screenshot!,)));
                              }, child: Text("show"))
                            ],
                          )
                        ]),
                  ),
                ),
              ),
            ),
          ],
        );
      });
}

class ScreenshotPage extends StatefulWidget {
  final String imageUrl;
  const ScreenshotPage({super.key , required this.imageUrl});

  @override
  State<ScreenshotPage> createState() => _ScreenshotPageState();
}

class _ScreenshotPageState extends State<ScreenshotPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Image.network("https://mzcet.in/techquest23"+widget.imageUrl,
          errorBuilder: (BuildContext context, Object exception,
              StackTrace? stackTrace) {
        return Text("Unable to load Image 😕",style: DefaultStyle,);
        },
          ),
        ),
      ),
    );
  }


}

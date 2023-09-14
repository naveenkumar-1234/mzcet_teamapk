import 'package:demo/export/import.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

List<User> filterUser = [];
final _searchController = TextEditingController();

class _HomeState extends State<Home> {
// late Future<List<User>> usersFuture;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F0F0),
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
                    ),
                  ),
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(20.0),
                        suffixIcon: Icon(Icons.search),
                        hintText: "  Search",
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none),
                    onChanged: (query) {
                      searchTeam(query);
                      print(_searchController.text);
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<User>>(
                future: users,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error : ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final users = snapshot.data!;
                    return buildUsers(
                        (filterUser.isEmpty) ? users : filterUser);
                  } else {
                    return const Text("No data there");
                  }
                }),
          ),
        ],
      ),
    );
  }

  void searchTeam(textValue) {
    final searchtext = users.then(
      (data) {
        return data.where((team) {
          final input = textValue.toLowerCase();
          final teamname = team.teamName.toLowerCase();
          return teamname.contains(input);
        }).toList();
      },
    );
    searchtext.then((result) {
      setState(() {
        filterUser = result;
      });
    });
  }
}

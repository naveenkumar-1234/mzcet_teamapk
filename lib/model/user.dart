class User {
  final String teamName;
  final String email;
  // ignore: non_constant_identifier_names
  final String techquest_id;
  final String collegeName;
  final String teamLeader;
  final String phoneNumber;
  final String? codelog;
  final String? techvein;
  final String? designup;
  final String? knowlegde;
  final String? quizarddy;

  User({
    required this.techvein,
    required this.designup,
    required this.quizarddy,
    required this.knowlegde,
    required this.codelog,
    required this.phoneNumber,
    required this.teamLeader,
    required this.collegeName,
    required this.teamName,
    required this.email,
    // ignore: non_constant_identifier_names
    required this.techquest_id,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        designup: json['CodeLog'],
        knowlegde: json['Knowlegde_Bowl'],
        techvein: json['Tech_vein'],
        quizarddy: json['Quizardry'],
        codelog: json['CodeLog'],
        phoneNumber: json['Mobile_No'],
        teamLeader: json['TeamLeader'],
        email: json['Email'],
        techquest_id: json['techquest_id'],
        teamName: json['TeamName'],
        collegeName: json['CollegeName']);
  }
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> user = <String, dynamic>{};
  //   user['Email'] = email;
  //   user['techquest_id'] = id;
  //   user['TeamName'] = teamname;
  //   return user;
  // }
}

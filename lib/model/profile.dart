class Profile {
  final bool autoplay;
  final String appLanguage;
  final bool groupWatch;
  final String fName;
  final String lName;
  final String username;

  Profile(this.autoplay, this.appLanguage, this.groupWatch, this.fName,
      this.lName, this.username);

  @override
  String toString() {
    return 'Profile [fNAme=$fName, lName=$lName, id=$username]';
  }

  Profile.fromJson(Map<String, dynamic> json)
      : autoplay = json['autoplay'],
        appLanguage = json['appLanguage'],
        groupWatch = json['groupWatch'],
        fName = json['fName'],
        lName = json['lName'],
        username = json['username'];

  Map<String, dynamic> toJson() => {
        'autoplay': autoplay,
        'appLanguage': appLanguage,
        'groupWatch': groupWatch,
        'fName': fName,
        'lName': lName,
        'username': username,
      };
}

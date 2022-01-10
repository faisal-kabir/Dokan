class Auth {
  Auth({
      this.token, 
      this.userEmail, 
      this.userNicename, 
      this.userDisplayName,});

  Auth.fromJson(dynamic json) {
    token = json['token'];
    userEmail = json['user_email'];
    userNicename = json['user_nicename'];
    userDisplayName = json['user_display_name'];
  }
  String? token;
  String? userEmail;
  String? userNicename;
  String? userDisplayName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['user_email'] = userEmail;
    map['user_nicename'] = userNicename;
    map['user_display_name'] = userDisplayName;
    return map;
  }

}
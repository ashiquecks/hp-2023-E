class AuthenticatonModal {
  AuthenticatonModal({
    required this.success,
    required this.message,
    required this.userData,
  });

  String success;
  String message;
  UserData userData;

  factory AuthenticatonModal.fromJson(Map<String, dynamic> json) =>
      AuthenticatonModal(
        success: json["success"],
        message: json["message"],
        userData: UserData.fromJson(json["user data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "user data": userData.toJson(),
      };
}

class UserData {
  UserData({
    required this.userId,
    required this.userName,
    required this.userPhone,
    required this.userLat,
    required this.userLong,
    required this.token,
  });

  String userId;
  String userName;
  String userPhone;
  String userLat;
  String userLong;
  String token;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        userId: json["user_id"],
        userName: json["user_name"],
        userPhone: json["user_phone"],
        userLat: json["user_lat"],
        userLong: json["user_long"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_name": userName,
        "user_phone": userPhone,
        "user_lat": userLat,
        "user_long": userLong,
        "token": token,
      };
}

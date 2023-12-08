class AddBannerModal {
  AddBannerModal({
    required this.success,
    required this.message,
    required this.bannerData,
  });

  String success;
  String message;
  BannerData bannerData;

  factory AddBannerModal.fromJson(Map<String, dynamic> json) => AddBannerModal(
        success: json["success"],
        message: json["message"],
        bannerData: BannerData.fromJson(json["banner data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "banner data": bannerData.toJson(),
      };
}

class BannerData {
  BannerData({
    required this.bannerId,
    required this.bannerImage,
    required this.bannerLink,
    required this.description,
  });

  String bannerId;
  String bannerImage;
  String bannerLink;
  String description;

  factory BannerData.fromJson(Map<String, dynamic> json) => BannerData(
        bannerId: json["banner_id"],
        bannerImage: json["banner_image"],
        bannerLink: json["banner_link"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "banner_id": bannerId,
        "banner_image": bannerImage,
        "banner_link": bannerLink,
        "description": description,
      };
}

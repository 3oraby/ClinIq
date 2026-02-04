class UserProfileModel {
  final String name;
  final String email;
  final String mobile;
  final String bloodGroup;
  final String height;
  final String weight;
  final String ailments;
  final String? profilePicUrl;

  UserProfileModel({
    required this.name,
    required this.email,
    required this.mobile,
    required this.bloodGroup,
    required this.height,
    required this.weight,
    required this.ailments,
    this.profilePicUrl,
  });

  // Factory for empty/mock data
  factory UserProfileModel.mock() {
    return UserProfileModel(
      name: "Dr. Ahmed",
      email: "ahmed@cliniq.com",
      mobile: "+20 123 456 7890",
      bloodGroup: "O+",
      height: "180 cm",
      weight: "75 kg",
      ailments: "None",
    );
  }
}

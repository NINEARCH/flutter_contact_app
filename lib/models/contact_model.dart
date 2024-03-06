class ContactModel {
  String firstName;
  String lastName;
  String thumbnailProfile;
  String largeProfile;
  String mediumProfile;
  String phone;
  String email;

  ContactModel({
    required this.firstName,
    required this.lastName,
    required this.thumbnailProfile,
    required this.largeProfile,
    required this.mediumProfile,
    required this.phone,
    required this.email
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
    firstName: json['name']['first'],
    lastName: json['name']['last'],
    largeProfile: json['picture']['large'],
    mediumProfile: json['picture']['medium'],
    thumbnailProfile: json['picture']['thumbnail'],
    phone: json['phone'],
    email: json['email']
  );
}
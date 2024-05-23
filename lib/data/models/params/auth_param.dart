class AuthParam {
  String? phoneNumber;
  String? email;
  String? firstName;
  String? lastName;
  String? profilePhoto;
  String? zipCode;
  String? dateOfBirth;

  AuthParam({
    this.phoneNumber,
    this.email,
    this.firstName,
    this.lastName,
    this.profilePhoto,
    this.zipCode,
    this.dateOfBirth,
  });

  AuthParam.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    profilePhoto = json['profile_photo'];
    zipCode = json['zip_code'];
    dateOfBirth = json['date_of_birth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['profile_photo'] = profilePhoto;
    data['zip_code'] = zipCode;
    data['date_of_birth'] = dateOfBirth;
    return data;
  }
}

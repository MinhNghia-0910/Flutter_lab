class User {
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;
  final String phone;
  final int age;
  final String birthDate;
  final String university;
  final String address;
  final String token;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.image,
    required this.phone,
    required this.age,
    required this.birthDate,
    required this.university,
    required this.address,
    required this.token,
  });

  // Chuyển đổi từ JSON
  factory User.formJson(Map<String, dynamic> json) {
    // ✅ XỬ LÝ ADDRESS ĐÚNG CÁCH
    String fullAddress = '';
    if (json['address'] != null && json['address'] is Map) {
      var addr = json['address'];
      fullAddress =
          '${addr['address'] ?? ''}, ${addr['city'] ?? ''}, ${addr['state'] ?? ''}, ${addr['postalCode'] ?? ''}';
    }

    return User(
      id: json['id'] ?? 0,
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      gender: json['gender'] ?? '',
      image: json['image'] ?? '',
      phone: json['phone'] ?? '',
      age: json['age'] ?? 0,
      birthDate: json['birthDate'] ?? '',
      university: json['university'] ?? '',
      address: fullAddress.isNotEmpty ? fullAddress : 'Không có địa chỉ',
      token: json['token'] ?? '',
    );
  }

  // Lấy tên đầy đủ
  String get fullName => '$firstName $lastName';
}

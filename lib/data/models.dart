class Character {
  dynamic id;
  String? firstName;
  String? lastName;
  String? fullName;
  String? title;
  String? family;
  String? image;
  String? imageUrl;

  Character(
      {this.id,
      this.firstName,
      this.lastName,
      this.fullName,
      this.title,
      this.family,
      this.image,
      this.imageUrl});

  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    fullName = json['fullName'];
    title = json['title'];
    family = json['family'];
    image = json['image'];
    imageUrl = json['imageUrl'];
  }
}

class UserEntity {
  final String name;
  final String avatar;
  final String email;
  final String birthDate;
  final bool salesNotification;
  final bool newArrivalsNotification;
  final bool deliveryStatusChanges;

  UserEntity(
      {this.name,
      this.avatar,
      this.email,
      this.birthDate,
      this.salesNotification,
      this.newArrivalsNotification,
      this.deliveryStatusChanges});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'avatar': avatar,
      'email': email,
      'birthDate': birthDate,
      'salesNotification': salesNotification,
      'newArrivalsNotification': newArrivalsNotification,
      'deliveryStatusChanges': deliveryStatusChanges
    };
  }

  UserEntity.fromFirestore(Map<String, dynamic> firestore)
      : name = firestore['name'],
        avatar = firestore['avatar'],
        email = firestore['email'],
        birthDate = firestore['birthDate'],
        salesNotification = firestore['salesNotification'],
        newArrivalsNotification = firestore['newArrivalsNotification'],
        deliveryStatusChanges = firestore['deliveryStatusChanges'];
}

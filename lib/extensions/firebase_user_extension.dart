part of 'extensions.dart';

extension FirebaseExtension on User {
  Pengguna convertToPengguna({
    String name = "No Name"
  }) =>
      Pengguna(this.uid, this.email,
          name: name,
          );

  Future<Pengguna> fromFirebase() async =>
      await PenggunaServices.getPengguna(this.uid);
}

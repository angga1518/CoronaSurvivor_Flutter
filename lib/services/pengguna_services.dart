part of 'services.dart';

class PenggunaServices {
  static CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection("pengguna");

  static Future<void> saveUser(Pengguna pengguna) async {
    _collectionReference.doc(pengguna.id).set({
      'email': pengguna.email,
      'name': pengguna.name,
    });
  }

  static Future<Pengguna> getUser(String id) async {
    DocumentSnapshot documentSnapshot =
        await _collectionReference.doc(id).get();
    return Pengguna(
      id,
      documentSnapshot.data()['email'],
      name: documentSnapshot.data()['name'],
    );
  }
}

part of 'models.dart';

class Reply {
  String idReply;
  String namaLengkap;
  String tanggalPost;
  String isi;

  Reply({this.idReply, this.namaLengkap, this.tanggalPost, this.isi});

  @override
  String toString() {
    return "[$idReply] - $isi";
  }
}

import 'dart:convert';

class Tugas {
  String judul;
  String deskripsi;

  Tugas({
    required this.judul,
    required this.deskripsi,
  });

  Tugas copyWith({
    String? judul,
    String? deskripsi,
  }) {
    return Tugas(
      judul: judul ?? this.judul,
      deskripsi: deskripsi ?? this.deskripsi,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'judul': judul,
      'deskripsi': deskripsi,
    };
  }

  factory Tugas.fromMap(Map<String, dynamic> map) {
    return Tugas(
      judul: map['judul'] ?? '',
      deskripsi: map['deskripsi'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Tugas.fromJson(String source) => Tugas.fromMap(json.decode(source));

  @override
  String toString() => 'Tugas(judul: $judul, deskripsi: $deskripsi)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Tugas &&
        other.judul == judul &&
        other.deskripsi == deskripsi;
  }

  @override
  int get hashCode => judul.hashCode ^ deskripsi.hashCode;
}
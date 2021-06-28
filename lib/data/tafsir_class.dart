import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Tafsir {
  final String titre;
  final String path;
  final String size;
  final int duration;
   bool isdownload;
  Tafsir({
    required this.titre,
    required this.path,
    required this.size,
    required this.duration,
    required this.isdownload,
  });

  Tafsir copyWith({
    String? titre,
    String? path,
    String? size,
    int? duration,
    bool? isdownload
  }) {
    return Tafsir(
      titre: titre ?? this.titre,
      path: path ?? this.path,
      size: size ?? this.size,
      duration: duration ?? this.duration,
        isdownload: isdownload ?? this.isdownload,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'titre': titre,
      'path': path,
      'size': size,
      'duration': duration,
      'isdownload': isdownload,
    };
  }

  factory Tafsir.fromMap(Map<String, dynamic> map) {
    return Tafsir(
      titre: map['titre'],
      path: map['path'],
      size: map['size'],
      duration: map['duration'],
      isdownload: false,
    );
  }

  factory Tafsir.fromDocumentSnapshot(DocumentSnapshot map) {
    return Tafsir(
      titre: map['titre'] as String,
      path: map['path'] as String,
      size: map['size'] as String,
      duration: map['duration'] as int,
       isdownload: false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Tafsir.fromJson(String source) => Tafsir.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Tafsir(title: $titre, path: $path, size: $size, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Tafsir &&
        other.titre == titre &&
        other.path == path &&
        other.size == size &&
        other.duration == duration;
  }

  @override
  int get hashCode {
    return titre.hashCode ^ path.hashCode ^ size.hashCode ^ duration.hashCode;
  }
}

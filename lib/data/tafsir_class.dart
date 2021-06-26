import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Tafsir {
  final String title;
  final String path;
  final String size;
  final int duration;
  Tafsir({
    required this.title,
    required this.path,
    required this.size,
    required this.duration,
  });

  Tafsir copyWith({
    String? title,
    String? path,
    String? size,
    int? duration,
  }) {
    return Tafsir(
      title: title ?? this.title,
      path: path ?? this.path,
      size: size ?? this.size,
      duration: duration ?? this.duration,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'path': path,
      'size': size,
      'duration': duration,
    };
  }

  factory Tafsir.fromMap(Map<String, dynamic> map) {
    return Tafsir(
      title: map['title'],
      path: map['path'],
      size: map['size'],
      duration: map['duration'],
    );
  }


  factory Tafsir.fromDocumentSnapshot(DocumentSnapshot map) {
    return Tafsir(
      title: map['title'],
      path: map['path'],
      size: map['size'],
      duration: map['duration'],
    );
  }


  String toJson() => json.encode(toMap());

  factory Tafsir.fromJson(String source) => Tafsir.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Tafsir(title: $title, path: $path, size: $size, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Tafsir &&
      other.title == title &&
      other.path == path &&
      other.size == size &&
      other.duration == duration;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      path.hashCode ^
      size.hashCode ^
      duration.hashCode;
  }
}

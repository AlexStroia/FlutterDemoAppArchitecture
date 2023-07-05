import 'package:demo_app_architecture/utils/extensions/string_extensions.dart';
import 'package:equatable/equatable.dart';

class Cat extends Equatable {
  final List<String> tags;
  final String id;
  final String owner;
  final String createdAt;
  final String updatedAt;

  const Cat({
    required this.tags,
    required this.id,
    required this.owner,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Cat.empty() => const Cat(
        tags: [],
        id: '',
        owner: '',
        createdAt: '',
        updatedAt: '',
      );

  @override
  List<Object?> get props => [
        tags,
        id,
        owner,
        createdAt,
        updatedAt,
      ];

  Cat copyWith({
    List<String>? tags,
    String? id,
    String? owner,
    String? createdAt,
    String? updatedAt,
  }) {
    return Cat(
      tags: tags ?? this.tags,
      id: id ?? this.id,
      owner: owner ?? this.owner,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory Cat.fromJson(Map<String, dynamic> json) {
    final createdAt = json['createdAt'] == 'null'
        ? ' '
        : json['createdAt'].toString().toDate();

    final updatedAt = json['updatedAt'] == 'null'
        ? ' '
        : json['updatedAt'].toString().toDate();
    return Cat(
      tags: List<String>.from(json['tags'] ?? []),
      id: json['_id'] == 'null' ? ' ' : json['_id'],
      owner: json['owner'] == 'null' ? ' ' : json['owner'],
      createdAt: json['createdAt'] == 'null' ? ' ' : createdAt,
      updatedAt: json['updatedAt'] == 'null' ? ' ' : updatedAt,
    );
  }
}

class Contact {
  final int? id;
  final String name;
  final String phone;
  final String email;
  final String address;
  final bool isFavorite;

  Contact({
    this.id,
    required this.name,
    required this.phone,
    this.email = '',
    this.address = '',
    this.isFavorite = false,
  });

  // Convert Contact object into a Map for SQLite
  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'address': address,
      'isFavorite': isFavorite ? 1 : 0,
    };
  }

  // Extract a Contact object from a Map from SQLite
  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      id: map['id'] as int?,
      name: map['name'] as String? ?? '',
      phone: map['phone'] as String? ?? '',
      email: map['email'] as String? ?? '',
      address: map['address'] as String? ?? '',
      isFavorite: (map['isFavorite'] as int? ?? 0) == 1,
    );
  }

  // Create a copy of Contact with updated fields
  Contact copyWith({
    int? id,
    String? name,
    String? phone,
    String? email,
    String? address,
    bool? isFavorite,
  }) {
    return Contact(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      address: address ?? this.address,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

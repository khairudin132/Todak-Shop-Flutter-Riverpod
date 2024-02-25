import 'dart:convert';

class Address {
  Address({
    this.id,
    this.name,
    this.phoneNumber,
    this.address1,
    this.address2,
    this.postcode,
    this.district,
    this.city,
    this.state,
    this.country,
  });

  int? id;
  String? name;
  String? phoneNumber;
  String? address1;
  String? address2;
  int? postcode;
  String? district;
  String? city;
  String? state;
  String? country;

  Address copyWith({
    int? id,
    String? name,
    String? phoneNumber,
    String? address1,
    String? address2,
    int? postcode,
    String? district,
    String? city,
    String? state,
    String? country,
  }) {
    return Address(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address1: address1 ?? this.address1,
      address2: address2 ?? this.address2,
      postcode: postcode ?? this.postcode,
      district: district ?? this.district,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
    );
  }

  Address.empty() {
    id = null;
    name = null;
    phoneNumber = null;
    address1 = null;
    address2 = null;
    postcode = null;
    district = null;
    city = null;
    state = null;
    country = null;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'address1': address1,
      'address2': address2,
      'postcode': postcode,
      'district': district,
      'city': city,
      'state': state,
      'country': country,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      address1: map['address1'] != null ? map['address1'] as String : null,
      address2: map['address2'] != null ? map['address2'] as String : null,
      postcode: map['postcode'] != null ? map['postcode'] as int : null,
      district: map['district'] != null ? map['district'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      state: map['state'] != null ? map['state'] as String : null,
      country: map['country'] != null ? map['country'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source) as Map<String, dynamic>);
}

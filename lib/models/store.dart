import 'dart:convert';

Store storeFromMap(String str) => Store.fromMap(json.decode(str));

String storeToMap(Store data) => json.encode(data.toMap());

class Store {
  int id;
  String name;
  String address;
  String phone;
  String email;
  String storeHours;
  String? website;
  String? additionalInformation;
  String latitude;
  String longitude;
  String sample;
  int gtStoreId;
  int janeStoreId;
  String handle;
  String title;
  dynamic delivery;
  String? license;
  String? licenseNumber;
  String? imageFileLink;
  String gtAccessToken;
  int isActive;
  String? distance;
  Store({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    required this.storeHours,
    this.website,
    this.additionalInformation,
    required this.latitude,
    required this.longitude,
    required this.sample,
    required this.gtStoreId,
    required this.janeStoreId,
    required this.handle,
    required this.title,
    required this.delivery,
    this.license,
    this.licenseNumber,
    this.imageFileLink,
    required this.gtAccessToken,
    required this.isActive,
    this.distance,
  });

  factory Store.fromMap(Map<String, dynamic> json) => Store(
        id: json["id"],
        name: json["name"] ?? "",
        address: json["address"] ?? "",
        phone: json["phone"] ?? "",
        email: json["email"] ?? "",
        storeHours: json["store_hours"] ?? "",
        website: json["website"] ?? "",
        additionalInformation: json["additional_information"] ?? "",
        latitude: json["latitude"],
        longitude: json["longitude"],
        sample: json["sample"] ?? "",
        gtStoreId: json["gt_store_id"] ?? "",
        janeStoreId: json["jane_store_id"] ?? "",
        handle: json["handle"] ?? "",
        title: json["title"] ?? json["name"] ?? "",
        delivery: json["delivery"] ?? "",
        license: json["license"] ?? "",
        licenseNumber: json["license_number"] ?? "",
        imageFileLink: json["image_file_link"] ?? "",
        gtAccessToken: json["gt_access_token"] ?? "",
        isActive: json["is_active"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "address": address,
        "phone": phone,
        "email": email,
        "store_hours": storeHours,
        "website": website,
        "additional_information": additionalInformation,
        "latitude": latitude,
        "longitude": longitude,
        "sample": sample,
        "gt_store_id": gtStoreId,
        "jane_store_id": janeStoreId,
        "handle": handle,
        "title": title,
        "delivery": delivery,
        "license": license,
        "license_number": licenseNumber,
        "image_file_link": imageFileLink,
        "gt_access_token": gtAccessToken,
        "is_active": isActive,
      };
}

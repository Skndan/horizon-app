import 'dart:convert';

class ProfileModel {
  String? id;
  bool? active;
  String? name;
  String? email;
  String? mobile;
  String? employeeId;
  Organisation? organisation;
  ProfilePic? profilePic;
  Address? address;
  Department? department;
  Department? designation;
  DateTime? dateOfJoining;
  String? reportingManager;
  String? gender;
  DateTime? dateOfBirth;
  String? employeeStatus;
  User? user;
  Shift? shift;

  ProfileModel({
    this.id,
    this.active,
    this.name,
    this.email,
    this.mobile,
    this.employeeId,
    this.organisation,
    this.profilePic,
    this.address,
    this.department,
    this.designation,
    this.dateOfJoining,
    this.reportingManager,
    this.gender,
    this.dateOfBirth,
    this.employeeStatus,
    this.user,
    this.shift,
  });

  factory ProfileModel.fromRawJson(String str) => ProfileModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    id: json["id"],
    active: json["active"],
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    employeeId: json["employeeId"],
    organisation: json["organisation"] == null ? null : Organisation.fromJson(json["organisation"]),
    profilePic: json["profilePic"] == null ? null : ProfilePic.fromJson(json["profilePic"]),
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    department: json["department"] == null ? null : Department.fromJson(json["department"]),
    designation: json["designation"] == null ? null : Department.fromJson(json["designation"]),
    dateOfJoining: json["dateOfJoining"] == null ? null : DateTime.parse(json["dateOfJoining"]),
    // reportingManager: json["reportingManager"],
    gender: json["gender"],
    dateOfBirth: json["dateOfBirth"] == null ? null : DateTime.parse(json["dateOfBirth"]),
    employeeStatus: json["employeeStatus"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    shift: json["shift"] == null ? null : Shift.fromJson(json["shift"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "active": active,
    "name": name,
    "email": email,
    "mobile": mobile,
    "employeeId": employeeId,
    "organisation": organisation?.toJson(),
    "profilePic": profilePic?.toJson(),
    "address": address?.toJson(),
    "department": department?.toJson(),
    "designation": designation?.toJson(),
    "dateOfJoining": "${dateOfJoining!.year.toString().padLeft(4, '0')}-${dateOfJoining!.month.toString().padLeft(2, '0')}-${dateOfJoining!.day.toString().padLeft(2, '0')}",
    "reportingManager": reportingManager,
    "gender": gender,
    "dateOfBirth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
    "employeeStatus": employeeStatus,
    "user": user?.toJson(),
    "shift": shift?.toJson(),
  };
}

class Address {
  String? id;
  bool? active;
  bool? isPrimary;
  String? label;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? state;
  String? country;
  String? pincode;

  Address({
    this.id,
    this.active,
    this.isPrimary,
    this.label,
    this.addressLine1,
    this.addressLine2,
    this.city,
    this.state,
    this.country,
    this.pincode,
  });

  factory Address.fromRawJson(String str) => Address.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["id"],
    active: json["active"],
    isPrimary: json["isPrimary"],
    label: json["label"],
    addressLine1: json["addressLine1"],
    addressLine2: json["addressLine2"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    pincode: json["pincode"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "active": active,
    "isPrimary": isPrimary,
    "label": label,
    "addressLine1": addressLine1,
    "addressLine2": addressLine2,
    "city": city,
    "state": state,
    "country": country,
    "pincode": pincode,
  };
}

class Department {
  String? id;
  bool? active;
  String? name;
  String? code;
  String? level;

  Department({
    this.id,
    this.active,
    this.name,
    this.code,
    this.level,
  });

  factory Department.fromRawJson(String str) => Department.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Department.fromJson(Map<String, dynamic> json) => Department(
    id: json["id"],
    active: json["active"],
    name: json["name"],
    code: json["code"],
    level: json["level"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "active": active,
    "name": name,
    "code": code,
    "level": level,
  };
}

class Organisation {
  String? id;
  bool? active;
  String? name;
  Department? type;
  String? email;
  String? mobile;

  Organisation({
    this.id,
    this.active,
    this.name,
    this.type,
    this.email,
    this.mobile,
  });

  factory Organisation.fromRawJson(String str) => Organisation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Organisation.fromJson(Map<String, dynamic> json) => Organisation(
    id: json["id"],
    active: json["active"],
    name: json["name"],
    type: json["type"] == null ? null : Department.fromJson(json["type"]),
    email: json["email"],
    mobile: json["mobile"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "active": active,
    "name": name,
    "type": type?.toJson(),
    "email": email,
    "mobile": mobile,
  };
}

class ProfilePic {
  String? id;
  bool? active;
  String? profile;
  Organisation? organisation;
  String? fileName;
  String? hash;
  String? fileUrl;

  ProfilePic({
    this.id,
    this.active,
    this.profile,
    this.organisation,
    this.fileName,
    this.hash,
    this.fileUrl,
  });

  factory ProfilePic.fromRawJson(String str) => ProfilePic.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProfilePic.fromJson(Map<String, dynamic> json) => ProfilePic(
    id: json["id"],
    active: json["active"],
    profile: json["profile"],
    organisation: json["organisation"] == null ? null : Organisation.fromJson(json["organisation"]),
    fileName: json["fileName"],
    hash: json["hash"],
    fileUrl: json["fileUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "active": active,
    "profile": profile,
    "organisation": organisation?.toJson(),
    "fileName": fileName,
    "hash": hash,
    "fileUrl": fileUrl,
  };
}

class Shift {
  String? id;
  bool? active;
  String? name;
  String? startTime;
  String? endTime;
  double? shiftDuration;
  bool? isDynamic;
  List<String>? workDays;

  Shift({
    this.id,
    this.active,
    this.name,
    this.startTime,
    this.endTime,
    this.shiftDuration,
    this.isDynamic,
    this.workDays,
  });

  factory Shift.fromRawJson(String str) => Shift.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Shift.fromJson(Map<String, dynamic> json) => Shift(
    id: json["id"],
    active: json["active"],
    name: json["name"],
    startTime: json["startTime"],
    endTime: json["endTime"],
    shiftDuration: json["shiftDuration"],
    isDynamic: json["isDynamic"],
    workDays: json["workDays"] == null ? [] : List<String>.from(json["workDays"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "active": active,
    "name": name,
    "startTime": startTime,
    "endTime": endTime,
    "shiftDuration": shiftDuration,
    "isDynamic": isDynamic,
    "workDays": workDays == null ? [] : List<dynamic>.from(workDays!.map((x) => x)),
  };
}

class User {
  String? id;
  bool? active;
  String? userName;
  String? password;
  bool? passwordSet;
  List<Role>? roles;

  User({
    this.id,
    this.active,
    this.userName,
    this.password,
    this.passwordSet,
    this.roles,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    active: json["active"],
    userName: json["userName"],
    password: json["password"],
    passwordSet: json["passwordSet"],
    roles: json["roles"] == null ? [] : List<Role>.from(json["roles"]!.map((x) => Role.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "active": active,
    "userName": userName,
    "password": password,
    "passwordSet": passwordSet,
    "roles": roles == null ? [] : List<dynamic>.from(roles!.map((x) => x.toJson())),
  };
}

class Role {
  String? id;
  bool? active;
  String? roleName;
  String? roleType;

  Role({
    this.id,
    this.active,
    this.roleName,
    this.roleType,
  });

  factory Role.fromRawJson(String str) => Role.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["id"],
    active: json["active"],
    roleName: json["roleName"],
    roleType: json["roleType"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "active": active,
    "roleName": roleName,
    "roleType": roleType,
  };
}

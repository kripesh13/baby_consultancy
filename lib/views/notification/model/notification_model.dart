class NotificationModel {
  int? httpStatus;
  String? message;
  List<Data>? data;
  int? pageSize;
  int? totalItems;

  NotificationModel(
      {this.httpStatus,
      this.message,
      this.data,
      this.pageSize,
      this.totalItems});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    httpStatus = json['httpStatus'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    pageSize = json['pageSize'];
    totalItems = json['totalItems'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['httpStatus'] = this.httpStatus;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['pageSize'] = this.pageSize;
    data['totalItems'] = this.totalItems;
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? description;
  dynamic url;
  bool? isAll;
  String? entityStatus;
  List ? createdAt;
  dynamic updatedAt;
  List<Students>? students;
  File? file;
  dynamic createdBy;

  Data(
      {this.id,
      this.title,
      this.description,
      this.url,
      this.isAll,
      this.entityStatus,
      this.createdAt,
      this.updatedAt,
      this.students,
      this.file,
      this.createdBy});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    isAll = json['isAll'];
    entityStatus = json['entityStatus'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['students'] != null) {
      students = <Students>[];
      json['students'].forEach((v) {
        students!.add(new Students.fromJson(v));
      });
    }
    file = json['file'] != null ? new File.fromJson(json['file']) : null;
    createdBy = json['createdBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['url'] = this.url;
    data['isAll'] = this.isAll;
    data['entityStatus'] = this.entityStatus;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.students != null) {
      data['students'] = this.students!.map((v) => v.toJson()).toList();
    }
    if (this.file != null) {
      data['file'] = this.file!.toJson();
    }
    data['createdBy'] = this.createdBy;
    return data;
  }
}

class Students {
  int? studentId;
  String? firstName;
  String? middleName;
  String? lastName;
  String? email;

  Students(
      {this.studentId,
      this.firstName,
      this.middleName,
      this.lastName,
      this.email});

  Students.fromJson(Map<String, dynamic> json) {
    studentId = json['studentId'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['studentId'] = this.studentId;
    data['firstName'] = this.firstName;
    data['middleName'] = this.middleName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    return data;
  }
}

class File {
  int? id;
  String? path;
  String? fileName;
  String? uniqueName;
  String? fileType;
  String? uploadType;

  File(
      {this.id,
      this.path,
      this.fileName,
      this.uniqueName,
      this.fileType,
      this.uploadType});

  File.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    path = json['path'];
    fileName = json['fileName'];
    uniqueName = json['uniqueName'];
    fileType = json['fileType'];
    uploadType = json['uploadType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['path'] = this.path;
    data['fileName'] = this.fileName;
    data['uniqueName'] = this.uniqueName;
    data['fileType'] = this.fileType;
    data['uploadType'] = this.uploadType;
    return data;
  }
}

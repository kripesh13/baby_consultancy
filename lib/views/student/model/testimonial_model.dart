class TestimonialModel {
  int? httpStatus;
  String? message;
  List<TestimonialData>? data;
  int? pageSize;
  int? totalItems;

  TestimonialModel(
      {this.httpStatus,
      this.message,
      this.data,
      this.pageSize,
      this.totalItems});

  TestimonialModel.fromJson(Map<String, dynamic> json) {
    httpStatus = json['httpStatus'];
    message = json['message'];
    if (json['data'] != null) {
      data = <TestimonialData>[];
      json['data'].forEach((v) {
        data!.add(new TestimonialData.fromJson(v));
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

class TestimonialData {
  int? id;
  String? studentName;
  String? universityName;
  String? courseName;
  String? location;
  String? description;
  bool? isActive;
  String? entityStatus;
 
  File? file;
  File? flag;

  TestimonialData(
      {this.id,
      this.studentName,
      this.universityName,
      this.courseName,
      this.location,
      this.description,
      this.isActive,
      this.entityStatus,
      this.file,
      this.flag});

  TestimonialData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentName = json['studentName'];
    universityName = json['universityName'];
    courseName = json['courseName'];
    location = json['location'];
    description = json['description'];
    isActive = json['isActive'];
    entityStatus = json['entityStatus'];
   
    file = json['file'] != null ? new File.fromJson(json['file']) : null;
    flag = json['flag'] != null ? new File.fromJson(json['flag']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['studentName'] = this.studentName;
    data['universityName'] = this.universityName;
    data['courseName'] = this.courseName;
    data['location'] = this.location;
    data['description'] = this.description;
    data['isActive'] = this.isActive;
    data['entityStatus'] = this.entityStatus;
    if (this.file != null) {
      data['file'] = this.file!.toJson();
    }
    if (this.flag != null) {
      data['flag'] = this.flag!.toJson();
    }
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

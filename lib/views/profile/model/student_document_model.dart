class StudentDocumentModel {
  int? httpStatus;
  String? message;
  Data? data;
  int? pageSize;
  int? totalItems;

  StudentDocumentModel(
      {this.httpStatus,
      this.message,
      this.data,
      this.pageSize,
      this.totalItems});

  StudentDocumentModel.fromJson(Map<String, dynamic> json) {
    httpStatus = json['httpStatus'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    pageSize = json['pageSize'];
    totalItems = json['totalItems'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['httpStatus'] = this.httpStatus;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['pageSize'] = this.pageSize;
    data['totalItems'] = this.totalItems;
    return data;
  }
}

class Data {
  MoiDetail? moiDetail;
  MoiDetail? firstLorDetail;
  Documents? documents;
  DynamicDocuments? dynamicDocuments;

  Data(
      {this.moiDetail,
      this.firstLorDetail,
      this.documents,
      this.dynamicDocuments});

  Data.fromJson(Map<String, dynamic> json) {
    moiDetail = json['moiDetail'] != null
        ? new MoiDetail.fromJson(json['moiDetail'])
        : null;
    firstLorDetail = json['firstLorDetail'] != null
        ? new MoiDetail.fromJson(json['firstLorDetail'])
        : null;
    documents = json['documents'] != null
        ? new Documents.fromJson(json['documents'])
        : null;
    dynamicDocuments = json['dynamicDocuments'] != null
        ? new DynamicDocuments.fromJson(json['dynamicDocuments'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.moiDetail != null) {
      data['moiDetail'] = this.moiDetail!.toJson();
    }
    if (this.firstLorDetail != null) {
      data['firstLorDetail'] = this.firstLorDetail!.toJson();
    }
    if (this.documents != null) {
      data['documents'] = this.documents!.toJson();
    }
    if (this.dynamicDocuments != null) {
      data['dynamicDocuments'] = this.dynamicDocuments!.toJson();
    }
    return data;
  }
}

class MoiDetail {
  int? id;
  String? referenceType;
  String? recommenderName;
  String? recommenderDesignation;
  String? relationWithApplicant;
  String? contactNumber;
  String? email;
  String? organizationName;
  String? organizationAddress;
  String? entityStatus;
  List ? createdDate;
 dynamic updatedDate;

  MoiDetail(
      {this.id,
      this.referenceType,
      this.recommenderName,
      this.recommenderDesignation,
      this.relationWithApplicant,
      this.contactNumber,
      this.email,
      this.organizationName,
      this.organizationAddress,
      this.entityStatus,
      this.createdDate,
      this.updatedDate});

  MoiDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    referenceType = json['referenceType'];
    recommenderName = json['recommenderName'];
    recommenderDesignation = json['recommenderDesignation'];
    relationWithApplicant = json['relationWithApplicant'];
    contactNumber = json['contactNumber'];
    email = json['email'];
    organizationName = json['organizationName'];
    organizationAddress = json['organizationAddress'];
    entityStatus = json['entityStatus'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['referenceType'] = this.referenceType;
    data['recommenderName'] = this.recommenderName;
    data['recommenderDesignation'] = this.recommenderDesignation;
    data['relationWithApplicant'] = this.relationWithApplicant;
    data['contactNumber'] = this.contactNumber;
    data['email'] = this.email;
    data['organizationName'] = this.organizationName;
    data['organizationAddress'] = this.organizationAddress;
    data['entityStatus'] = this.entityStatus;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    return data;
  }
}

class Documents {
  List<LORII>? lORII;
  List<TENTHGRADESHEET>? tENTHGRADESHEET;
  List<TENTHGRADESHEET>? lORI;

  Documents({this.lORII, this.tENTHGRADESHEET, this.lORI});

  Documents.fromJson(Map<String, dynamic> json) {
    if (json['LOR_II'] != null) {
      lORII = <LORII>[];
      json['LOR_II'].forEach((v) {
        lORII!.add(new LORII.fromJson(v));
      });
    }
    if (json['TENTH_GRADESHEET'] != null) {
      tENTHGRADESHEET = <TENTHGRADESHEET>[];
      json['TENTH_GRADESHEET'].forEach((v) {
        tENTHGRADESHEET!.add(new TENTHGRADESHEET.fromJson(v));
      });
    }
    if (json['LOR_I'] != null) {
      lORI = <TENTHGRADESHEET>[];
      json['LOR_I'].forEach((v) {
        lORI!.add(new TENTHGRADESHEET.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lORII != null) {
      data['LOR_II'] = this.lORII!.map((v) => v.toJson()).toList();
    }
    if (this.tENTHGRADESHEET != null) {
      data['TENTH_GRADESHEET'] =
          this.tENTHGRADESHEET!.map((v) => v.toJson()).toList();
    }
    if (this.lORI != null) {
      data['LOR_I'] = this.lORI!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LORII {
  int? id;
  String? path;
  String? fileName;
  String? uniqueName;
  String? fileType;
  String? uploadType;

  LORII(
      {this.id,
      this.path,
      this.fileName,
      this.uniqueName,
      this.fileType,
      this.uploadType});

  LORII.fromJson(Map<String, dynamic> json) {
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

class DynamicDocuments {
  List<OTHERDOCUMENT>? oTHERDOCUMENT;
  List<WARDDOCUMENT>? wARDDOCUMENT;
  List<WARDDOCUMENT>? nOCDOCUMENT;

  DynamicDocuments({this.oTHERDOCUMENT, this.wARDDOCUMENT, this.nOCDOCUMENT});

  DynamicDocuments.fromJson(Map<String, dynamic> json) {
    if (json['OTHER_DOCUMENT'] != null) {
      oTHERDOCUMENT = <OTHERDOCUMENT>[];
      json['OTHER_DOCUMENT'].forEach((v) {
        oTHERDOCUMENT!.add(new OTHERDOCUMENT.fromJson(v));
      });
    }
    if (json['WARD_DOCUMENT'] != null) {
      wARDDOCUMENT = <WARDDOCUMENT>[];
      json['WARD_DOCUMENT'].forEach((v) {
        wARDDOCUMENT!.add(new WARDDOCUMENT.fromJson(v));
      });
    }
    if (json['NOC_DOCUMENT'] != null) {
      nOCDOCUMENT = <WARDDOCUMENT>[];
      json['NOC_DOCUMENT'].forEach((v) {
        nOCDOCUMENT!.add(new WARDDOCUMENT.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.oTHERDOCUMENT != null) {
      data['OTHER_DOCUMENT'] =
          this.oTHERDOCUMENT!.map((v) => v.toJson()).toList();
    }
    if (this.wARDDOCUMENT != null) {
      data['WARD_DOCUMENT'] =
          this.wARDDOCUMENT!.map((v) => v.toJson()).toList();
    }
    if (this.nOCDOCUMENT != null) {
      data['NOC_DOCUMENT'] = this.nOCDOCUMENT!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OTHERDOCUMENT {
  int? id;
  String? title;
  String? entityStatus;
  List ? createdDate;
 dynamic updatedDate;
  LORII? file;

  OTHERDOCUMENT(
      {this.id,
      this.title,
      this.entityStatus,
      this.createdDate,
      this.updatedDate,
      this.file});

  OTHERDOCUMENT.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    entityStatus = json['entityStatus'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
    file = json['file'] != null ? new LORII.fromJson(json['file']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['entityStatus'] = this.entityStatus;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    if (this.file != null) {
      data['file'] = this.file!.toJson();
    }
    return data;
  }
}



class TENTHGRADESHEET {
  int? id;
  String? path;
  String? fileName;
  String? uniqueName;
  String? fileType;
  String? uploadType;

  TENTHGRADESHEET(
      {this.id,
      this.path,
      this.fileName,
      this.uniqueName,
      this.fileType,
      this.uploadType});

  TENTHGRADESHEET.fromJson(Map<String, dynamic> json) {
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

class WARDDOCUMENT {
  int? id;
  String? title;
  String? entityStatus;
  dynamic createdDate;
  dynamic updatedDate;
  File? file;

  WARDDOCUMENT(
      {this.id,
      this.title,
      this.entityStatus,
      this.createdDate,
      this.updatedDate,
      this.file});

  WARDDOCUMENT.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    entityStatus = json['entityStatus'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
    file = json['file'] != null ? new File.fromJson(json['file']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['entityStatus'] = this.entityStatus;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    if (this.file != null) {
      data['file'] = this.file!.toJson();
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

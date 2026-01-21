class ProfileModel {
  num? httpStatus;
  dynamic message;
  Data? data;
  num? pageSize;
  num? totalItems;
  ProfileModel({
    this.httpStatus,
    this.message,
    this.data,
    this.pageSize,
    this.totalItems,
  });
  ProfileModel.fromJson(Map<String, dynamic> json) {
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
  num? id;
  String? userType;
  String? entityStatus;
  List? createdDate;
  dynamic updatedDate;
  PersonalDetail? personalDetail;
  List<AcademicDetails>? academicDetails;
  WorkExperience? workExperience;
  List<TestDetails>? testDetails;
  File? file;
  List<Passport>? passport;
  List<Null>? resume;
  dynamic test;
  List<TenMarksheet>? tenMarksheet;
  List<TwelveMarksheet>? twelveMarksheet;
  List<Null>? underGraduate;
  List<PostGraduate>? postGraduate;
  Data({
    this.id,
    this.userType,
    this.entityStatus,
    this.createdDate,
    this.updatedDate,
    this.personalDetail,
    this.academicDetails,
    this.workExperience,
    this.testDetails,
    this.file,
    this.passport,
    this.resume,
    this.test,
    this.tenMarksheet,
    this.twelveMarksheet,
    this.underGraduate,
    this.postGraduate,
  });
  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userType = json['userType'];
    entityStatus = json['entityStatus'];
    createdDate = json['createdDate'].cast<int>();
    updatedDate = json['updatedDate'];
    personalDetail = json['personalDetail'] != null
        ? new PersonalDetail.fromJson(json['personalDetail'])
        : null;
    if (json['academicDetails'] != null) {
      academicDetails = <AcademicDetails>[];
      json['academicDetails'].forEach((v) {
        academicDetails!.add(new AcademicDetails.fromJson(v));
      });
    }
    workExperience = json['workExperience'] != null
        ? new WorkExperience.fromJson(json['workExperience'])
        : null;
    if (json['testDetails'] != null) {
      testDetails = <TestDetails>[];
      json['testDetails'].forEach((v) {
        testDetails!.add(new TestDetails.fromJson(v));
      });
    }
    file = json['file'] != null ? new File.fromJson(json['file']) : null;
    if (json['passport'] != null) {
      passport = <Passport>[];
      json['passport'].forEach((v) {
        passport!.add(new Passport.fromJson(v));
      });
    }
    // if (json['resume'] != null) {
    //   resume = <Null>[];
    //   json['resume'].forEach((v) {
    //     resume!.add(new Null.fromJson(v));
    //   });
    // }
    test = json['test'];
    if (json['tenMarksheet'] != null) {
      tenMarksheet = <TenMarksheet>[];
      json['tenMarksheet'].forEach((v) {
        tenMarksheet!.add(new TenMarksheet.fromJson(v));
      });
    }
    if (json['twelveMarksheet'] != null) {
      twelveMarksheet = <TwelveMarksheet>[];
      json['twelveMarksheet'].forEach((v) {
        twelveMarksheet!.add(new TwelveMarksheet.fromJson(v));
      });
    }
    // if (json['underGraduate'] != null) {
    //   underGraduate = <Null>[];
    //   json['underGraduate'].forEach((v) {
    //     underGraduate!.add(new Null.fromJson(v));
    //   });
    // }
    if (json['postGraduate'] != null) {
      postGraduate = <PostGraduate>[];
      json['postGraduate'].forEach((v) {
        postGraduate!.add(new PostGraduate.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userType'] = this.userType;
    data['entityStatus'] = this.entityStatus;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    if (this.personalDetail != null) {
      data['personalDetail'] = this.personalDetail!.toJson();
    }
    if (this.academicDetails != null) {
      data['academicDetails'] = this.academicDetails!
          .map((v) => v.toJson())
          .toList();
    }
    if (this.workExperience != null) {
      data['workExperience'] = this.workExperience!.toJson();
    }
    if (this.testDetails != null) {
      data['testDetails'] = this.testDetails!.map((v) => v.toJson()).toList();
    }
    if (this.file != null) {
      data['file'] = this.file!.toJson();
    }
    if (this.passport != null) {
      data['passport'] = this.passport!.map((v) => v.toJson()).toList();
    }
    // if (this.resume != null) {
    //   data['resume'] = this.resume!.map((v) => v.toJson()).toList();
    // }
    data['test'] = this.test;
    if (this.tenMarksheet != null) {
      data['tenMarksheet'] = this.tenMarksheet!.map((v) => v.toJson()).toList();
    }
    if (this.twelveMarksheet != null) {
      data['twelveMarksheet'] = this.twelveMarksheet!
          .map((v) => v.toJson())
          .toList();
    }
    // if (this.underGraduate != null) {
    //   data['underGraduate'] = this.underGraduate!
    //       .map((v) => v.toJson())
    //       .toList();
    // }
    if (this.postGraduate != null) {
      data['postGraduate'] = this.postGraduate!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PersonalDetail {
  dynamic id;
  String? firstName;
  String? middleName;
  String? lastName;
  String? email;
  String? mobile;
  List? dob;
  String? maritalStatus;
  bool? isPasswordResetRequired;
  MailingAddress? mailingAddress;
  MailingAddress? permanentAddress;
  PassportInfo? passportInfo;
  NationalityInfo? nationalityInfo;
  BackgroundInfo? backgroundInfo;
  dynamic additionalInformation;
  ImportantContact? importantContact;
  PersonalDetail({
    this.id,
    this.firstName,
    this.middleName,
    this.lastName,
    this.email,
    this.mobile,
    this.dob,
    this.maritalStatus,
    this.isPasswordResetRequired,
    this.mailingAddress,
    this.permanentAddress,
    this.passportInfo,
    this.nationalityInfo,
    this.backgroundInfo,
    this.additionalInformation,
    this.importantContact,
  });
  PersonalDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    email = json['email'];
    mobile = json['mobile'];
    dob = json['dob'].cast<int>();
    maritalStatus = json['maritalStatus'];
    isPasswordResetRequired = json['isPasswordResetRequired'];
    mailingAddress = json['mailingAddress'] != null
        ? new MailingAddress.fromJson(json['mailingAddress'])
        : null;
    permanentAddress = json['permanentAddress'] != null
        ? new MailingAddress.fromJson(json['permanentAddress'])
        : null;
    passportInfo = json['passportInfo'] != null
        ? new PassportInfo.fromJson(json['passportInfo'])
        : null;
    nationalityInfo = json['nationalityInfo'] != null
        ? new NationalityInfo.fromJson(json['nationalityInfo'])
        : null;
    backgroundInfo = json['backgroundInfo'] != null
        ? new BackgroundInfo.fromJson(json['backgroundInfo'])
        : null;
    additionalInformation = json['additionalInformation'];
    importantContact = json['importantContact'] != null
        ? new ImportantContact.fromJson(json['importantContact'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['middleName'] = this.middleName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['dob'] = this.dob;
    data['maritalStatus'] = this.maritalStatus;
    data['isPasswordResetRequired'] = this.isPasswordResetRequired;
    if (this.mailingAddress != null) {
      data['mailingAddress'] = this.mailingAddress!.toJson();
    }
    if (this.permanentAddress != null) {
      data['permanentAddress'] = this.permanentAddress!.toJson();
    }
    if (this.passportInfo != null) {
      data['passportInfo'] = this.passportInfo!.toJson();
    }
    if (this.nationalityInfo != null) {
      data['nationalityInfo'] = this.nationalityInfo!.toJson();
    }
    if (this.backgroundInfo != null) {
      data['backgroundInfo'] = this.backgroundInfo!.toJson();
    }
    data['additionalInformation'] = this.additionalInformation;
    if (this.importantContact != null) {
      data['importantContact'] = this.importantContact!.toJson();
    }
    return data;
  }
}

class MailingAddress {
  num? id;
  List? createdDate;
  dynamic updatedDate;
  String? entityStatus;
  String? address1;
  String? address2;
  String? country;
  String? state;
  String? city;
  String? postcode;
  MailingAddress({
    this.id,
    this.createdDate,
    this.updatedDate,
    this.entityStatus,
    this.address1,
    this.address2,
    this.country,
    this.state,
    this.city,
    this.postcode,
  });
  MailingAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdDate = json['createdDate'].cast<int>();
    updatedDate = json['updatedDate'];
    entityStatus = json['entityStatus'];
    address1 = json['address1'];
    address2 = json['address2'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    postcode = json['postcode'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    data['entityStatus'] = this.entityStatus;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['postcode'] = this.postcode;
    return data;
  }
}

class PassportInfo {
  num? id;
  List? createdDate;
  dynamic updatedDate;
  String? entityStatus;
  String? passportNumber;
  List? issueDate;
  List? expiryDate;
  String? issueCountry;
  String? birthCity;
  String? birthCountry;
  PassportInfo({
    this.id,
    this.createdDate,
    this.updatedDate,
    this.entityStatus,
    this.passportNumber,
    this.issueDate,
    this.expiryDate,
    this.issueCountry,
    this.birthCity,
    this.birthCountry,
  });
  PassportInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdDate = json['createdDate'].cast<int>();
    updatedDate = json['updatedDate'];
    entityStatus = json['entityStatus'];
    passportNumber = json['passportNumber'];
    issueDate = json['issueDate'].cast<int>();
    expiryDate = json['expiryDate'].cast<int>();
    issueCountry = json['issueCountry'];
    birthCity = json['birthCity'];
    birthCountry = json['birthCountry'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    data['entityStatus'] = this.entityStatus;
    data['passportNumber'] = this.passportNumber;
    data['issueDate'] = this.issueDate;
    data['expiryDate'] = this.expiryDate;
    data['issueCountry'] = this.issueCountry;
    data['birthCity'] = this.birthCity;
    data['birthCountry'] = this.birthCountry;
    return data;
  }
}

class NationalityInfo {
  num? id;
  List? createdDate;
  dynamic updatedDate;
  String? entityStatus;
  String? nationality;
  String? citizenship;
  bool? isMoreNationality;
  bool? isLivingOtherCountry;
  String? otherNationality;
  String? otherCountry;
  NationalityInfo({
    this.id,
    this.createdDate,
    this.updatedDate,
    this.entityStatus,
    this.nationality,
    this.citizenship,
    this.isMoreNationality,
    this.isLivingOtherCountry,
    this.otherNationality,
    this.otherCountry,
  });
  NationalityInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdDate = json['createdDate'].cast<int>();
    updatedDate = json['updatedDate'];
    entityStatus = json['entityStatus'];
    nationality = json['nationality'];
    citizenship = json['citizenship'];
    isMoreNationality = json['isMoreNationality'];
    isLivingOtherCountry = json['isLivingOtherCountry'];
    otherNationality = json['otherNationality'];
    otherCountry = json['otherCountry'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    data['entityStatus'] = this.entityStatus;
    data['nationality'] = this.nationality;
    data['citizenship'] = this.citizenship;
    data['isMoreNationality'] = this.isMoreNationality;
    data['isLivingOtherCountry'] = this.isLivingOtherCountry;
    data['otherNationality'] = this.otherNationality;
    data['otherCountry'] = this.otherCountry;
    return data;
  }
}

class BackgroundInfo {
  num? id;
  List? createdDate;
  dynamic updatedDate;
  String? entityStatus;
  bool? hasImmigrationHistory;
  String? immigrationCountry;
  bool? hasMedicalIssue;
  String? medicalIssueDetail;
  bool? hasVisaRefusal;
  String? visaRefusalDetail;
  String? visaName;
  bool? hasCriminalRecord;
  String? criminalRecordDetail;
  BackgroundInfo({
    this.id,
    this.createdDate,
    this.updatedDate,
    this.entityStatus,
    this.hasImmigrationHistory,
    this.immigrationCountry,
    this.hasMedicalIssue,
    this.medicalIssueDetail,
    this.hasVisaRefusal,
    this.visaRefusalDetail,
    this.visaName,
    this.hasCriminalRecord,
    this.criminalRecordDetail,
  });
  BackgroundInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdDate = json['createdDate'].cast<int>();
    updatedDate = json['updatedDate'];
    entityStatus = json['entityStatus'];
    hasImmigrationHistory = json['hasImmigrationHistory'];
    immigrationCountry = json['immigrationCountry'];
    hasMedicalIssue = json['hasMedicalIssue'];
    medicalIssueDetail = json['medicalIssueDetail'];
    hasVisaRefusal = json['hasVisaRefusal'];
    visaRefusalDetail = json['visaRefusalDetail'];
    visaName = json['visaName'];
    hasCriminalRecord = json['hasCriminalRecord'];
    criminalRecordDetail = json['criminalRecordDetail'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    data['entityStatus'] = this.entityStatus;
    data['hasImmigrationHistory'] = this.hasImmigrationHistory;
    data['immigrationCountry'] = this.immigrationCountry;
    data['hasMedicalIssue'] = this.hasMedicalIssue;
    data['medicalIssueDetail'] = this.medicalIssueDetail;
    data['hasVisaRefusal'] = this.hasVisaRefusal;
    data['visaRefusalDetail'] = this.visaRefusalDetail;
    data['visaName'] = this.visaName;
    data['hasCriminalRecord'] = this.hasCriminalRecord;
    data['criminalRecordDetail'] = this.criminalRecordDetail;
    return data;
  }
}

class ImportantContact {
  num? id;
  List? createdDate;
  dynamic updatedDate;
  String? entityStatus;
  String? name;
  String? phone;
  String? email;
  String? relationShip;
  ImportantContact({
    this.id,
    this.createdDate,
    this.updatedDate,
    this.entityStatus,
    this.name,
    this.phone,
    this.email,
    this.relationShip,
  });
  ImportantContact.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdDate = json['createdDate'].cast<int>();
    updatedDate = json['updatedDate'];
    entityStatus = json['entityStatus'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    relationShip = json['relationShip'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    data['entityStatus'] = this.entityStatus;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['relationShip'] = this.relationShip;
    return data;
  }
}

class AcademicDetails {
  num? id;
  String? entityStatus;
  String? countryOfEducation;
  String? stateOfStudy;
  String? levelOfStudy;
  String? universityName;
  String? qualificationAchieved;
  String? cityOfStudy;
  String? gradingSystem;
  String? score;
  String? primaryLanguage;
  List? startDate;
  dynamic endDate;
  String? academicType;
  AcademicDetails({
    this.id,
    this.entityStatus,
    this.countryOfEducation,
    this.stateOfStudy,
    this.levelOfStudy,
    this.universityName,
    this.qualificationAchieved,
    this.cityOfStudy,
    this.gradingSystem,
    this.score,
    this.primaryLanguage,
    this.startDate,
    this.endDate,
    this.academicType,
  });
  AcademicDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    entityStatus = json['entityStatus'];
    countryOfEducation = json['countryOfEducation'];
    stateOfStudy = json['stateOfStudy'];
    levelOfStudy = json['levelOfStudy'];
    universityName = json['universityName'];
    qualificationAchieved = json['qualificationAchieved'];
    cityOfStudy = json['cityOfStudy'];
    gradingSystem = json['gradingSystem'];
    score = json['score'];
    primaryLanguage = json['primaryLanguage'];
    startDate = json['startDate'].cast<int>();
    endDate = json['endDate'];
    academicType = json['academicType'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['entityStatus'] = this.entityStatus;
    data['countryOfEducation'] = this.countryOfEducation;
    data['stateOfStudy'] = this.stateOfStudy;
    data['levelOfStudy'] = this.levelOfStudy;
    data['universityName'] = this.universityName;
    data['qualificationAchieved'] = this.qualificationAchieved;
    data['cityOfStudy'] = this.cityOfStudy;
    data['gradingSystem'] = this.gradingSystem;
    data['score'] = this.score;
    data['primaryLanguage'] = this.primaryLanguage;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['academicType'] = this.academicType;
    return data;
  }
}

class WorkExperience {
  num? id;
  List? createdDate;
  dynamic updatedDate;
  String? entityStatus;
  String? organizationName;
  String? position;
  String? jobProfile;
  dynamic workingFrom;
  dynamic workingUpto;
  String? modeOfSalary;
  bool? isCurrentlyWorking;
  WorkExperience({
    this.id,
    this.createdDate,
    this.updatedDate,
    this.entityStatus,
    this.organizationName,
    this.position,
    this.jobProfile,
    this.workingFrom,
    this.workingUpto,
    this.modeOfSalary,
    this.isCurrentlyWorking,
  });
  WorkExperience.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdDate = json['createdDate'].cast<int>();
    updatedDate = json['updatedDate'];
    entityStatus = json['entityStatus'];
    organizationName = json['organizationName'];
    position = json['position'];
    jobProfile = json['jobProfile'];
    workingFrom = json['workingFrom'];
    workingUpto = json['workingUpto'];
    modeOfSalary = json['modeOfSalary'];
    isCurrentlyWorking = json['isCurrentlyWorking'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    data['entityStatus'] = this.entityStatus;
    data['organizationName'] = this.organizationName;
    data['position'] = this.position;
    data['jobProfile'] = this.jobProfile;
    data['workingFrom'] = this.workingFrom;
    data['workingUpto'] = this.workingUpto;
    data['modeOfSalary'] = this.modeOfSalary;
    data['isCurrentlyWorking'] = this.isCurrentlyWorking;
    return data;
  }
}

class TestDetails {
  num? id;
  List? createdDate;
  dynamic updatedDate;
  String? entityStatus;
  num? overallScore;
  dynamic examDate;
  num? quantitative;
  num? verbal;
  dynamic analyticWriting;
  num? integratedReasoning;
  String? testType;
  num? listening;
  num? reading;
  num? speaking;
  num? writing;
  bool? isResultReceivable;
  dynamic resultDate;
  bool? hasWaiver;
  num? englishMarks12th;
  String? mediumOfInstruction;
  dynamic readingAndWriting;
  dynamic math;
  dynamic essay;
  dynamic science;
  dynamic english;
  TestDetails({
    this.id,
    this.createdDate,
    this.updatedDate,
    this.entityStatus,
    this.overallScore,
    this.examDate,
    this.quantitative,
    this.verbal,
    this.analyticWriting,
    this.integratedReasoning,
    this.testType,
    this.listening,
    this.reading,
    this.speaking,
    this.writing,
    this.isResultReceivable,
    this.resultDate,
    this.hasWaiver,
    this.englishMarks12th,
    this.mediumOfInstruction,
    this.readingAndWriting,
    this.math,
    this.essay,
    this.science,
    this.english,
  });
  TestDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdDate = json['createdDate'].cast<int>();
    updatedDate = json['updatedDate'];
    entityStatus = json['entityStatus'];
    overallScore = json['overallScore'];
    examDate = json['examDate'];
    quantitative = json['quantitative'];
    verbal = json['verbal'];
    analyticWriting = json['analyticWriting'];
    integratedReasoning = json['integratedReasoning'];
    testType = json['testType'];
    listening = json['listening'];
    reading = json['reading'];
    speaking = json['speaking'];
    writing = json['writing'];
    isResultReceivable = json['isResultReceivable'];
    resultDate = json['resultDate'];
    hasWaiver = json['hasWaiver'];
    englishMarks12th = json['englishMarks12th'];
    mediumOfInstruction = json['mediumOfInstruction'];
    readingAndWriting = json['readingAndWriting'];
    math = json['math'];
    essay = json['essay'];
    science = json['science'];
    english = json['english'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    data['entityStatus'] = this.entityStatus;
    data['overallScore'] = this.overallScore;
    data['examDate'] = this.examDate;
    data['quantitative'] = this.quantitative;
    data['verbal'] = this.verbal;
    data['analyticWriting'] = this.analyticWriting;
    data['integratedReasoning'] = this.integratedReasoning;
    data['testType'] = this.testType;
    data['listening'] = this.listening;
    data['reading'] = this.reading;
    data['speaking'] = this.speaking;
    data['writing'] = this.writing;
    data['isResultReceivable'] = this.isResultReceivable;
    data['resultDate'] = this.resultDate;
    data['hasWaiver'] = this.hasWaiver;
    data['englishMarks12th'] = this.englishMarks12th;
    data['mediumOfInstruction'] = this.mediumOfInstruction;
    data['readingAndWriting'] = this.readingAndWriting;
    data['math'] = this.math;
    data['essay'] = this.essay;
    data['science'] = this.science;
    data['english'] = this.english;
    return data;
  }
}

class File {
  num? id;
  String? path;
  String? fileName;
  String? uniqueName;
  String? fileType;
  String? uploadType;
  File({
    this.id,
    this.path,
    this.fileName,
    this.uniqueName,
    this.fileType,
    this.uploadType,
  });
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

class PostGraduate {
  num? id;
  String? path;
  String? fileName;
  String? uniqueName;
  String? fileType;
  String? uploadType;

  PostGraduate({
    this.id,
    this.path,
    this.fileName,
    this.uniqueName,
    this.fileType,
    this.uploadType,
  });

  factory PostGraduate.fromJson(Map<String, dynamic> json) => PostGraduate(
    id: json['id'] as num?,
    path: json['path'] as String?,
    fileName: json['fileName'] as String?,
    uniqueName: json['uniqueName'] as String?,
    fileType: json['fileType'] as String?,
    uploadType: json['uploadType'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'path': path,
    'fileName': fileName,
    'uniqueName': uniqueName,
    'fileType': fileType,
    'uploadType': uploadType,
  };
}

class Passport {
  num? id;
  String? path;
  String? fileName;
  String? uniqueName;
  String? fileType;
  String? uploadType;

  Passport({
    this.id,
    this.path,
    this.fileName,
    this.uniqueName,
    this.fileType,
    this.uploadType,
  });

  factory Passport.fromJson(Map<String, dynamic> json) => Passport(
    id: json['id'] as num?,
    path: json['path'] as String?,
    fileName: json['fileName'] as String?,
    uniqueName: json['uniqueName'] as String?,
    fileType: json['fileType'] as String?,
    uploadType: json['uploadType'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'path': path,
    'fileName': fileName,
    'uniqueName': uniqueName,
    'fileType': fileType,
    'uploadType': uploadType,
  };
}

class TenMarksheet {
  num? id;
  String? path;
  String? fileName;
  String? uniqueName;
  String? fileType;
  String? uploadType;

  TenMarksheet({
    this.id,
    this.path,
    this.fileName,
    this.uniqueName,
    this.fileType,
    this.uploadType,
  });

  factory TenMarksheet.fromJson(Map<String, dynamic> json) => TenMarksheet(
    id: json['id'] as num?,
    path: json['path'] as String?,
    fileName: json['fileName'] as String?,
    uniqueName: json['uniqueName'] as String?,
    fileType: json['fileType'] as String?,
    uploadType: json['uploadType'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'path': path,
    'fileName': fileName,
    'uniqueName': uniqueName,
    'fileType': fileType,
    'uploadType': uploadType,
  };
}

class TwelveMarksheet {
  num? id;
  String? path;
  String? fileName;
  String? uniqueName;
  String? fileType;
  String? uploadType;

  TwelveMarksheet({
    this.id,
    this.path,
    this.fileName,
    this.uniqueName,
    this.fileType,
    this.uploadType,
  });

  factory TwelveMarksheet.fromJson(Map<String, dynamic> json) =>
      TwelveMarksheet(
        id: json['id'] as num?,
        path: json['path'] as String?,
        fileName: json['fileName'] as String?,
        uniqueName: json['uniqueName'] as String?,
        fileType: json['fileType'] as String?,
        uploadType: json['uploadType'] as String?,
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'path': path,
    'fileName': fileName,
    'uniqueName': uniqueName,
    'fileType': fileType,
    'uploadType': uploadType,
  };
}

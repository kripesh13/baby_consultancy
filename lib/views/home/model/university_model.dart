class UniversityModel {
  num ? httpStatus;
  String? message;
  List<UniversityData>? data;
  num ? pageSize;
  num ? totalItems;

  UniversityModel(
      {this.httpStatus,
      this.message,
      this.data,
      this.pageSize,
      this.totalItems});

  UniversityModel.fromJson(Map<String, dynamic> json) {
    httpStatus = json['httpStatus'];
    message = json['message'];
    if (json['data'] != null) {
      data = <UniversityData>[];
      json['data'].forEach((v) {
        data!.add(new UniversityData.fromJson(v));
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

class UniversityData {
  num ? id;
  String? programName;
  String? concentration;
  String? applicationDeadLine;
  String? studyLevel;
  String? duration;
  String? openIntakes;
  num ? intakeYear;
  String? entryRequirement;
  dynamic ieltsScore;
  num ? toeflScore;
  num ? pteScore;
  num ? detScore;
  String? applicationFee;
  String? yearlytutionfees;
  String? scholarShipDetail;
  bool? scholarShipAvailable;
  String? remarks;
  dynamic es;
  String? applicationMode;
  num ? universityId;
  String? universityName;
  String? country;
  String? universityRanking;
  String? websiteUrl;
  String? campus;

  UniversityData(
      {this.id,
      this.programName,
      this.concentration,
      this.applicationDeadLine,
      this.studyLevel,
      this.duration,
      this.openIntakes,
      this.intakeYear,
      this.entryRequirement,
      this.ieltsScore,
      this.toeflScore,
      this.pteScore,
      this.detScore,
      this.applicationFee,
      this.yearlytutionfees,
      this.scholarShipDetail,
      this.scholarShipAvailable,
      this.remarks,
      this.es,
      this.applicationMode,
      this.universityId,
      this.universityName,
      this.country,
      this.universityRanking,
      this.websiteUrl,
      this.campus});

  UniversityData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    programName = json['programName'];
    concentration = json['concentration'];
    applicationDeadLine = json['applicationDeadLine'];
    studyLevel = json['studyLevel'];
    duration = json['duration'];
    openIntakes = json['openIntakes'];
    intakeYear = json['intakeYear'];
    entryRequirement = json['entryRequirement'];
    ieltsScore = json['ieltsScore'];
    toeflScore = json['toeflScore'];
    pteScore = json['pteScore'];
    detScore = json['detScore'];
    applicationFee = json['applicationFee'];
    yearlytutionfees = json['yearlytutionfees'];
    scholarShipDetail = json['scholarShipDetail'];
    scholarShipAvailable = json['scholarShipAvailable'];
    remarks = json['remarks'];
    es = json['es'];
    applicationMode = json['applicationMode'];
    universityId = json['universityId'];
    universityName = json['universityName'];
    country = json['country'];
    universityRanking = json['universityRanking'];
    websiteUrl = json['websiteUrl'];
    campus = json['campus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['programName'] = this.programName;
    data['concentration'] = this.concentration;
    data['applicationDeadLine'] = this.applicationDeadLine;
    data['studyLevel'] = this.studyLevel;
    data['duration'] = this.duration;
    data['openIntakes'] = this.openIntakes;
    data['intakeYear'] = this.intakeYear;
    data['entryRequirement'] = this.entryRequirement;
    data['ieltsScore'] = this.ieltsScore;
    data['toeflScore'] = this.toeflScore;
    data['pteScore'] = this.pteScore;
    data['detScore'] = this.detScore;
    data['applicationFee'] = this.applicationFee;
    data['yearlytutionfees'] = this.yearlytutionfees;
    data['scholarShipDetail'] = this.scholarShipDetail;
    data['scholarShipAvailable'] = this.scholarShipAvailable;
    data['remarks'] = this.remarks;
    data['es'] = this.es;
    data['applicationMode'] = this.applicationMode;
    data['universityId'] = this.universityId;
    data['universityName'] = this.universityName;
    data['country'] = this.country;
    data['universityRanking'] = this.universityRanking;
    data['websiteUrl'] = this.websiteUrl;
    data['campus'] = this.campus;
    return data;
  }
}

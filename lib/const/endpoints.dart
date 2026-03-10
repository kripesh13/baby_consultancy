class Endpoints {
  static const String profile = "/api/current/student";
  static const String university = "/api/csv/courses/search?statusIn=ACTIVE&page=0&size=50";
  static const String studentDocument = "/api/student/document/";
  static const String uploadDocument = "/api/student/document/add";
  static const String notification = "/api/notice/all?statusIn=ACTIVE";

}


// {"studentId":452,"moiDetail":{"referenceType":"","recommenderName":"","recommenderDesignation":"","relationWithApplicant":"","contactNumber":"","email":"","organizationName":"","organizationAddress":""},"firstLorDetail":{"referenceType":"test","recommenderName":"test","recommenderDesignation":"test","relationWithApplicant":"test","contactNumber":"9816371621","email":"shubash@gmail.com","organizationName":"test","organizationAddress":"test"},"dynamicDocumentDetails":[{"title":"test","dynamicDocumentType":"WARD_DOCUMENT"}]}

// https://babyeducation.com.np/api/student/document/add

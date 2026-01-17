// import 'package:auto/core/const/design_constant.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:intl/intl.dart';

// String getMiddleName({required String fullName}) {
//   var names = fullName.trim().split(" ");
//   if (names.length == 3) {
//     return names[1];
//   } else if (names.length == 4) {
//     return "${names[1]} ${names[2]}";
//   } else {
//     return "";
//   }
// }

// String getLastName({required String fullName}) {
//   var names = fullName.trim().split(" ");
//   if (names.length == 3) {
//     return names[2];
//   } else if (names.length == 2) {
//     return names[1];
//   } else if (names.length == 4) {
//     return names[3];
//   } else {
//     return "";
//   }
// }

// String formatTime(int time) {
//   int hours = (time / 3600).floor();
//   int minutes = ((time % 3600) / 60).floor();
//   int seconds = (time % 60);
//   String hoursStr = (hours % 24).toString().padLeft(2, '0');
//   String minutesStr = minutes.toString().padLeft(2, '0');
//   String secondsStr = seconds.toString().padLeft(2, '0');

//   return '$hoursStr:$minutesStr:$secondsStr';
// }

// String formatDuration(int seconds) {
//   int hours = seconds ~/ 3600;
//   int minutes = (seconds % 3600) ~/ 60;
//   int remainingSeconds = seconds % 60;
//   String formattedTime = '';
//   if (hours > 0) {
//     formattedTime += '${hours.toString().padLeft(2, '0')} hour ';
//   }
//   if (minutes > 0 || hours > 0) {
//     formattedTime += '${minutes.toString().padLeft(2, '0')} mins ';
//   }
//   formattedTime += '${remainingSeconds.toString().padLeft(2, '0')} sec';
//   return formattedTime;
// }

// void launchPhone(String phoneNumber) async {
//   final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
//   if (await canLaunchUrl(phoneUri)) {
//     await launchUrl(phoneUri);
//   } else {
//     throw 'Could not launch phone dialer';
//   }
// }

// void launchEmail(String email) async {
//   final Uri url = Uri(scheme: 'mailto', path: email);
//   await launchUrl(url);
// }

// int getCrossAxisCount() {
//   if (deviceWidth < 450 || deviceHeight < 600) {
//     return 2;
//   } else if ((deviceWidth >= 450 && deviceWidth < 600) ||
//       (deviceHeight >= 600 && deviceHeight < 800)) {
//     return 3;
//   } else {
//     return 4;
//   }
// }

// String formatWithCommas(dynamic number) {
//   if (number == null) return "0";
//   final formatter = NumberFormat("#,##0", "en_US");

//   final parsed = num.tryParse(number.toString());
//   if (parsed == null) return number.toString();

//   return formatter.format(parsed);
// }
